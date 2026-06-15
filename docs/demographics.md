# Demographics

The demographics block is part of Block 1 and runs after language selection.

## Fields

| Field ID | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | text | yes | Personally identifying. |
| `age` | integer | yes | Recommended accepted range: 0-120. |
| `gender` | single choice | yes | Female, male, non-binary/diverse, prefer not to say. |
| `handedness` | single choice | yes | Left, right, ambidextrous, prefer not to say. |
| `consent` | checkbox | yes | Must be true before continuing. |
| `signature` | signature | yes | Store image or vector/raw points plus timestamp. |

## Localization

Use:

- English strings: `content/i18n/en.json`
- German strings: `content/i18n/de.json`

Do not translate or alter consent wording silently after ethics approval. If the consent text changes, bump `programVersion` and document the change.

## Privacy Notes

Name and signature are direct identifiers. Keep exports in a local participant-data folder outside git, and avoid sending personally identifying data through debugging telemetry.
