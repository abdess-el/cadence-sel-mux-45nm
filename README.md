# Hierarchical CMOS Logic Cell `sel` — Cadence Virtuoso, 45 nm

[Step-by-step walkthrough](docs/walkthrough.md)

A hierarchical IC design project built in **Cadence Virtuoso 6.1.5**: a top-level cell (`sel`) assembled from one inverter and three NAND gates, taken through schematic, symbol, layout, and **Assura DRC/LVS verification** (both clean).

![Final layout](images/04-layout/15-final-layout.png)

## Highlights

- Hierarchical design using the Library → Cell → View structure
- Schematic, symbol, and layout for the top-level cell
- Assura DRC: **no errors**
- Assura LVS: **schematic and layout match**, 0 mismatches of any kind

## Circuit

The top level instantiates 4 cells and has 6 pins:

| Instance | Cell | Library |
|---|---|---|
| `I0` | `inv`  | `lib1` |
| `I1`, `I3`, `I5` | `nand` | `lib2` |

| Pin | Direction |
|---|---|
| `a`, `b`, `s` | input |
| `y` | output |
| `vdd`, `gnd` | inputOutput (power) |

Structure: the inverter generates the complement of `s`; two NAND gates combine it with the data inputs; the third NAND merges their outputs. Written as logic, this is `y = NAND( NAND(a, s̄), NAND(b, s) )`, i.e. a 2-to-1 selector: `s = 0 → y = a`, `s = 1 → y = b`.

![Schematic](images/02-schematic/06-wired-schematic.png)

| Symbol | Pin placement |
|---|---|
| ![Symbol](images/03-symbol/03-symbol-editor.png) | Left: `a b s` · Right: `y` · Top: `vdd` · Bottom: `gnd` |

## Verification results

| Check | Tool | Result |
|---|---|---|
| DRC | Assura | No DRC errors found |
| LVS | Assura | 0 net / device / pin / parameter mismatches; 0 malformed-device, label-short, label-open problems |

| DRC | LVS |
|---|---|
| ![DRC](images/05-verification/05-drc-no-errors.png) | ![LVS](images/05-verification/08-lvs-result.png) |

## Design flow

1. **Library** — create `lib7`, attach the technology library → [details](docs/walkthrough.md#1-library-setup)
2. **Schematic** — instantiate, wire, add pins, check & save → [details](docs/walkthrough.md#2-schematic-design)
3. **Symbol** — generate from cellview → [details](docs/walkthrough.md#3-symbol-generation)
4. **Layout** — instances, Poly/Metal1/Metal2 routing, vias → [details](docs/walkthrough.md#4-layout-design)
5. **Verification** — Assura DRC and LVS → [details](docs/walkthrough.md#5-physical-verification-assura)

## Tools and technology

| Item | Value |
|---|---|
| EDA | Cadence Virtuoso 6.1.5 (Schematics L, Layout L), Assura |
| Process | Cadence generic PDK (gpdk), 45 nm |
| Key shortcuts | `I` instance · `W` wire · `P` pin · `E` display options · `O` via |

## Repository structure

```
.
├── README.md
├── LICENSE
├── docs/
│   ├── walkthrough.md        # full step-by-step with every screenshot
│   └── original-report/
│       └── report.pdf        # source report
└── images/
    ├── 01-library/
    ├── 02-schematic/
    ├── 03-symbol/
    ├── 04-layout/
    └── 05-verification/
```

## Notes

This repository documents the design flow and results through screenshots. It does not contain Virtuoso library database files (`lib7`, `lib1`, `lib2`), so the design cannot be reopened from this repo alone.

## License

[MIT](LICENSE)
