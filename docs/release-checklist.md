# Release checklist

1. Finish feature pull requests into `develop`; create `release/<version>` from it.
2. Run repository tests and catalog/source checks.
3. Import the matching private originals and run the complete Windows rebuild.
4. Check exact native signatures/resources and all original/rebuilt D3D12 pairs.
5. Confirm 154 packaged files, 52,175 new native payload records, original profiles,
   preserved encryption, and reversible original-container comparisons.
6. State the actual game test source and scope separately from automated results.
7. Check the tracked file list for original binaries, generated packages, compiler
   executables, private paths and credentials.
8. Update the changelog and version; merge the release PR into `main`.
9. Tag the released `main` commit, then merge the release branch back into `develop`.

Use concise English commit subjects. Release source archives must follow the
license and third-party notices; local game packages are not public repository
assets. GitHub CI validates the public tree and does not substitute for the local
Windows or game checks.
