# MAIA-2

MAIA-2 is the Multidimensional Assessment of Interoceptive Awareness, Version 2. It has 37 items and 8 subscales. Responses are integers from 0 to 5.

## Source Decision For German

Use the German MAIA-2 version from Eggart, Todd, and Valdes-Stauber (2021), supplied as the S1 questionnaire for their PLoS ONE validation paper. This is the current validated German 37-item MAIA-2 version identified for this handoff on 2026-06-15.

Important distinction:

- Bornemann et al. (2015) and Reis (2017) concern the older 32-item German MAIA.
- Eggart et al. (2021) concerns the 37-item German MAIA-2 and translates the added MAIA-2 items in cooperation with Wolf E. Mehling, based on the earlier German version.

Later MAIA-2 papers found during the check still cite Eggart et al. as the German MAIA-2 validation rather than replacing it.

## Files

- English items: `content/maia2/en.json`
- German items: `content/maia2/de.json`
- Scoring: `content/maia2/scoring.json`
- Local German source PDF: `references/MAIA2_German_Eggart-2021_S1.pdf`

The official UCSF English MAIA-2 PDF is referenced in citations. A local copy is not bundled because direct download from the UCSF PDF endpoint was blocked by a browser challenge during repository creation, but the item text is included in `content/maia2/en.json`.

## Response Scale

| Language | Left anchor | Right anchor | Values |
| --- | --- | --- | --- |
| English | Never | Always | 0, 1, 2, 3, 4, 5 |
| German | Nie | Immer | 0, 1, 2, 3, 4, 5 |

## Scoring

Calculate the arithmetic mean for each subscale. Reverse-score items 5, 6, 7, 8, 9, 10, 11, 12, and 15 before computing subscale means.

Reverse scoring formula:

```text
scoredValue = 5 - rawValue
```

## Subscales

| ID | English | German | Items |
| --- | --- | --- | --- |
| `noticing` | Noticing | Bemerken | 1-4 |
| `not_distracting` | Not-Distracting | Nicht-Ablenken | 5-10 |
| `not_worrying` | Not-Worrying | Sich-Keine-Sorgen-Machen | 11-15 |
| `attention_regulation` | Attention Regulation | Aufmerksamkeitsregulation | 16-22 |
| `emotional_awareness` | Emotional Awareness | Emotionales Gewahrsein | 23-27 |
| `self_regulation` | Self-Regulation | Selbstregulation | 28-31 |
| `body_listening` | Body Listening | Auf-den-Leib-Hören | 32-34 |
| `trusting` | Trusting | Vertrauen | 35-37 |

## Implementation Guardrails

- Do not calculate a total score unless the study team explicitly approves it.
- Store both raw and reverse-scored values for audit.
- If any item wording is modified, record it as a modified MAIA-2 and cite the source version.
- Prefer complete subscales over cherry-picked items.
