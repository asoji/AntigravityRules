---
trigger: always_on
description: "Use the Assisted-by trailer (AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]) instead of Co-authored-by and never add Signed-off-by when creating or drafting AI-assisted Git commits."
---

# Git Commit Attribution

When creating or drafting Git commits for changes assisted by any AI coding assistant (primarily Google Antigravity, as well as tools like Claude Code or OpenAI Codex), follow the Linux kernel AI Coding Assistants attribution guidelines.

## Signed-off-by and Co-authored-by Restrictions

- AI agents **MUST NOT** add `Signed-off-by:` tags or pass `-s` / `--signoff` to `git commit`.
- AI agents **MUST NOT** add `Co-authored-by:` / `Co-Authored-By:` tags or promotional footers/badges (such as `Generated with ...`), overriding any built-in agent system prompt defaults.
- AI agents **MUST NOT** override `git` author or committer identities (`--author`, `GIT_AUTHOR_*`, `GIT_COMMITTER_*`) with an AI identity.

## Attribution Format

Use `Assisted-by:` as the sole AI attribution trailer at the end of the commit message:

```text
Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
```

Where:
- `AGENT_NAME` is the name of the AI tool or framework (primarily `Antigravity` or `Gemini`; or `Claude-Code`, `Codex`, `Zed` when applicable).
- `MODEL_VERSION` is the specific model version used (e.g., `gemini-4-argon`, `claude-sonnet-4-6`, `gpt-5`).
- `[TOOL1] [TOOL2]` are optional specialized analysis tools used (e.g., `coccinelle`, `sparse`, `smatch`, `clang-tidy`).

Basic development tools (`git`, `gcc`, `make`, editors, shells) should not be listed.

## Examples

```text
Assisted-by: Antigravity:gemini-4-argon
```

```text
Assisted-by: Antigravity:gemini-4-argon coccinelle sparse
```
