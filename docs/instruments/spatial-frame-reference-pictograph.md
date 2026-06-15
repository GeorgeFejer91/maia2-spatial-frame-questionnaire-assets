# Spatial Frame Of Reference Pictograph

The spatial-frame pictograph is administered twice:

- Block 2: first administration.
- Block 3: second administration.

Both administrations use the same asset:

```text
assets/pictographs/spatial-frame-reference-continuum.png
```

## Response Model

Participants choose exactly one letter:

```text
A, B, C, D, E, F, G, H
```

The image contains the letter markers. The title, instructions, choice prompt, and submit button are localized outside the image using `content/i18n/en.json` and `content/i18n/de.json`.

## Export Requirements

For each administration, export:

- `blockId`
- `administrationIndex`
- `instrumentId`
- `selectedChoice`
- `assetPath`
- `assetSha256`
- `responseStartedAt`
- `responseSubmittedAt`

Do not overwrite the first pictograph response when the second administration is completed.
