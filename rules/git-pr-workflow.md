---
trigger: always_on
description: "Enforce a branch-and-PR Git workflow using standard git tooling, concise under-50-character commits, and no direct commits to the default branch."
---

# Pull Request Git Workflow

- **No Direct Commits to Default Branch**: Never commit or push directly to the default branch (`main` or `master`) unless explicitly instructed by the user for that specific change.
- **Topic Branches**: Check the active branch before committing. If on the default branch, inspect existing repository branch naming conventions (or ask the user for their preferred prefix) and switch to a descriptive `kebab-case` topic branch matching repository conventions (e.g., using `feat/`, `fix/`, `docs/`, `chore/` when customary).
- **Commit Messages**: Keep commit subject lines under 50 characters and descriptive. Brief, casual, or humorous phrasing is permitted provided the summary of the change remains clear.
- **Standard Git Tooling Only**: Use standard `git` commands. Do not use forge-specific CLI tools (such as `gh` or `glab`) unless strictly required and explicitly approved by the user (see `rules/github-stacked-prs.md` for the GitHub-only `gh stack` exception).
- **Merge vs. Squash**: Default to standard merge commits. Squashing is permitted, but always ask the user for their preference before merging or rewriting commit history.
- **Approval Gate for Remote & Merge Actions**: Do not push branches or merge changes without explicit user approval.
