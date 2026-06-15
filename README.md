# MAIA-2 Spatial Frame Questionnaire Assets

This repository is a content and documentation handoff for building a three-block questionnaire app. It contains the bilingual questionnaire text, app-flow specification, export schema, instrument notes, and the spatial-frame pictograph asset. It is intentionally not an app implementation.

## Program Flow

1. Block 1: participant setup and MAIA-2
   - Language selection: English or German.
   - Demographics: name, age, gender, handedness, consent, signature.
   - MAIA-2 in the selected language.
2. Block 2: Spatial Frame of Reference pictograph in the selected language.
3. Block 3: Spatial Frame of Reference pictograph in the selected language.

The selected language is stored once and reused for all blocks. Block 2 and Block 3 use the same pictograph image and localized prompt text, but must be recorded as separate administrations.

## Repository Contents

- `content/program.manifest.json`: machine-readable block order and content references.
- `content/i18n/`: English and German UI/demographic/prompt strings.
- `content/maia2/`: English and German MAIA-2 item text plus scoring metadata.
- `content/spatial-frame-reference-pictograph.json`: pictograph response model.
- `content/schemas/session-export.schema.json`: expected export shape for app builders.
- `assets/pictographs/spatial-frame-reference-continuum.png`: A-H spatial-frame pictograph.
- `docs/`: build brief, instrument documentation, provenance, and citations.
- `references/`: source PDFs that can be redistributed or locally archived when available.

## German MAIA-2 Source Decision

The German MAIA-2 content is pinned to the validated 37-item German MAIA-2 published as the S1 questionnaire for Eggart, Todd, and Valdes-Stauber (2021). The official UCSF MAIA page also lists German as a systematic forward-backward translation and points to the MAIA source material. A targeted check on 2026-06-15 found newer MAIA-2 papers still citing Eggart et al. as the German MAIA-2 validation rather than replacing it.

Use `docs/instruments/maia2.md` before implementing scoring or changing item text.

## Validation

Run the content validator from the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\validate-content.ps1
```

The validator checks MAIA-2 counts, score groups, reverse-scored items, pictograph choices, and key asset presence.
