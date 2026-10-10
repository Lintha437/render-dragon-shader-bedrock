# Development history

The initial repository history was assembled from an existing local shader
project. Commits separate the engineering stages below instead of preserving
every intermediate generated file. Initial import author/committer dates were
curated during the import; they are not an untouched export of a prior Git log.

- Assess the partial Core definitions and recover native programs and indices.
- Separate GLSL/HLSL and consolidate variants into shared Pass/stage pipelines.
- Add native compilation, source verification and material packaging.
- Reproduce the world-loading failure and repair native ABI and resource layouts.
- Preserve original encryption and compare actual original/rebuilt containers.
- Confirm game loading, isolate local inputs, and prepare the public repository.

The original consolidation measurements and migration proofs remain historical
evidence in `metadata`. Later compatibility repairs intentionally change source
and are recorded separately. Automated validation was completed on 2026-10-16;
the maintainer reported successful game loading on 2026-10-17.
