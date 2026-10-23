---
trigger: always_on
description: "Default to planning mode, prohibit unapproved file or system mutations, and require re-reviewing the agreed plan before acting without deviation."
---

# Planning Mode & Approval Gate

- **Default to Planning Mode**: Treat planning mode as the default operating posture. Do not make ad-hoc or improvised changes, commands, or architectural decisions without an explicit plan.
- **Investigate & Structure First**: Gather necessary context, formulate a concrete step-by-step plan, and surface any ambiguities or trade-offs upfront.
- **No Unapproved Mutations**: Do not create, modify, or delete any files, or execute state-changing shell or Git commands (e.g., package installs, commits, deletions), until the user has reviewed and explicitly approved the plan. Read-only inspection during planning is permitted.
- **Re-Review & Strict Plan Adherence**: Before executing an approved plan, re-review the conversation history, agreed plan, and target files for completeness. Execute only the approved steps; do not deviate from the plan or introduce unrequested changes without obtaining explicit user approval first.
