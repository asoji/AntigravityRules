---
trigger: always_on
description: "Require announcing all tool calls, file reads, and shell commands with their target paths/arguments and rationale in text before execution."
---

# Explain Before Executing

- **Mutating & External Actions**: State the exact command or tool call, its arguments, and its rationale in text before executing any shell commands, file edits, or external requests.
- **Read-Only Inspection**: State the target file paths or search patterns and their rationale in text before invoking any read-only tools. When reading multiple files in parallel, batch the announcement into a single concise statement.
