"""Package rebuilt native HLSL programs into the original material.bin layout."""
from __future__ import annotations
from hashlib import sha256
from io import BytesIO
import json
from pathlib import Path
import shutil
from build import source_fingerprint
from project_model import load_catalog, original_materials_dir

from lazurite.material import Material
from lazurite.material.shader_pass.supported_platforms import SupportedPlatforms

ROOT = Path(__file__).resolve().parents[1]


def preserve_platform_bits():
    original_parse = SupportedPlatforms.parse_bit_string
    original_get = SupportedPlatforms.get_bit_string
    def parse(self, bits, version):
        self.original_bit_string = bits
        return original_parse(self, bits, version)
    def get(self, version):
        if hasattr(self, "original_bit_string"):
            return self.original_bit_string
        return original_get(self, version)
    SupportedPlatforms.parse_bit_string = parse
    SupportedPlatforms.get_bit_string = get


def native_profile(code):
    import struct
    assert code[:4] == b"DXBC"
    count = struct.unpack_from("<I", code, 28)[0]
    for index in range(count):
        offset = struct.unpack_from("<I", code, 32 + 4*index)[0]
        if code[offset:offset+4] in (b"DXIL", b"SHDR", b"SHEX"):
            value = struct.unpack_from("<I", code, offset+8)[0]
            prefix = {0: "ps", 1: "vs", 5: "cs"}[value >> 16]
            return f"{prefix}_{(value >> 4) & 15}_{value & 15}"
    raise ValueError("A native shader program chunk is missing.")


