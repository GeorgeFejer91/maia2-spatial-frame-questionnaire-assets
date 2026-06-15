# MAIA-2 Spatial Frame Questionnaire Assets

This repository is a content and documentation handoff for building a three-block questionnaire app. It contains the bilingual questionnaire text, app-flow specification, export schema, instrument notes, source references, and the spatial-frame pictograph asset. It is intentionally not an app implementation.

## Handoff Summary

Build an app that administers one participant session in three ordered blocks:

1. Select language, collect demographics/consent/signature, then administer MAIA-2.
2. Administer the Spatial Frame of Reference pictograph.
3. Administer the same Spatial Frame of Reference pictograph again as a separate second administration.

The app must keep the selected language fixed across the whole session, export raw and scored questionnaire data, and store Block 2 and Block 3 pictograph answers separately.

## Program Flow

1. Block 1: participant setup and MAIA-2
   - Language selection: English or German.
   - Demographics: name, age, gender, handedness, consent, signature.
   - MAIA-2 in the selected language.
2. Block 2: Spatial Frame of Reference pictograph in the selected language.
3. Block 3: Spatial Frame of Reference pictograph in the selected language.

The selected language is stored once and reused for all blocks. Block 2 and Block 3 use the same pictograph image and localized prompt text, but must be recorded as separate administrations.

## App Builder Requirements

- Use `content/program.manifest.json` as the authoritative block order.
- Use `content/i18n/en.json` and `content/i18n/de.json` for all participant-facing labels and prompts.
- Use `content/maia2/en.json`, `content/maia2/de.json`, and `content/maia2/scoring.json` for MAIA-2.
- Use `content/spatial-frame-reference-pictograph.json` and `assets/pictographs/spatial-frame-reference-continuum.png` for Blocks 2 and 3.
- Export one JSON session record and one CSV summary at minimum.
- Include language, participant/session id, timestamps, raw responses, scored MAIA-2 values, pictograph asset checksum, and app/content version in exports.
- Keep participant data, signatures, and app exports out of git.

## Acceptance Checklist

- Language selection offers English and German.
- Demographics collects name, age, gender, handedness, consent, and signature.
- Consent and signature are required before MAIA-2 starts.
- MAIA-2 shows 37 items in the selected language.
- MAIA-2 uses a 0-5 scale with `Never`/`Always` or `Nie`/`Immer`.
- MAIA-2 scoring produces 8 subscale means and reverse-scores items 5, 6, 7, 8, 9, 10, 11, 12, and 15.
- Block 2 pictograph records one A-H choice.
- Block 3 pictograph records one A-H choice in a separate field/record.
- Validation passes with `tools/validate-content.ps1`.

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

## What Not To Change Casually

- Do not edit MAIA-2 wording without documenting the app as a modified instrument.
- Do not replace the German MAIA-2 with the older 32-item German MAIA.
- Do not collapse the two pictograph administrations into one response.
- Do not compute a MAIA-2 total score unless the study team explicitly approves it.
- Do not commit participant exports, names, signatures, or raw session data.

## Validation

Run the content validator from the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\validate-content.ps1
```

The validator checks MAIA-2 counts, score groups, reverse-scored items, pictograph choices, and key asset presence.
