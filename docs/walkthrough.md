# Walkthrough

Design flow for cell `sel` in library `lib7`, Cadence Virtuoso 6.1.5.

## 1. Library setup

In the CIW (Command Interpreter Window), choose **File → New → Library**, name the library `lib7`, select *Attach to an existing technology library*, and pick the PDK technology library.

![CIW: File → New → Library](../images/01-library/01-ciw-file-new-library.png)
![New Library dialog](../images/01-library/02-new-library-dialog.png)
![Attach Library to Technology Library](../images/01-library/03-attach-technology-library.png)

## 2. Schematic

### 2.1 Create the cellview

**File → New → Cellview** with library `lib7`, cell `sel`, view `schematic`, opened with *Schematics L*.

![File → New → Cellview](../images/02-schematic/01-file-new-cellview-menu.png)
![New File dialog](../images/02-schematic/02-new-cellview-dialog.png)

### 2.2 Place the instances

Press `I` to open Add Instance and place the following symbols.

| Qty | Cell | Library | View |
|---|---|---|---|
| 1 | `inv` | `lib1` | `symbol` |
| 3 | `nand` | `lib2` | `symbol` |

![Add Instance: inv](../images/02-schematic/03-add-instance-inv.png)
![Add Instance: nand](../images/02-schematic/04-add-instance-nand.png)
![Placed instances](../images/02-schematic/05-placed-instances.png)

### 2.3 Wire the circuit

Press `W` to open Add Wire and connect the gates.

![Wired schematic](../images/02-schematic/06-wired-schematic.png)

### 2.4 Add pins

Press `P` to open Add Pin.

| Pins | Direction | Usage | Signal type |
|---|---|---|---|
| `a b s` | input | schematic | signal |
| `vdd gnd` | inputOutput | schematic | power |
| `y` | output | schematic | signal |

![Add Pin: a b s](../images/02-schematic/07-add-pin-inputs.png)
![Add Pin: vdd gnd](../images/02-schematic/08-add-pin-power.png)
![Add Pin: y](../images/02-schematic/09-add-pin-output.png)

### 2.5 Check and save

The Navigator reports 4 instances, 9 nets and 6 pins.

![Final schematic](../images/02-schematic/10-final-schematic.png)
![Check and Save](../images/02-schematic/11-check-and-save.png)

## 3. Symbol

Choose **Create → Cellview → From Cellview** and set the pin placement as follows.

| Side | Pins |
|---|---|
| Left | `a b s` |
| Right | `y` |
| Top | `vdd` |
| Bottom | `gnd` |

![Create → Cellview → From Cellview](../images/03-symbol/01-create-cellview-from-cellview.png)
![Symbol Generation Options](../images/03-symbol/02-symbol-generation-options.png)
![Generated symbol](../images/03-symbol/03-symbol-editor.png)

## 4. Layout

### 4.1 Create the cellview

**File → New → Cellview** with library `lib7`, cell `sel`, view `layout`, opened with *Layout L*.

![New layout cellview](../images/04-layout/01-new-layout-cellview.png)
![Empty layout editor](../images/04-layout/02-empty-layout-editor.png)

### 4.2 Display options

Press `E` to open Display Options. Enable *Pin Names*, leave the snap modes at `anyAngle`, and set the array display levels to Start `0` and Stop `32`.

![Display Options](../images/04-layout/03-display-options.png)
![Pin Names](../images/04-layout/04-display-pin-names.png)
![Snap Modes](../images/04-layout/05-snap-modes.png)
![Array display levels](../images/04-layout/06-array-display-levels.png)

### 4.3 Place the instances

Press `I` to open Create Instance.

| Cell | Library | View |
|---|---|---|
| `inv` | `lib1` | `layout` |
| `nand` | `lib2` | `layout` |

![Create Instance: inv](../images/04-layout/07-create-instance-inv.png)
![Create Instance: nand](../images/04-layout/08-create-instance-nand.png)

### 4.4 Route

Metal1 carries most signal and power connections. Metal2 is used where extra tracks are needed to avoid congestion, and Poly for gate connections and short local routing.

![Metal1](../images/04-layout/09-layer-metal1.png)
![Metal2](../images/04-layout/10-layer-metal2.png)
![Poly](../images/04-layout/11-layer-poly.png)

Press `O` to open Create Via and select `M1_PO` for Poly to Metal1, or `M1_M2` for Metal1 to Metal2.

![Create Via dialog](../images/04-layout/12-create-via-dialog.png)
![M1_PO via](../images/04-layout/13-via-m1-po.png)
![M1_M2 via](../images/04-layout/14-via-m1-m2.png)

### 4.5 Finished layout

![Final layout](../images/04-layout/15-final-layout.png)

## 5. Physical verification

### 5.1 DRC

Open **Assura → Technology** and set the technology file to `/home/csu1/pdk/gpdk045_v5/assura_tech.lib`. Then run **Assura → Run DRC**, set *Technology* to `gpdk045_av`, and confirm with OK.

![Assura menu](../images/05-verification/01-assura-menu.png)
![Assura Technology Lib Select](../images/05-verification/02-assura-technology-file.png)
![Run Assura DRC](../images/05-verification/03-run-assura-drc.png)

Result: no DRC errors found.

![DRC result](../images/05-verification/04-drc-no-errors.png)

### 5.2 LVS

Run **Assura → Run LVS** with schematic `lib7/sel/schematic` against layout `lib7/sel/layout`, and *Technology* set to `gpdk045`.

![Run Assura LVS](../images/05-verification/05-run-assura-lvs.png)

Result: schematic and layout match, with no net, device, pin or parameter mismatches and no malformed-device, label-short or label-open problems.

![LVS result](../images/05-verification/06-lvs-result.png)
