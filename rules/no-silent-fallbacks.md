---
trigger: always_on
description: "Prohibit silent fallbacks, dummy default returns, and swallowed exceptions; require failing loudly or propagating errors unless a fallback is explicitly specified."
---

# No Silent Fallbacks & Swallowed Errors

- **Fail Loudly by Default**: Surface errors immediately at the point of failure. Never conceal exceptions, invalid states, or failed operations behind dummy defaults or silent returns.
- **Prohibit Catch-and-Suppress**: Do not write empty catch blocks, discard error objects, or use broad exception suppression (such as generic `catch (Exception e) {}`, `except Exception: pass`, error-suppression operators, or swallowing unhandled promise rejections).
- **No Dummy or Sentinel Fallbacks**: Never substitute or return default fallback values (such as `null`, `nil`, `None`, `""`, `0`, `-1`, or empty collections) when an operation fails or an external dependency is unreachable, unless the approved specification explicitly calls for a fallback.
- **No Logging Without Propagation**: Logging an error does not constitute handling it; do not log an error and proceed normally if the operation did not complete successfully.
- **Preserve Error Context & Cause**: When catching and rethrowing or translating exceptions into domain-specific types, preserve the original stack trace and causal chain (`innerException`, `cause`).
- **Explicit Fallback Authorization**: Implement fallback values or graceful degradation paths only when explicitly required by the prompt or design specification.
