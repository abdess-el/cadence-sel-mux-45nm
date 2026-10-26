# Step-by-Step Walkthrough

Full design flow for cell `sel` in library `lib7` (Cadence Virtuoso 6.1.5). Every screenshot is taken from the original report ([`original-report/report.pdf`](original-report/report.pdf)).

> Items marked **⚠** are inconsistencies in the original report. See [KNOWN_ISSUES.md](KNOWN_ISSUES.md).

---

## 1. Library setup

**1.1 Create the library.** In the CIW (Command Interpreter Window): **File → New → Library**, name it `lib7`, choose *Attach to an existing technology library*, and select the PDK. ⚠ (The screenshot shows `gpdk090`; the report text elsewhere says `gpdk045`.)

![CIW: File → New → Library](../images/01-library/01-ciw-file-new-library.png)
![New Library dialog](../images/01-library/02-new-library-dialog.png)
![Attach Library to Technology Library](../images/01-library/03-attach-technology-library.png)

---

## 2. Schematic design

**2.1 Create the schematic cellview.** **File → New → Cellview**, library `lib7`, cell `sel`, view `schematic`, tool *Schematics L*.

![File → New → Cellview](../images/02-schematic/01-file-new-cellview-menu.png)
![New File dialog](../images/02-schematic/02-new-cellview-dialog.png)

**2.2 Instantiate the symbols.** Press `I` (Add Instance) and place:

| Qty | Cell | Library | View |
|---|---|---|---|
| 1 | `inv`  | `lib1` | `symbol` |
| 3 | `nand` | `lib2` | `symbol` |

![Add Instance: inv](../images/02-schematic/03-add-instance-inv.png)
![Add Instance: nand](../images/02-schematic/04-add-instance-nand.png)
![Placed instances](../images/02-schematic/05-placed-instances.png)

**2.3 Wire the circuit.** Press `W` (Add Wire) and connect the gates.

![Wired schematic](../images/02-schematic/06-wired-schematic.png)

**2.4 Add pins.** Press `P` (Add Pin):

| Pin(s) | Direction | Usage / Signal type |
|---|---|---|
| `a b s` | `input` | schematic / signal |
| `vdd gnd` | `inputOutput` | schematic / power |
| `y` | `output` | schematic / signal |

![Add Pin: a b s](../images/02-schematic/07-add-pin-inputs.png)
![Add Pin: vdd gnd](../images/02-schematic/08-add-pin-power.png)
![Add Pin: y](../images/02-schematic/09-add-pin-output.png)

**2.5 Check and Save.** The Navigator confirms 4 instances, 9 nets, 6 pins.

![Final schematic](../images/02-schematic/10-final-schematic.png)
![Check and Save](../images/02-schematic/11-check-and-save.png)

---

## 3. Symbol generation

**Create → Cellview → From Cellview**, then set the pin placement:

| Side | Pins |
|---|---|
| Left | `a b s` |
| Right | `y` |
| Top | `vdd` |
| Bottom | `gnd` |

![Create → Cellview → From Cellview](../images/03-symbol/01-create-cellview-from-cellview.png)
![Symbol Generation Options](../images/03-symbol/02-symbol-generation-options.png)
![Generated symbol](../images/03-symbol/03-symbol-editor.png)

---

## 4. Layout design

**4.1 Create the layout cellview.** **File → New → Cellview**, library `lib7`, cell `sel`, view `layout`, tool *Layout L*.

![New layout cellview](../images/04-layout/01-new-layout-cellview.png)
![Empty layout editor](../images/04-layout/02-empty-layout-editor.png)

**4.2 Display options.** Press `E`. Enable *Pin Names*, keep snap modes at `anyAngle`, and set array display levels *Start* = `0`, *Stop* = `32`.

![Display Options](../images/04-layout/03-display-options.png)
![Pin Names](../images/04-layout/04-display-pin-names.png)
![Snap Modes](../images/04-layout/05-snap-modes.png)
![Array display levels](../images/04-layout/06-array-display-levels.png)

**4.3 Create instances.** Press `I`:

| Cell | Library | View |
|---|---|---|
| `inv`  | `lib1` | `layout` |
| `nand` | `lib2` | `layout` |

![Create Instance: inv](../images/04-layout/07-create-instance-inv.png)
![Create Instance: nand](../images/04-layout/08-create-instance-nand.png)

**4.4 Routing.** Metal1 is used for most signal and power routing, Metal2 where extra resources are needed to avoid congestion, and Poly for gate connections and short local routes. Press `O` (Create Via) and select `M1_PO` for Poly→Metal1 or `M1_M2` for Metal1→Metal2.

![Metal1](../images/04-layout/09-layer-metal1.png)
![Metal2](../images/04-layout/10-layer-metal2.png)
![Poly](../images/04-layout/11-layer-poly.png)
![Create Via dialog](../images/04-layout/12-create-via-dialog.png)
![Via sample 1](../images/04-layout/13-via-sample-1.png)
![Via sample 2](../images/04-layout/14-via-sample-2.png)

**4.5 Final layout.**

![Final layout](../images/04-layout/15-final-layout.png)

---

## 5. Physical verification (Assura)

**5.1 DRC.** **Assura → Technology**, set the technology file to `/home/csu1/pdk/gpdk045_v5/assura_tech.lib`. Then **Assura → Run DRC**, set *Technology* to `gpdk045_av`, and click OK.

![Assura → Technology](../images/05-verification/01-assura-menu-technology.png)
![Assura Technology Lib Select](../images/05-verification/02-assura-technology-file.png)
![Assura → Run DRC](../images/05-verification/03-assura-menu-run-drc.png)
![Run Assura DRC](../images/05-verification/04-run-assura-drc.png)

**Result: no DRC errors found.**

![DRC result](../images/05-verification/05-drc-no-errors.png)

**5.2 LVS.** **Assura → Run LVS**, schematic `lib7/sel/schematic` vs layout `lib7/sel/layout`, *Technology* `gpdk045`.

![Assura → Run LVS](../images/05-verification/06-assura-menu-run-lvs.png)
![Run Assura LVS](../images/05-verification/07-run-assura-lvs.png)

**Result: schematic and layout match** — 0 net, device, pin, and parameter mismatches; 0 malformed-device, label-short, and label-open problems.

![LVS result](../images/05-verification/08-lvs-result.png)
