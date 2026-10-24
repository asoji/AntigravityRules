# AntigravityRules

Personal repository of Rules I use with Google Antigravity, since I'm somewhat forced to use AI for work and other shit from time to time.

My stances on AI/LLMs is still nearly the same as it always is if you know me, and I do not enjoy using it, but some rules must be broken from time to time. If you're going to use it, use it as a tool/an assist, and triple, maybe even quadruple check your work and what it outposts. Surprise surprise, the hallucination machine hallucinates, even if it's a so-called `fRonTiEr` model.

> [!TIP]
> Installing as an [Antigravity Plugin](https://antigravity.google/docs/plugins) is preferred (`agy plugin install https://github.com/asoji/AntigravityRules`).

To install, follow Google Antigravity's official instructions on installing Rules or Plugins:
- **Plugin (Preferred)**: [Plugins Documentation](https://antigravity.google/docs/plugins) (`agy plugin install https://github.com/asoji/AntigravityRules`)
- **Standalone Rules**: [Project Scoped](https://antigravity.google/docs/rules/#directory-scoped-rules) / [Global](https://antigravity.google/docs/rules/#global-rules)

## Rules

| Rule | Trigger | Description |
| :--- | :--- | :--- |
| [`agent-attribution.md`](rules/agent-attribution.md) | `always_on` | Require Markdown H5 attribution footers on agent-authored PRs, issues, reviews, and comments, add single-line provenance comments on non-trivial AI-generated code blocks, and prohibit AI identities in package manifests, license headers, tags, or release notes. |
| [`direct-communication.md`](rules/direct-communication.md) | `always_on` | Enforce direct, concise, and technical communication without filler, sycophancy, apologetic meta-commentary, or unnecessary em-dashes. |
| [`explain-before-executing.md`](rules/explain-before-executing.md) | `always_on` | Require announcing all tool calls, file reads, and shell commands with their target paths, arguments, and rationale before execution. |
| [`git-commit-attribution.md`](rules/git-commit-attribution.md) | `always_on` | Use the `Assisted-by:` trailer (`AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]`) instead of `Co-authored-by:`, prohibit `Signed-off-by:`, and deduplicate trailers on AI-assisted commits. |
| [`git-pr-workflow.md`](rules/git-pr-workflow.md) | `always_on` | Enforce a branch-and-PR Git workflow using standard `git` tooling, under-50-character commit subjects, and no direct commits to the default branch. |
| [`github-stacked-prs.md`](rules/github-stacked-prs.md) | `model_decision` | Use GitHub Stacked PRs (`gh stack`) to structure and manage dependent pull request chains on GitHub repositories. |
| [`markdown-file-boundaries.md`](rules/markdown-file-boundaries.md) | `always_on` | Enforce allowlist-only Markdown file access, restricting agent Markdown writes to AGENTS.md, rules, and scratchpads. |
| [`plan-before-acting.md`](rules/plan-before-acting.md) | `always_on` | Default to planning mode, prohibit unapproved file or system mutations, and re-review the agreed plan before acting without deviation. |
| [`preview-options-and-diffs.md`](rules/preview-options-and-diffs.md) | `always_on` | Require creating temporary clickable preview files and displaying inline diffs whenever presenting multiple code or file options to the user. |

## License

[BSD0](LICENSE). Just take it, lol.
