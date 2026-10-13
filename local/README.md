# Local-only dependencies and inputs

Everything in this directory except this README is ignored by Git.

- `config.json`: machine-specific material, baseline and compiler paths.
- `originals/`: optional location for user-supplied original material files.
- `reference/shaders/`: imported original bytecode and reflection, generated locally.
- `toolchain/`: optional compiler installations; keep their required DLLs nearby.

Use `python tools/configure.py --help` and `python tools/import_originals.py --help`.
Original game files and compiler distributions must not be committed.
