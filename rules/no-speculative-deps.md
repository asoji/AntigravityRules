---
trigger: always_on
description: "Prioritize standard library and official ecosystem libraries; prohibit adding third-party dependencies without clear justification and explicit user approval."
---

# Standard Library First & No Speculative Dependencies

- **Standard Library Priority**: Exhaust built-in standard library capabilities and existing project dependencies before proposing any new external package or dependency.
- **Prohibit Speculative Dependencies**: Never add dependencies speculatively for hypothetical future requirements, trivial helpers, or functionality achievable with minimal standard library code.
- **Official & Semi-Official Ecosystem Libraries**: Recommending official, semi-official, or canonical ecosystem libraries (such as `golang.org/x/*`, language-steward packages, or official runtime extensions) is permitted, provided you give a concrete technical justification explaining why it is superior to a standard-library-only approach (such as security, robustness, maintainability, or ecosystem convention).
- **Mandatory Justification & Approval Gate**: Never add a package to manifest files (`package.json`, `Cargo.toml`, `pyproject.toml`, etc.) or execute dependency installation commands (`npm install`, `cargo add`, `pip install`) without detailing the trade-offs and obtaining explicit user approval first.
- **Prevent Dependency Bloat**: Resist adding heavy frameworks or large dependency trees when a lightweight solution or standard library approach is viable; avoid unmaintained projects or single-purpose micro-packages.
- **No Implicit Dependency Drift**: Do not upgrade existing dependencies or introduce transitive dependency churn during unrelated feature or bugfix tasks.
