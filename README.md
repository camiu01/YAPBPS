<div align="center">

# YAPBPS
### Yet Another Parametric Bench Power Supply

A modular, fully parametric 3D-printable benchtop enclosure in OpenSCAD tailored for custom DC-DC buck/boost converters (SK200W, SK150C, and equivalents).

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![OpenSCAD](https://img.shields.io/badge/OpenSCAD-2021.01+-informational.svg)](https://openscad.org/)
[![Python](https://img.shields.io/badge/Python-3.10+-yellow.svg)](https://www.python.org/)
[![Status](https://img.shields.io/badge/Status-Active-success.svg)](#)

</div>

---

## Overview

YAPBPS bridges the gap between static bench enclosures and DIY versatility. It features an angled console profile, dynamic venting, an active clearance auditor, and a coordinate-driven placement engine to mount any connector on any panel.

### Key Highlights

* **Angled Console Profile:** Optimal workbench viewing angles and dial ergonomics while keeping the top surface flat.
* **Universal Matrix Placement:** Position components on any face (`Front_Slope`, `Front_Lip`, `Top`, `Rear`, `Right`, `Left`) via percentage-based coordinates (`U`, `V`).
* **Active Collision Auditing:** Integrated 2D bounding-box validation detects and reports overlapping ports in the OpenSCAD console.
* **Z-Dovetail Service Door:** Hinge-free maintenance lid sliding along rear dovetails, secured by a single front M3 screw with an anti-flex stepped collar.
* **Auto-Balance Rear Panel:** Automatically distributes and centers rear-facing connectors.
* **Parametric Venting:** Panel-independent airflow patterns (`hex`, `slots`, `diag_slots`, `chevron`, `louver`, `swirl`, `fan_radial`, etc.).
* **Integrated Chassis Infrastructure:** Molded floor zip-tie anchors, anti-sag support pillar for USB-C trigger boards, and M3 standoffs for ideal-diode modules.

---

## Supported Hardware & Cutouts

| Category | Component | Default Panel | Mount / Standards |
| :--- | :--- | :--- | :--- |
| **Displays** | Front Display Meter | `Front_Slope` | SK200W / SK150C (flush bezel counterbore) |
| **Outputs** | Banana Binding Posts | `Front_Lip` | Dual isolated 4mm (19.05 mm / 3/4" standard pitch) |
| | USB-A Output | `Front_Lip` | Bulkhead female socket |
| **Inputs** | XT60E-M / XT30E-M | `Rear` | Flanged panel mount with dual M3 screw anchors |
| | USB-C PD Trigger | `Rear` | Slotted port with retention cradle & floor rest |
| | DC 5.5 x 2.5 mm | `Rear` | Standard threaded barrel jack |
| | Pluggable Terminal | `Rear` | KF2EDG screw terminal block |
| | AC Mains Inlet | `Rear` | IEC 60320 C14 panel socket |
| | Anderson Powerpole | `Rear` | Dual 15A/30A/45A housing |
| **Controls** | Rocker Switch | `Right` | KCD1 rectangular switch (snap-fit) |
| | Push Button | `Front_Lip` | 16mm metal latching/momentary LED button |
| | Potentiometer | `Front_Lip` | Standard rotary encoder / pot bore |
| | Status Indicator | `Front_Lip` | 5mm panel-mount LED bezel |
| **Utility** | Circular Aviation | `Right` | GX12 / GX16 threaded plug |
| | Axial Fan | `Rear` | Parametric square fan bore + guard |
| | Keystone RJ45 | `Rear` | Snap-in pass-through |
| | Fuse Holder | `Rear` | 5x20 mm panel-mount screw cap |

---

## Quick Start

### Prerequisites

* [OpenSCAD](https://openscad.org/) (v2021.01 or later)
* [Python](https://www.python.org/) (v3.10+, required only for compiling single-file distributions)

### Workflow

1. **Clone the repository:**
{B}bash
git clone https://github.com/camiu01/YAPBPS.git
cd YAPBPS
{B}

2. **Open the project:**
   Always open `main.scad` directly. Never launch modules from inside `modules/`.
{B}bash
openscad main.scad
{B}

3. **Configure parameters:**
   In OpenSCAD, open **Window** > **Customizer** to tune dimensions, active cutouts, coordinate placements, and thermal patterns.

4. **Verify design:**
   * Press `F5` to update the assembly preview.
   * Use `preview_slide` and `preview_explode` sliders to audit internal clearances and sliding tolerances.
   * Watch the console for layout errors:
{B}text
ECHO: "WARNING: Port overlap detected on Rear panel between [XT60E-M] and [DC_Jack]"
{B}

5. **(Optional) Bundle into single file:**
{B}bash
python build.py
{B}

---

## Manufacturing Guide

### STL Export

1. **Chassis:** Set `render_main_body = true` and `render_side_lid = false`. Render (`F6`), then Export STL (`F7`) as `YAPBPS_Chassis.stl`.
2. **Side Door:** Set `render_main_body = false` and `render_side_lid = true`. Render (`F6`), then Export STL (`F7`) as `YAPBPS_Lid.stl`.

### Recommended Slicer Settings

* **Filament:** PETG, ABS, or ASA (higher heat resistance near regulators than PLA).
* **Wall Loops / Perimeters:** `4 - 5` (keeps vent meshes, dovetails, and standoffs completely solid).
* **Infill:** `20% – 25%` (Gyroid or Honeycomb).
* **Supports:** 
  * *Chassis:* Organic/Tree supports for cutouts and connector ports.
  * *Side Lid:* None (prints flat on the bed).
* **Surface Finish (Optional):** **Fuzzy Skin** is completely optional and based on personal preference. If you prefer a textured matte finish, use **Contour Only** (suggested: thickness `0.1 mm`, point distance `0.25 mm`) to prevent altering the internal dovetail tolerances.

### Assembly Hardware

* **Lid Retention:** 1x M3x8mm countersunk screw.
* **Internal Standoffs:** 4x M3 heat-set brass threaded inserts (OD: 4.2–4.6 mm).
* **Cable Management:** 2.5 mm nylon cable ties.

---

## Extending Ports & Vents

1. Duplicate `modules/cutouts/ports/_TEMPLATE_port.scad` or `modules/vent/patterns/_TEMPLATE_vent.scad`.
2. Center your cutout profile at `[0, 0, 0]`.
3. Register the new shape in the respective aggregator under `modules/`.
4. Append the descriptor entry to `ALL_PORTS_REGISTRY` in `modules/core_logic.scad` and expose its UI flags in `main.scad`.
5. Run `python build.py` to regenerate single-file dist assets.

---

## License & Authors

Maintained by **Camiu** ([@camiu01](https://github.com/camiu01)). Distributed under the [MIT License](LICENSE).
