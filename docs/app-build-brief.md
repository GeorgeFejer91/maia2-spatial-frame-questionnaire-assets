# App Build Brief

This handoff describes questionnaire content for a three-block app. It does not prescribe Unity, native Android, WebXR, or another runtime. The app builder should preserve the instrument order, item text, scoring, localization, and export requirements.

## Required Block Order

1. `block_1_setup_maia2`
   - Show language selection first.
   - Collect demographics after language selection.
   - Administer MAIA-2 in the selected language.
2. `block_2_spatial_frame_reference`
   - Show the spatial-frame pictograph.
   - Use the same selected language for title, instructions, and submit button.
3. `block_3_spatial_frame_reference`
   - Show the same spatial-frame pictograph again.
   - Store it as a second administration, not as an overwrite of Block 2.

## Implementation Notes

- Generate a participant/session ID internally even though the form collects name.
- Store name and signature as personally identifying data. Keep participant data out of git.
- Store every response with block id, item id, raw value, selected language, timestamp, and app/content version.
- Store MAIA-2 raw item scores and scored subscale means.
- Store pictograph selections with `administrationIndex` so Block 2 and Block 3 remain distinct.
- Save incrementally after each block if the target runtime can be interrupted.

## UI Contract

- Language selection must be explicit: English or German.
- Demographics fields are required: name, age, gender, handedness, consent, signature.
- MAIA-2 uses a 0-5 integer scale with localized anchors.
- The pictograph uses A-H choice buttons matching the image labels.
- Consent and signature must be completed before MAIA-2 starts.

## Export Contract

At minimum, export:

- One full JSON session file matching `content/schemas/session-export.schema.json`.
- One CSV summary row with demographics, 37 MAIA-2 raw responses, 8 MAIA-2 subscale means, Block 2 pictograph choice, and Block 3 pictograph choice.
- Optional event log CSV for focus, text entry, signature start/end, item changes, submits, and save/write events.
