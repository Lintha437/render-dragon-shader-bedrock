"""Publish concise material recipes and navigation from the export catalog."""
from collections import defaultdict
import json
import os
from project_model import ROOT, load_catalog


def main():
    catalog = load_catalog()
    folder = ROOT / "materials"
    folder.mkdir(exist_ok=True)
    index = ["# Material recipes", "", "Edit pipeline logic under HLSL/pipelines or GLSL/pipelines. Material recipes define default feature selections and list the shared source modules.", "",
             "| Material | Passes | Native shader records |", "|---|---:|---:|"]
    for material in catalog["materials"]:
        recipe = {"material": material["name"], "parent": material["parent"], "passes": {}}
        description = ["# "+material["name"], "", "Parent: `"+(material["parent"] or "none")+"`.", "",
                       "The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.", "",
                       "```powershell", "python tools/project.py build --material "+material["name"]+" --defaults", "```", ""]
        count = 0
        for render_pass in material["passes"]:
            flags, sources, profiles = defaultdict(set), defaultdict(lambda: defaultdict(set)), set()
            for variant in render_pass["variants"]:
                for name, value in variant["flags"].items():
                    flags[name].add(value)
                for shader in variant["shaders"]:
                    program = catalog["programs"][shader["program"]]
                    for language, source in program["sources"].items():
                        sources[shader["stage"]][language].add(source["path"])
                    profiles.add(program["original_profile"])
                    count += 1
            first = render_pass["variants"][0] if render_pass["variants"] else {"flags": {}}
            entry = {"default_features": first["flags"], "supported_features": {k: sorted(v) for k, v in sorted(flags.items())},
                     "sources": {stage: {language: sorted(paths) for language, paths in langs.items()} for stage, langs in sources.items()},
                     "native_profiles": sorted(profiles), "original_variants": len(render_pass["variants"])}
            recipe["passes"][render_pass["name"]] = entry
            description += ["## "+render_pass["name"], "", "Native profiles: "+(", ".join("`"+p+"`" for p in sorted(profiles)) or "none")+".", "",
                            "Default features: "+(", ".join(k+"="+v for k, v in first["flags"].items()) or "none")+".", ""]
            for stage, langs in entry["sources"].items():
                for language, paths in langs.items():
                    for path in paths:
                        link = os.path.relpath(ROOT / path, folder).replace("\\", "/")
                        description.append(f"- [{language.upper()} {stage}: {path.split('/')[-2]}/{path.split('/')[-1]}]({link})")
            description.append("")
        (folder / (material["name"]+".json")).write_text(json.dumps(recipe, indent=2)+"\n", encoding="utf-8")
        (folder / (material["name"]+".md")).write_text("\n".join(description)+"\n", encoding="utf-8")
        index.append(f"| [{material['name']}](materials/{material['name']}.md) | {len(material['passes'])} | {count} |")
    (ROOT / "MATERIALS.md").write_text("\n".join(index)+"\n", encoding="utf-8")
    print("Published", len(catalog["materials"]), "material recipes.")


if __name__ == "__main__":
    main()
