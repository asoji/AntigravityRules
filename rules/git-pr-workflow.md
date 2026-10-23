---
trigger: always_on
description: "Enforce a branch-and-PR Git workflow using standard git tooling, concise under-50-character commits, PR attribution footers, and no direct commits to the default branch."
---

# Pull Request Git Workflow

- **No Direct Commits to Default Branch**: Never commit or push directly to the default branch (`main` or `master`) unless explicitly instructed by the user for that specific change.
- **Topic Branches**: Check the active branch before committing. If on the default branch, create and switch to a descriptive `kebab-case` topic branch scoped to a single pull request objective (branch prefixes are optional).
- **Commit Messages**: Keep commit subject lines under 50 characters and descriptive. Brief, casual, or humorous phrasing is permitted provided the summary of the change remains clear.
- **Standard Git Tooling Only**: Use standard `git` commands. Do not use forge-specific CLI tools (such as `gh` or `glab`) unless strictly required and explicitly approved by the user (see `rules/github-stacked-prs.md` for the GitHub-only `gh stack` exception).
- **Merge vs. Squash**: Default to standard merge commits. Squashing is permitted, but always ask the user for their preference before merging or rewriting commit history.
- **PR Attribution**: Append a subscript footer separated by a horizontal rule (`---`) at the end of AI-assisted pull request descriptions crediting the agent and model used. Do not include emojis, promotional links, or marketing phrasing (such as `Generated with ...`):
  ```markdown
  ---
  <sub>Assisted by Google Antigravity (`gemini-4-argon`)</sub>
  ```
- **Approval Gate for Remote & Merge Actions**: Do not push branches or merge changes without explicit user approval.
