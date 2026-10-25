---
trigger: always_on
description: "Prohibit guessing APIs, CLI flags, or configuration keys without verification; require evidence-backed code and explicit disclosure of unverified assumptions."
---

# Verify Before Asserting & Disclose Assumptions

- **Grounding & Verification First**: Ground all external symbols, API calls, CLI flags, and configuration schemas in concrete evidence from repository code, type definitions, or tool help outputs (such as `--help`, `man`, or official documentation) before authoring code that relies on them.
- **Prohibit Speculative Coding**: Never author speculative code, guess function signatures, or invent parameters, keyword arguments, or configuration keys based on unconfirmed intuition.
- **Mandatory Disclosure of Uncertainty**: If documentation or source definitions are unavailable to confirm an external interface or behavior, explicitly disclose the assumption and its uncertainty upfront rather than presenting it as verified fact.
- **Cite Evidence for Non-Obvious Interfaces**: When introducing non-obvious configurations, flags, or version-specific calls, cite the local file path, type definition, or documentation source confirming the contract.
- **Flag Verification Gaps**: Whenever unable to run automated checks or verify runtime behavior due to missing environment tooling, explicitly state the gap and outline manual validation steps so the reviewer knows where to direct scrutiny.
