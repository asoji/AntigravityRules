# AGENTS.md

This repository stores personal rule definitions for Google Antigravity under `rules/`. Any AI agent operating in this repository must read and adhere to the rule files in `rules/` and follow the authoring conventions below.

## Active Rules (`rules/`)

- `rules/agent-attribution.md`: Require plaintext attribution footers on agent-authored PRs, issues, reviews, and comments, add single-line provenance comments on non-trivial AI-generated code blocks, and prohibit AI identities in package manifests, license headers, tags, or release notes.
- `rules/direct-communication.md`: Enforce direct, concise, and technical communication without filler, sycophancy, apologetic meta-commentary, or unnecessary em-dashes.
- `rules/explain-before-executing.md`: Require announcing all tool calls, file reads, and shell commands with their target paths/arguments and rationale in text before execution.
- `rules/git-commit-attribution.md`: Use the `Assisted-by:` trailer (`AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]`) instead of `Co-authored-by:`, never add `Signed-off-by:`, and deduplicate trailers on AI-assisted Git commits.
- `rules/git-pr-workflow.md`: Enforce a branch-and-PR Git workflow using standard `git` tooling, concise under-50-character commits, and no direct commits to the default branch.
- `rules/github-stacked-prs.md`: Use GitHub Stacked PRs (`gh stack`) to structure and manage dependent pull request chains when working on repositories hosted on GitHub.
- `rules/markdown-file-boundaries.md`: Enforce allowlist-only Markdown file access: restrict agent Markdown writes strictly to `AGENTS.md`, rules, and scratchpads; all other Markdown files are human-exclusive.
- `rules/no-silent-fallbacks.md`: Prohibit silent fallbacks, dummy default returns, and swallowed exceptions; require failing loudly or propagating errors unless a fallback is explicitly specified.
- `rules/no-speculative-deps.md`: Prioritize standard library and official ecosystem libraries; prohibit adding third-party dependencies without clear justification and explicit user approval.
- `rules/plan-before-acting.md`: Default to planning mode, prohibit unapproved file or system mutations, and require re-reviewing the agreed plan before acting without deviation.
- `rules/preview-options-and-diffs.md`: Require creating temporary clickable preview files and displaying inline diffs whenever presenting multiple code or file options to the user.
- `rules/surgical-diffs.md`: Enforce minimal, surgical diffs, confine linters and formatters to modified lines, prohibit drive-by refactoring, and defer out-of-scope cleanups to dedicated tasks.
- `rules/verify-or-disclose.md`: Prohibit guessing APIs, CLI flags, or configuration keys without verification; require evidence-backed code and explicit disclosure of unverified assumptions.

## Rule Authoring & Maintenance Conventions

When creating or editing rule files in `rules/`:

- **File Naming**: Place each rule in `rules/` using a descriptive lowercase `kebab-case.md` filename scoped to a single concern.
- **YAML Frontmatter**: Begin every rule file with YAML frontmatter defining `trigger` (`always_on`, `model_decision`, `glob`, or `manual`) and a double-quoted `description`:
  ```markdown
  ---
  trigger: always_on
  description: "Concise imperative summary of what the rule enforces."
  ---
  ```
- **Structure & Style**:
  - Start the Markdown body with a single `# Title` heading followed by concise, imperative bullet points. Use `##` subsections and fenced code blocks when format specifications or examples add clarity.
  - Ensure all rule prose complies with `rules/direct-communication.md` (concise, technical phrasing, no filler, and no em-dashes used in place of standard punctuation).
- **Synchronization**: Update the rule index in `AGENTS.md` whenever files in `rules/` are added, renamed, or removed.
- **Plugin Versioning (0ver)**: Maintain the plugin version in `plugin.json` adhering to Zero-based Versioning (`0.MINOR.PATCH`):
  - Increment the `MINOR` version (e.g., `0.1.0` -> `0.2.0`) whenever a new rule or large architectural change is added.
  - Increment the `PATCH` version (e.g., `0.1.0` -> `0.1.1`) whenever a small fix, typo correction, or minor edit is made to existing rules.
  - Keep the major version pinned to `0`.
