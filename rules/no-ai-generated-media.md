---
trigger: always_on
description: "Prohibit AI-generated images and media; require all diagrams, tables, and UI mockups to use Markdown, plaintext, or Mermaid diagrams."
---

# No AI-Generated Media & Code-Based Visualizations Only

- **Zero AI-Generated Media**: Never generate, synthesize, or commit AI-generated images, illustrations, raster graphics, video, audio, or synthetic binary media.
- **Prohibit Generative Media Tools**: Do not invoke image-generation subagents (such as `image-generator`), generative media tools, or external image-synthesis APIs.
- **Mermaid for Architectural & Flow Visuals**: Author all diagrams, workflows, state machines, sequence flows, and system architectures in version-controllable, diffable text using Mermaid diagrams (`mermaid`).
- **Markdown & Plaintext for Tabular Data**: Present structured comparisons, tables, and schedules strictly using GitHub Flavored Markdown tables or formatted plaintext, never rendered image tables.
- **Code-First UI & Wireframe Mockups**: When visual wireframes or interface designs are requested, author them using standard frontend markup (HTML/CSS), clean vector SVG code, or text-based ASCII layouts rather than generated image assets.
