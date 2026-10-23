---
trigger: always_on
description: "Require creating temporary clickable preview files and displaying inline diffs whenever presenting multiple code or file options to the user."
---

# Option Previews & Diffs

When presenting multiple implementation, code, or configuration options to the user:

- **Temporary Clickable Preview Files**: Create temporary preview files for each option in the agent's scratch/temporary directory (such as `<appDataDir>/brain/<conversation-id>/scratch/`, never inside the repository working tree) and link to them using clickable `file:///` Markdown links so the user can open and compare the full files in their editor.
- **Inline Diffs**: Always include an inline `diff` code block alongside each option in the chat response or plan showing the exact additions and removals relative to the existing file (or the full content block for newly created files) so the change is immediately visible in chat as well.
- **No Working Tree Pollution**: Keep all temporary option previews outside the project's Git working directory so untracked preview files never dirty `git status`.
