# GitFlow

`main` contains released states. `develop` integrates the next release. Feature
branches start from `develop` and return to `develop` through merge pull requests.
Release branches start from `develop`, receive release-only fixes, merge into
`main`, receive a version tag, and merge back into `develop`. Hotfix branches start
from `main` and merge into both long-lived branches.

```text
develop -> feature/<name> -> PR -> develop
develop -> release/0.1.0  -> PR -> main -> v0.1.0
                                release -> PR -> develop
main    -> hotfix/<name>  -> PR -> main + develop
```

Use merge commits, not squash or rebase merging, to retain branch history and
individual work units. Use concise English commit subjects; commit descriptions
are optional. Do not push feature work directly to `main`.

The initial empty integration commit seeds `develop`; `main` is initialized from
that same seed reference before the first release PR. Source changes reach `main`
only through the release merge. The first repository import is described in
[development history](development-history.md).
