# Known Issues in the Original Report

An audit of the source report found the items below. Items 1–5 were **corrected** in this repository's documents; items 6–9 **cannot be resolved from the report alone** and need the author's confirmation.

## Corrected

| # | Original | Correction |
|---|---|---|
| 1 | Text says pins are `a b c` | Screenshots, symbol, and Navigator (6 pins) all use **`a b s`** |
| 2 | `vdd gnd` direction "Input output" | Written as the Virtuoso value **`inputOutput`** |
| 3 | Section numbers jump 2.2 → 2.4; an unnumbered "Creating Symbols" heading actually covers instance placement; sections 3–4 are missing; layout is "5." | Renumbered sequentially; the instance-placement step is labelled correctly |
| 4 | Objective list: "…instantiating inverter and NAND gate 5-Design: Create a physical layout…" (two items merged) | Split into separate objectives |
| 5 | Objective 6 "Passed DRC and LVS" (result written as an objective) | Reworded as an objective; results moved to the Results section |

## Needs the author's confirmation

| # | Issue | Where |
|---|---|---|
| 6 | **Technology mismatch.** §1.2 and the objectives say `gpdk045` (45 nm); the library-creation screenshots and text show **`gpdk090`** (90 nm), and the via dialog also reads `gpdk090`. DRC/LVS use `gpdk045`. If `lib7` really uses 90 nm while verification used 45 nm rule decks, the verification results would not be meaningful. | Report §1.2, §2.1, §5.6 |
| 7 | **Inverter library.** Objective 2 says the inverter is designed in `lib7`; every instance dialog and the conclusion use `inv` from **`lib1`**. | Report §1.4 vs §2.3, §5.3 |
| 8 | **Missing simulation and extraction.** The conclusion claims pre-layout transient simulation, parasitic extraction, and post-layout simulation. The report contains **no section, waveform, or numbers** for any of them. They are therefore *not* claimed in this repository's README. | Report §6 |
| 9 | **Inconsistent account/ID paths in screenshots** (`/home/buet/238801100`, `stu110@icdesign:~/238801099`, `/home/stu110/238801100`). Harmless technically, but see the privacy note below. | Screenshots |

## Privacy note before publishing

Screenshots contain home-directory paths with what look like student ID numbers, and the PDF metadata contains the author's full name. If you don't want these public, either crop/blur the screenshots and remove `docs/original-report/report.pdf`, or keep them knowingly.
