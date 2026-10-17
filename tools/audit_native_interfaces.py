"""Compare rebuilt native shader interfaces with the preserved original blobs."""
from collections import Counter
from hashlib import sha256
import json
from pathlib import Path
import struct
from project_model import load_catalog, snapshot_directory

ROOT = Path(__file__).resolve().parents[1]


def signatures(data):
    """Read D3D signature chunks without invoking a shader disassembler."""
    assert data[:4] == b"DXBC"
    result = {"input": [], "output": []}
    count = struct.unpack_from("<I", data, 28)[0]
    for i in range(count):
        offset = struct.unpack_from("<I", data, 32 + 4*i)[0]
        tag = data[offset:offset+4]
        if tag not in (b"ISGN", b"ISG1", b"OSGN", b"OSG1", b"OSG5"):
            continue
        size = struct.unpack_from("<I", data, offset+4)[0]
        payload = data[offset+8:offset+8+size]
        records = struct.unpack_from("<I", payload)[0]
        width = 32 if tag.endswith(b"1") else 28 if tag == b"OSG5" else 24
        for j in range(records):
            base = 8+j*width
            if width != 24:
                base += 4
            name_offset, index, system_value, component_type, register = struct.unpack_from("<5I", payload, base)
            end = payload.index(b"\0", name_offset)
            name = payload[name_offset:end].decode("ascii").upper()
            mask, access = struct.unpack_from("<2B", payload, base+20)
            result["input" if tag.startswith(b"ISG") else "output"].append(
                {"semantic": name, "index": index, "type": component_type,
                 "mask": mask, "access": access, "system_value": system_value, "register": register})
    return result


def main():
    snapshot = snapshot_directory()
    manifest = load_catalog()
    template_path = ROOT / "templates/native_interfaces.json"
    if template_path.exists():
        contracts = json.loads(template_path.read_text(encoding="utf-8"))
    else:
        contracts = {}
        for digest in manifest["programs"]:
            payload = (snapshot / digest[:2] / (digest+".bin")).read_bytes()
            assert sha256(payload).hexdigest() == digest
            contracts[digest] = signatures(payload)
        template_path.write_text(json.dumps(contracts, indent=2)+"\n", encoding="utf-8")
    failures, counts, unavailable, binary_hashes = [], Counter(), [], {}
    for digest, program in manifest["programs"].items():
        original = contracts[digest]
        result = json.loads((ROOT / "build/results/hlsl" / (digest+".json")).read_text(encoding="utf-8"))
        if not result["passed"]:
            unavailable.append(digest)
            continue
        payload = (ROOT / result["binary"]).read_bytes()
        binary_hashes[digest] = sha256(payload).hexdigest()
        compiled = signatures(payload)
        for direction in ("input", "output"):
            actual = {(s["semantic"], s["index"]): s for s in compiled[direction]}
            for row in original[direction]:
                key = row["semantic"], row["index"]
                match = actual.get(key)
                if match is None or any(match[field] != row[field] for field in ('type', 'mask', 'register', 'system_value')):
                    failures.append({"program": digest, "material": program["context"]["material"],
                                     "direction": direction, "original": row, "rebuilt": match})
                counts[direction] += 1
    report = {"passed": not failures and not unavailable, "native_programs": len(manifest["programs"]),
              "uncompiled_programs": unavailable,
              "native_program_sha256": binary_hashes,
              "required_semantics_checked": dict(counts), "failures": failures,
              "scope": "All original semantics, including unused fields, component types, exact masks, registers and system values.",
              "runtime_pixel_equivalence_tested": False}
    (ROOT / "build/native_contract_report.json").write_text(json.dumps(report, indent=2)+"\n", encoding="utf-8")
    print(json.dumps({key: value for key, value in report.items() if key not in ("failures", "native_program_sha256")}, indent=2))
    print("Interface differences:", len(failures))
    raise SystemExit(0 if report["passed"] else 1)


if __name__ == "__main__":
    main()
