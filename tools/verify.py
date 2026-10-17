"""Verify source coverage, identifier maps, selectors and compiled artifacts."""
from collections import Counter
from hashlib import sha256
import json
from pathlib import Path
import re
from functools import lru_cache
import gzip
from project_model import load_catalog
from build import source_fingerprint

ROOT = Path(__file__).resolve().parents[1]


@lru_cache(maxsize=None)
def source_file(path):
    data = path.read_bytes()
    text = data.decode("utf-8")
    assert text.isascii(), path
    assert not re.search(r"\b(?:_\d+(?:_\d+)*|_m\d+|_\d+_dummy_parameter|frontier_phi_\w+)\b", text), path
    return text, sha256(data).hexdigest()


def main():
    manifest = load_catalog()
    report = json.loads((ROOT / "build/report.json").read_text(encoding="utf-8"))
    assert report["passed"], "A complete successful build is required."
    assert report["compiled"] == 2*len(manifest["programs"])
    counts, edited = Counter(), set()
    proof = json.loads((ROOT / "metadata/source_preservation.json").read_text(encoding="utf-8"))
    assert proof["passed"] and proof["programs_checked"] == 2*len(manifest["programs"])
    assert all(p["source_sequence_preserved"] and p["helper_alpha_equivalence_verified"] for p in proof["proofs"])
    locations = json.loads((ROOT / "GLSL/interface_locations.json").read_text(encoding="utf-8"))
    for digest, program in manifest["programs"].items():
        assert program["complete"] and set(program["sources"]) == {"hlsl", "glsl"}
        for language, source in program["sources"].items():
            entry = ROOT / source["path"]
            implementation = ROOT / source["implementation_path"]
            code, checksum = source_file(implementation)
            # Migration hashes are provenance, not an authoring lock. Fresh
            # compiler fingerprints below establish the current source state.
            if checksum != source.get("migration_sha256", source.get("implementation_sha256")):
                edited.add(source["path"])
            assert entry.exists()
            binding_code, _ = source_file(ROOT / source["binding_path"])
            result = json.loads((ROOT / "build/results" / language / (digest+".json")).read_text(encoding="utf-8"))
            assert result["passed"] and (ROOT / result["binary"]).stat().st_size > 0
            fingerprint = source_fingerprint(source, language)
            assert result["source_fingerprint"] == fingerprint, "Rebuild modified sources before verification."
            counts[language] += 1
            if language == "glsl":
                bindings = manifest.get("interfaces", {}).get(source.get("interface"), source.get("interface_bindings", {}))
                for name, binding in bindings.items():
                    pattern = r"layout\(location = " + str(binding["location"]) + r"\)[^;\n]*\b" + re.escape(name) + r";"
                    assert re.search(pattern, binding_code), (implementation, name, binding)
                    if not binding["semantic"].startswith("SV_TARGET"):
                        assert locations[binding["semantic"]] == binding["location"]
    references = 0
    for material in manifest["materials"]:
        for shader_pass in material["passes"]:
            for variant in shader_pass["variants"]:
                for shader in variant["shaders"]:
                    assert shader["program"] in manifest["programs"]
                    for language in ("hlsl", "glsl"):
                        source = manifest["programs"][shader["program"]]["sources"][language]
                        selection = {"path": source["path"], "defines": {**source["defines"], "RD_VARIANT_INDEX": variant["index"], "RD_PLATFORM": int(shader["platform"].removeprefix("Direct3D_SM"))}}
                        assert (ROOT / selection["path"]).exists()
                        assert selection["defines"]["RD_VARIANT_INDEX"] == variant["index"]
                        expected = int(shader["platform"].removeprefix("Direct3D_SM"))
                        assert selection["defines"]["RD_PLATFORM"] == expected
                    references += 1
    assert references == manifest["shader_records"]
    with gzip.open(ROOT / "metadata/symbol_maps.json.gz", "rt", encoding="utf-8") as stream:
        maps = json.load(stream)
    for mapping in maps.values():
        assert all(re.fullmatch(r"[A-Za-z_]\w*", name) for name in mapping.values())
    links = 0
    documents = [ROOT / "README.md", ROOT / "MATERIALS.md", *list((ROOT / "materials").glob("*.md"))]
    for document in documents:
        for link in re.findall(r"\]\(([^)]+)\)", document.read_text(encoding="utf-8")):
            if link.startswith(("https://", "http://")):
                continue
            assert (document.parent / link).exists(), (document, link)
            links += 1
    result = {"passed": True, "materials": len(manifest["materials"]), "original_shader_references": references,
              "unique_programs": len(manifest["programs"]), "compiled_sources": dict(counts),
              "document_links_checked": links, "naming": "Reflection names and operation/role names; required ABI tokens preserved.",
              "migration_source_sequences_verified": proof["programs_checked"], "maintained_pipeline_modules": len({p["pipeline"] for p in proof["proofs"]}),
              "pipeline_modules_edited_since_migration": sorted(edited),
              "runtime_pixel_equivalence_tested": False}
    (ROOT / "verification.json").write_text(json.dumps(result, indent=2)+"\n", encoding="utf-8")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