def main():
    registry = load_catalog()
    report = json.loads((ROOT / "build/report.json").read_text(encoding="utf-8"))
    assert report["passed"] and report["compiled"] == 2*len(registry["programs"])
    interfaces = json.loads((ROOT / "build/native_contract_report.json").read_text(encoding="utf-8"))
    assert interfaces["passed"], "Native interfaces must match the original export contract."
    runtime = json.loads((ROOT / 'build/runtime_contract_report.json').read_text(encoding='utf-8'))
    assert runtime['passed'], 'Native resource declarations and complete stage linkage must match before export.'
    pipelines = json.loads((ROOT / 'build/native_pipeline_report.json').read_text(encoding='utf-8'))
    assert pipelines['passed'], 'Rebuilt pipelines must pass the D3D12 original/rebuilt creation probe.'
    preserve_platform_bits()
    native, native_bytes = {}, {}
    for digest, program in registry["programs"].items():
        result = json.loads((ROOT / "build/results/hlsl" / (digest+".json")).read_text(encoding="utf-8"))
        assert result["passed"]
        source = program["sources"]["hlsl"]
        fingerprint = source_fingerprint(source, 'hlsl')
        assert result["source_fingerprint"] == fingerprint, "Rebuild modified HLSL sources before packaging."
        binary_path = ROOT / result["binary"]
        code = binary_path.read_bytes()
        assert sha256(code).hexdigest() == interfaces["native_program_sha256"][digest], "Audit rebuilt native interfaces before packaging."
        assert sha256(code).hexdigest() == runtime['programs'][digest]['native_sha256'], 'Runtime resource audit is stale.'
        assert sha256(code).hexdigest() == pipelines['native_program_sha256'][digest], 'D3D12 pipeline creation probe is stale.'
        expected = program["original_profile"]
        actual = native_profile(code)
        if actual != expected:
            raise ValueError(f"Native target mismatch for {digest}: {actual}, expected {expected}")
        native[digest] = binary_path
        native_bytes[digest] = code
    output = ROOT / "dist/Renderer/materials"
    output.mkdir(parents=True, exist_ok=True)
    files, shaders = [], 0
    for template_path in sorted((ROOT / "templates/Renderer/materials").glob("*.json")):
        if template_path.name in ("materials.index.json", "MaterialTargets.json"):
            shutil.copyfile(template_path, output / template_path.name)
            continue
        template = json.loads(template_path.read_text(encoding="utf-8"))
        original_path = original_materials_dir() / Path(template['input_file']).name
        original_payload = original_path.read_bytes()
        assert sha256(original_payload).hexdigest() == template['input_sha256']
        # Keep the complete original container, including encryption state,
        # keys/nonces and fields omitted by JSON property serialization.
        material = Material()
        material.read(BytesIO(original_payload))
        assert len(material.passes) == len(template['passes'])
        for render_pass, pass_meta in zip(material.passes, template['passes']):
            assert len(render_pass.variants) == len(pass_meta['variants'])
            for variant, variant_meta in zip(render_pass.variants, pass_meta['variants']):
                assert len(variant.shaders) == len(variant_meta['shaders'])
                for shader, shader_meta in zip(variant.shaders, variant_meta['shaders']):
                    assert sha256(shader.bgfx_shader.shader_bytes).hexdigest() == shader_meta['sha256']
                    shader.bgfx_shader.shader_bytes = native_bytes[shader_meta['sha256']]
                    shaders += 1
        stream = BytesIO()
        material.write(stream)
        payload = stream.getvalue()
        name = template_path.stem + ".material.bin"
        target = output / name
        reread, check = Material(), BytesIO(payload)
        reread.read(check)
        assert check.tell() == len(payload)
        roundtrip = BytesIO()
        reread.write(roundtrip)
        assert roundtrip.getvalue() == payload
        assert reread.name == template["name"] and reread.parent == template["parent"]
        assert reread.version == template["version"]
        assert [b.serialize_properties() for b in reread.buffers] == template["buffers"]
        assert json.loads(json.dumps([u.serialize_properties() for u in reread.uniforms])) == template["uniforms"]
        assert reread.uniform_overrides == template["uniform_overrides"]
        assert [p.name for p in reread.passes] == [p["name"] for p in template["passes"]]
        for parsed_pass, pass_meta in zip(reread.passes, template["passes"]):
            assert parsed_pass.supported_platforms.original_bit_string == pass_meta["supported_platforms_raw_bits"]
            assert parsed_pass.flag_domain == pass_meta["flag_domain"]
            assert parsed_pass.fallback_pass == pass_meta["fallback_pass"]
            assert parsed_pass.output_binding_signature == pass_meta["output_binding_signature"]
            assert parsed_pass.serialize_properties(reread.version)["default_blend_mode"] == pass_meta["default_blend_mode"]
            assert len(parsed_pass.variants) == len(pass_meta["variants"])
            for variant, variant_meta in zip(parsed_pass.variants, pass_meta["variants"]):
                assert variant.flags == variant_meta["flags"]
                assert variant.is_supported == variant_meta["is_supported"]
                assert len(variant.shaders) == len(variant_meta["shaders"])
                for shader, shader_meta in zip(variant.shaders, variant_meta["shaders"]):
                    assert shader.bgfx_shader.shader_bytes == native_bytes[shader_meta["sha256"]]
                    assert shader.stage.name == shader_meta["stage"] and shader.platform.name == shader_meta["platform"]
                    assert shader.hash == shader_meta["hash"]
                    assert shader.bgfx_shader.serialize_properties() == shader_meta["bgfx_shader"]
                    assert [value.serialize_properties() for value in shader.inputs] == shader_meta["inputs"]
        # Compare the actual game container, not only our own JSON template.
        # Restoring its shader payloads must recover every original byte. This
        # also checks fields the high-level serializer might not expose.
        original = Material()
        original.read(BytesIO(original_payload))
        assert len(original.passes) == len(reread.passes)
        for source_pass, native_pass in zip(original.passes, reread.passes):
            assert len(source_pass.variants) == len(native_pass.variants)
            for source_variant, native_variant in zip(source_pass.variants, native_pass.variants):
                assert len(source_variant.shaders) == len(native_variant.shaders)
                for source_shader, native_shader in zip(source_variant.shaders, native_variant.shaders):
                    native_shader.bgfx_shader.shader_bytes = source_shader.bgfx_shader.shader_bytes
        restored = BytesIO()
        reread.write(restored)
        assert restored.getvalue() == original_payload, 'Container metadata differs from the actual game input.'
        target.write_bytes(payload)
        files.append({"file": name, "bytes": len(payload), "sha256": sha256(payload).hexdigest(),
                      "original_sha256": template["input_sha256"], "original_file": template["input_file"],
                      "byte_identical_to_original": sha256(payload).hexdigest() == template["input_sha256"],
                      "restoring_original_shader_payloads_recovers_original_bytes": True,
                      "original_encryption": original.encryption.name})
        print(f"Packed and verified {len(files)}/154: {name}", flush=True)
    assert len(files) == 154 and shaders == registry["shader_records"]
    package = {"passed": True, "files": files, "material_files": len(files), "shader_records": shaders,
               "all_payloads_rebuilt_from_hlsl": True, "original_native_profiles_preserved": True,
               "container_roundtrips_verified": True, "platform_bits_preserved": True,
               "actual_original_container_metadata_byte_exact_verified": True,
               "original_container_encryption_preserved": True,
               "required_native_interfaces_preserved": True,
               "native_resource_types_strides_and_extents_preserved": True,
               "native_stage_linkage_verified": True,
               "d3d12_pipeline_probe_regressions": len(pipelines['regressions']),
               "d3d12_pipeline_probe_original_successes": pipelines['original_successes'],
               "shader_identity_hash_policy": "Retained template identities, matching Lazurite's direct DXC build path.",
               "minecraft_runtime_loading_tested": False}
    (ROOT / "dist/pack_report.json").write_text(json.dumps(package, indent=2)+"\n", encoding="utf-8")
    print("Native material package verified.")


if __name__ == "__main__":
    main()
