---
trigger: model_decision
description: "Use GitHub Stacked PRs (gh stack) to structure and manage dependent pull request chains when working on repositories hosted on GitHub."
---

# GitHub Stacked Pull Requests

Apply this rule **only** when working on a repository hosted on GitHub (`github.com`). Do not apply this rule or invoke `gh` on any other Git forge.

- **When to Stack**: Break multi-part or dependent changes into an ordered chain of small, reviewable pull requests instead of a single monolithic pull request. Place foundational changes (e.g., types, schemas, core logic) in lower branches targeting the trunk (`main`), and dependent changes (e.g., API routes, UI, tests) in higher branches targeting the branch directly below them.
- **Non-Interactive `gh stack` Commands**:
  - Initialize a stack with an explicit branch name to avoid interactive prompts: `gh stack init <branch-name>` (or `gh stack init --base <trunk> <branch-name>`).
  - Add subsequent layers on top of the stack: `gh stack add <branch-name>` (or stage, commit, and add in one step with `gh stack add -Am "<message>" <branch-name>`).
  - Link existing local `git` branches into a stack (ordered bottom to top) without local stack tracking: `gh stack link <branch-1> <branch-2> ...`.
  - Inspect stack state non-interactively using `gh stack view --short` or `gh stack view --json`.
  - Rebase or synchronize across the stack with `gh stack rebase` or `gh stack sync`.
- **Approval Gate for Remote & Merge Actions**:
  - Do not push branches (`gh stack push`), submit stacks (`gh stack submit`), or merge stacks (`gh stack merge`) without explicit user approval.
  - When approved to submit non-interactively, run `gh stack submit --auto` (pass `--open` to mark pull requests ready for review instead of draft).
  - Default to standard merging (`--merge`), or `--squash` if requested by the user; always confirm merge vs. squash preference before running `gh stack merge [<pr-or-stack-number>] --yes --merge` (or `--squash`).
