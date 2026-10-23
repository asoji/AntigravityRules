# AGENTS.md

This repository stores personal rule definitions for Google Antigravity under `rules/`. Any AI agent operating in this repository must read and adhere to the rule files in `rules/` and follow the authoring conventions below.

## Active Rules (`rules/`)

- `rules/agent-attribution.md`: Require Markdown H5 attribution footers on agent-authored PRs, issues, reviews, and comments, add single-line provenance comments on non-trivial AI-generated code blocks, and prohibit AI identities in package manifests, license headers, tags, or release notes.
- `rules/direct-communication.md`: Enforce direct, concise, and technical communication without filler, sycophancy, apologetic meta-commentary, or unnecessary em-dashes.
- `rules/explain-before-executing.md`: Announce all tool calls, file reads, and shell commands with their target paths/arguments and rationale in text before execution.
- `rules/git-commit-attribution.md`: Use the `Assisted-by:` trailer (`AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]`) instead of `Co-authored-by:`, never add `Signed-off-by:`, and deduplicate trailers on AI-assisted Git commits.
- `rules/git-pr-workflow.md`: Enforce a branch-and-PR Git workflow using standard `git` tooling, concise under-50-character commits, and no direct commits to the default branch.
- `rules/github-stacked-prs.md`: Use GitHub Stacked PRs (`gh stack`) to structure and manage dependent pull request chains when working on GitHub repositories.
- `rules/plan-before-acting.md`: Default to planning mode, prohibit unapproved file or system mutations, and re-review the agreed plan before acting without deviation.

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
