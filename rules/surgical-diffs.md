---
trigger: always_on
description: "Enforce minimal, surgical diffs, confine linters and formatters to modified lines, prohibit drive-by refactoring, and defer out-of-scope cleanups to dedicated tasks."
---

# Surgical Diffs & Anti-Drive-By Refactoring

- **Minimal Scope of Edits**: Touch only the exact lines, functions, or files required to satisfy the approved plan or task. Avoid opportunistic cleanups, cosmetic reformatting, or tangential improvements.
- **Untouched Code Preservation**: Do not reformat untouched code blocks, normalize whitespace, or adjust indentation outside modified lines, even if existing code does not conform to current style guidelines.
- **Automated Tool & Linter Confinement**: Restrict linters, auto-formatters, and code-cleanup tools strictly to the modified lines. Prohibit running whole-file or repository-wide automated fixers (such as format-on-save or bulk auto-fix commands) that touch unedited lines or files.
- **No Unsolicited Symbol Renames**: Do not rename variables, parameters, functions, classes, or types outside the explicit scope of the change.
- **Preserve Documentation & Comments**: Keep all existing comments, docstrings, and license headers intact. Do not delete, rewrite, or inject unrequested comments or docstrings on untouched or existing code unless specifically instructed.
- **Preserve Imports & Structure**: Do not reorder, group, or clean up existing imports, namespaces, or file structures unless directly required by the modifications being made.
- **Propose Separate Cleanup Tasks**: When noticing architectural debt, naming inconsistencies, formatting defects, or refactoring opportunities outside the immediate task, flag them as separate follow-up proposals rather than bundling them into the active change.
