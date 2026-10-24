---
trigger: always_on
description: "Require plaintext attribution footers on agent-authored PRs, issues, reviews, and comments, add single-line provenance comments on non-trivial AI-generated code blocks, and prohibit AI identities in package manifests, license headers, tags, or release notes."
---

# Agent Attribution

## Pull Requests, Issues, Reviews, and Comments

- **Footer Format**: Append a plaintext attribution footer separated by a horizontal rule (`---`) at the end of AI-assisted pull request descriptions, PR reviews, issues, and comments authored by the agent:
  ```markdown
  ---
  Assisted by Google Antigravity (gemini-4-argon)
  ```
- **No Promotional Badges**: Do not include emojis, promotional links, or marketing phrasing (such as `Generated with ...`).

## Source Code Provenance (Non-Trivial Blocks)

- **Comment Format**: When generating a new source file, function, or non-trivial logic block, place a single-line comment directly above it stating the agent, model, and date (`YYYY-MM-DD`) using the syntax of the target language:
  ```csharp
  // Assisted-by: Antigravity:gemini-4-argon (2026-10-23)
  ```
- **Scope**: Omit provenance comments on trivial one-line edits, simple getters/properties, or file formats that do not support comments (such as `.json`).

## Prohibited Attribution Surfaces

- **Package Manifests & License Headers**: Never add AI identities to `authors`, `contributors`, or `maintainers` fields in package manifests (`package.json`, `Cargo.toml`, `pyproject.toml`, `.csproj`, etc.) or copyright/license headers.
- **Tags & Releases**: Do not add `Assisted-by:` trailers or attribution footers to annotated Git tag messages (`git tag -a` / `-s`) or release notes unless explicitly requested by the user.
