---
trigger: always_on
description: "Enforce allowlist-only Markdown file access: restrict agent Markdown writes strictly to AGENTS.md, rules, and scratchpads; all other Markdown files are human-exclusive."
---

# Markdown File Boundaries & Consolidation

## 1. Allowed Markdown Write Targets

The agent is permitted to create or modify Markdown (`.md`, `.markdown`) files strictly within the following allowlist:

- **Agent Instruction Files**: `AGENTS.md`, `GEMINI.md`, `CLAUDE.md`
- **Rule Directories**: `.agents/rules/*.md`, `rules/*.md`
- **Scratchpads & Artifacts**: `<appDataDir>/brain/<conversation-id>/...`

## 2. Default-Deny for Project Markdown

- **Human-Exclusive Documentation**: All other Markdown files in the repository (including `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `ARCHITECTURE.md`, `docs/**/*.md`) are read-only to the agent.
- **Prohibited Tool Invocations**: Do not invoke `write_file`, `edit_file`, or command-line redirection on non-allowlisted Markdown files.
- **Handoff Mechanism**: Provide proposed additions or revisions to project documentation as inline code blocks, diffs, or temporary scratch files for human integration.

## 3. Explicit Override Protocol

- **Single-Turn User Override**: Direct edits to non-allowlisted Markdown files are permitted only upon an explicit, unambiguous single-turn command from the user for that specific file and section.
- **Minimal Mutation**: When overridden, preserve existing document tone, formatting, and surrounding context without performing unrequested reorganizations.
