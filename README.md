# YAPBPS (Yet Another Parametric Bench Power Supply)

A fully parametric, modular 3D-printable enclosure designed in OpenSCAD for custom DC-DC bench power supply builds (SK200W, SK150C, and similar digital modules).

Featuring a classic angled console profile, print-in-place service door, dynamic multi-pattern ventilation, and a coordinate-based matrix placement engine that allows arbitrary assignment of input/output ports to any face of the chassis.

---

## Key Features

* **Console Form Factor:** Angled front face for optimal viewing and control access on the workbench, combined with a flat top landing.
* **Universal Matrix Placement Engine:** Move any connector to any panel (`Front_Slope`, `Front_Lip`, `Top`, `Rear`, `Right`, `Left`) using horizontal and vertical percentage coordinates (`U`, `V`).
* **Hinged Service Door with Interlocking Lip:** Tool-less access to internal wiring via an integrated rear hinge, featuring a perimeter stepped collar to prevent light bleed, panel flex, and seam gaps.
* **Per-Panel Dynamic Ventilation:** Choose independent cooling patterns (`hex`, `slots`, `round`, `diag_slots`, or `none`) for Rear, Top, Right, and Left faces, with automatic clipping against the front angled slope.
* **Rear Auto-Arrange Engine:** Automatically balances, spaces, and centers connectors assigned to the rear panel.
* **Reinforced PCB & Hardware Mounts:** Integrated USB-C trigger cradle with anti-sag pillar grounded to the floor, chassis zip-tie anchor bridges, and floor standoffs for protection diodes or secondary boards.
* **Native Customizer UI:** Fully annotated OpenSCAD code with labeled sliders, dropdowns, and clear parameter groups.

---

## Supported Hardware & Cutouts Out-of-the-Box

| Component | Default Panel | Description / Standards |
| :--- | :--- | :--- |
| **Front Display Meter** | `Front_Slope` | SK200W / SK150C DC-DC modules with flush-mount bezel recess |
| **Banana Binding Posts** | `Front_Lip` | Dual isolated 4mm binding posts (standard 19.05 mm / 3/4" pitch) |
| **XT60E-M** | `Rear` | Flanged DC input with dual M3 screw anchors |
| **DC Barrel Jack** | `Rear` | Standard 5.5 x 2.5 mm threaded barrel jack |
| **KF2EDG** | `Rear` | Pluggable industrial screw terminal block |
| **USB-C PD Trigger** | `Rear` | Front-slotted port with interior retention cradle & floor support |
| **Power Switch** | `Right` | Standard KCD1 rectangular rocker switch |
| **XT30E-M** | `Rear` (Optional) | Compact flanged panel-mount DC connector |
| **Aviation Plug** | `Right` (Optional) | Circular GX12 or GX16 threaded metal connector |
| **Anderson Powerpole** | `Rear` (Optional) | Dual 15A/30A/45A modular quick-disconnect |
| **Push Button** | `Front_Lip` (Optional) | 16mm circular metal / LED standby pushbutton |

---

## Print Settings (PETG Recommended)

* **Material:** PETG (recommended for thermal stability around regulators and ductile snap-fits)
* **Orientation:**
  * **Chassis Body:** Print upright resting on its flat base (`Z = 0`). No supports required for front slope or flat top with tuned bridging.
  * **Side Door:** Pre-oriented flat on the build plate (`render_side_lid = true`). Use a textured PEI plate for a clean external finish.
* **Perimeters / Wall Lines:** 4 to 5 (ensures vent grids, hinge loops, and screw bosses are 100% solid plastic).
* **Infill:** 20% – 25% (Gyroid or Grid).
* **Cooling:** 30%–50% fan speed for layer bonding; 100% override on bridges.
* **Assembly Hardware:**
  * Hinge pin: 1.75 mm PETG filament piece flanged with a warm iron tip, or an M2 x 30 mm bolt.
  * Lid retention screw: 1x M3 countersunk screw (direct into plastic or M3 heat-set brass insert).
  * Auxiliary board mount: 4x M3 heat-set inserts (`4.2 mm` cavity).

---

## How to Export STLs

1. Open `YAPBPS.scad` in [OpenSCAD](https://openscad.org/) (v2021.01 or newer).
2. Open the **Customizer** panel (`Window` -> `Customizer`).
3. Adjust physical dimensions, port positions, and ventilation types to fit your build.
4. **Export Chassis:**
   * Set `render_main_body = true` and `render_side_lid = false`.
   * Press **F6** (Render), then **F7** to export `YAPBPS_Chassis.stl`.
5. **Export Door:**
   * Set `render_main_body = false` and `render_side_lid = true`.
   * Press **F6** (Render), then **F7** to export `YAPBPS_Lid.stl`.

---

## Contributing Custom Connectors

The project uses a unified dispatcher architecture so anyone can add new connectors without modifying the core geometry or matrix transformations:

1. **Declare Customizer Parameters:** Add `enable_<name>`, `<name>_panel`, `<name>_u`, and `<name>_v` in the configuration block.
2. **Define Dimensions:** Specify nominal dimensions + `print_tolerance` in the `/* [Hidden] */` block.
3. **Build the Cutting Tool:** Create `cutout_<name>()` inside the `PANEL CUTTING TOOLS` section, centered at `[0, 0, 0]` and cutting through the Z-axis.
4. **Register in Dispatchers:** Add entries inside `render_port_cutout()` and `render_port_label()`.
5. **Add to Loops:** Include the module check in `apply_configured_ports()` and `apply_configured_labels()`.

---

## License

Released under the **MIT License**. Feel free to fork, adapt, and build upon this design.
