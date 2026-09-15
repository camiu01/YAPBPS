# YAPBPS (Yet Another Parametric Bench Power Supply)

A fully parametric, modular 3D-printable enclosure designed in OpenSCAD for custom DC-DC bench power supply builds (SK200W, SK150C, and similar digital modules).

Featuring a classic angled console profile, a 100% support-free slide-to-lock service door, dynamic multi-pattern ventilation, and a coordinate-based matrix placement engine that allows arbitrary assignment of input/output ports to any face of the chassis. The design is now split into a granular module tree with all Customizer parameters centralized in `main.scad` and a one-command single-file distribution build.

---

## Key Features

* **Console Form Factor:** Angled front face for optimal viewing and control access on the workbench, combined with a flat top landing.
* **Universal Matrix Placement Engine:** Move any connector to any panel (`Front_Slope`, `Front_Lip`, `Top`, `Rear`, `Right`, `Left`) using horizontal and vertical percentage coordinates (`U`, `V`).
* **Z-Dovetail Slide-to-Lock Door:** Completely hinge-less and 100% support-free. The left service door slides into rear wall mortises via dovetail joints and locks securely with a single front M3 screw. An integrated stepped collar prevents light bleed and panel flex.
* **Live Assembly Simulation & Smart Export:** Uses OpenSCAD's `$preview` environment. Press **F5** to see the fully assembled case with interactive sliders to open/slide the door. Press **F6** and the script automatically lays the selected parts flat on the virtual build plate for STL export.
* **Active Collision Detection:** A built-in 2D bounding-box engine audits your port coordinates and throws console warnings if two connectors overlap on the same panel.
* **Per-Panel Dynamic Ventilation:** Choose independent cooling patterns (`hex`, `slots`, `round`, `diag_slots`, `chevron`, `fan_radial`, `diamond`, `honeycomb_grad`, `louver`, `triangles`, `swirl`, `brick`, `teardrop`, `sine_wave`, or `none`) for Rear, Top, Right, and Left faces.
* **Rear Auto-Arrange Engine:** Automatically balances, spaces, and centers all connectors assigned to the rear panel.
* **Reinforced Internal Hardware:** Integrated USB-C trigger cradle with a grounded anti-sag pillar, chassis floor zip-tie anchor bridges, and standoffs for ideal-diode protection boards.
* **Granular Modular Architecture:** One file per port and per vent pattern. `main.scad` holds every Customizer variable and the render stage; `modules/` holds pure logic, cutouts, vents, and chassis geometry wired with `include <>`.
* **Single-File Distribution:** Run `python build.py` to inline the whole tree into `YAPBPS_merged.scad` for sharing, with no logic changes.

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
| **XT30E-M** | `Rear` | Compact flanged panel-mount DC connector |
| **Aviation Plug** | `Right` | Circular GX12 or GX16 threaded metal connector |
| **Anderson Powerpole** | `Rear` | Dual 15A/30A/45A modular quick-disconnect |
| **Push Button** | `Front_Lip` | 16mm circular metal / LED standby pushbutton |
| **USB-A** | `Front_Lip` | Standard panel-mount USB-A port |
| **C14 Inlet** | `Rear` | IEC 60320 C14 mains inlet |
| **Cooling Fan** | `Rear` | Axial fan cutout with screw ring (parameterized size) |
| **Potentiometer** | `Front_Lip` | Knurled-shaft pot / encoder bore |
| **LED 5mm** | `Front_Lip` | 5mm panel LED bezel bore |
| **Keystone RJ45** | `Rear` | Keystone Ethernet jack cutout |
| **Fuse 5x20** | `Rear` | Panel-mount 5x20mm fuse holder |

---

## Print Settings (PETG Recommended)

* **Material:** PETG or PETG-HF (highly recommended for thermal stability around high-power regulators and ductile snap-fits). PLA+ can be used for prototyping.
* **Build Plate:** Textured PEI plate recommended for a uniform external finish on the side door.
* **Orientation & Supports:**
  * **100% Support-Free:** Both the chassis and the door require NO supports. Bridging settings must be tuned for the top flat landing and hexagonal vents.
* **Perimeters / Wall Lines:** 4 to 5 loops (ensures vent grids, dovetail hooks, and screw bosses are 100% solid plastic).
* **Infill:** 20% – 25% (Gyroid).
* **Assembly Hardware Required:**
  * **Lid retention:** 1x M3 x 8mm countersunk screw (threads directly into plastic or into an M3 heat-set brass insert).
  * **Auxiliary boards (Optional):** 4x M3 heat-set inserts (`4.2 mm` cavity) for internal standoffs.
  * **Cable management:** Standard 2.5mm nylon zip-ties.

---

## How to Export STLs

1. Open `main.scad` in [OpenSCAD](https://openscad.org/) (v2021.01 or newer). Never open files under `modules/` directly.
2. Open the **Customizer** panel (`Window` -> `Customizer`) to adjust dimensions, ports, and ventilation. All parameters live in `main.scad`: `Render & Tolerances`, `Preview Colors`, `Assembly Preview`, `Rear Retention Hook System`, `Ventilation Grids & Margins`, `Rear Auto-Arrange Engine`, per-port sections, `Internal Accessories`, `Labels & Engraving`, and `Chassis Dimensions`.
3. Toggle `enable_assembly_view` and press **F5** (Preview) to visualize the closed case, test `preview_slide` / `preview_explode`, and check for collision warnings in the console.
4. **Export the Chassis:**
   * Set `render_main_body = true` and `render_side_lid = false`.
   * Press **F6** (Render). Assembly view disables automatically and the part lays flat for printing.
   * Press **F7** to export `YAPBPS_Chassis.stl`.
5. **Export the Door:**
   * Set `render_main_body = false` and `render_side_lid = true`.
   * Press **F6** (Render), then **F7** to export `YAPBPS_Lid.stl` (already pre-oriented flat on `Z=0` for slicing).

---

## Project Structure

```text
YAPBPS/
├── main.scad                        # Entry point: Customizer variables + place_port() + apply_*() + render stage
├── YAPBPS.scad                      # Legacy single-file source (reference, unchanged)
├── YAPBPS_merged.scad               # Generated single-file distribution (via build.py, do not edit by hand)
├── build.py                         # Merge tool: recursively inlines include <> into YAPBPS_merged.scad
└── modules/
    ├── core_logic.scad              # ALL_PORTS_REGISTRY, rear auto-arrange, collision audit, validate_configuration()
    ├── chassis_and_lid.scad         # Shell extrusion, base_case(), lid_assembly(), render_port_bracket(), anchors
    ├── cutouts/
    │   ├── cutouts.scad             # Aggregator only (includes base/ports/core, no geometry)
    │   ├── base/helpers.scad        # rounded_rect_2d(), tool_through(), engrave_text()
    │   ├── ports/cutout_*.scad      # One file per port + _TEMPLATE_port.scad (example only, not included)
    │   └── core/dispatcher.scad     # render_port_cutout(type) string-keyed dispatcher
    └── vent/
        ├── ventilation.scad         # Aggregator only (includes common/patterns/core, no geometry)
        ├── common/clamp.scad        # clamp_val()
        ├── patterns/tool_*.scad     # One file per pattern + _TEMPLATE_vent.scad (example only, not included)
        └── core/vent_panel.scad     # vent_panel(panel, p_w, p_h) margin framing + pattern dispatcher
```

The project uses `include <>`, not `use <>`, intentionally: `include` keeps globals assigned in `main.scad` (`print_tolerance`, `case_width`, `wall_thickness`, per-port enable/panel/U/V, `vent_type_*`, margins) visible inside every module file. Keep the four wiring lines in `main.scad` unchanged:

```scad
include <modules/core_logic.scad>
include <modules/cutouts/cutouts.scad>
include <modules/vent/ventilation.scad>
include <modules/chassis_and_lid.scad>
```

---

## Contributing Custom Connectors

The project uses a unified dispatch matrix (`ALL_PORTS_REGISTRY` in `modules/core_logic.scad`), making it incredibly easy to add new connectors without messing with 3D matrix math:

1. **Add Customizer Parameters:** In `main.scad`, define the toggle, target panel, position percentages (`U`/`V`), and label text for the new port.
2. **Create a Cutout Module:** Copy `modules/cutouts/ports/_TEMPLATE_port.scad` to `modules/cutouts/ports/cutout_myport.scad`, rename the module to `cutout_myport()`, and implement the through bore centered at `[0,0,0]` cutting through Z (35mm depth convention, use `tool_through()` with `print_tolerance`).
3. **Include the Leaf File:** Add `include <ports/cutout_myport.scad>` to `modules/cutouts/cutouts.scad` before `core/dispatcher.scad`.
4. **Register in the Dispatcher:** Add your type branch to `render_port_cutout(type)` in `modules/cutouts/core/dispatcher.scad` (e.g. `else if (type == "myport") cutout_myport();`).
5. **(Optional) Add Internal Bracket:** Define a support pillar in `render_port_bracket(type, z_h)` inside `modules/chassis_and_lid.scad`.
6. **Update `ALL_PORTS_REGISTRY`:** Add a new row in `modules/core_logic.scad` defining enable flag, panel, `U`/`V`, label, type string, and bounding box size (used for auto-arrange and collision detection).
7. **Rebuild the Distribution:** Run `python build.py` to regenerate `YAPBPS_merged.scad`.

---

## Adding Custom Ventilation Patterns

1. **Copy the Template:** Copy `modules/vent/patterns/_TEMPLATE_vent.scad` to `modules/vent/patterns/tool_myvent.scad` and rename the module to `tool_myvent(w, h, ...)`.
2. **Clip to the Vent Field:** Intersect your repeating geometry with `cube([w, h, 35], center = true)` so the pattern never bleeds outside its panel frame.
3. **Include the Leaf File:** Add `include <patterns/tool_myvent.scad>` to `modules/vent/ventilation.scad` before `core/vent_panel.scad`.
4. **Register in the Dispatcher:** Add an `else if (v_type == "myvent") tool_myvent(w, h, ...);` branch in `modules/vent/core/vent_panel.scad`.
5. **Expose in the Customizer:** Select the new key via `vent_type_rear`, `vent_type_top`, `vent_type_right`, or `vent_type_left` in `main.scad` and tune `vent_size`, `vent_spacing`, and panel margins.
6. **Rebuild the Distribution:** Run `python build.py` to regenerate `YAPBPS_merged.scad`.

Templates (`_TEMPLATE_port.scad`, `_TEMPLATE_vent.scad`) are examples only and are intentionally NOT included by the aggregators.

---

## Single-File Distribution (build.py)

`build.py` reads `main.scad`, recursively inlines every `include <...>` directive, and writes `YAPBPS_merged.scad` for distribution. Requires Python 3.10+ (not needed for modeling).

```powershell
cd C:\Users\LorenzoCamuso\Desktop\YAPBPS
python build.py
```

Behavior:

* Default entry is `main.scad`, default output is `YAPBPS_merged.scad` written next to the script.
* Each inlined file is marked with `// --- inlined: <relative path> ---`.
* Duplicate includes are skipped with a warning (include-loop guard).
* Missing includes raise `FileNotFoundError`.
* Re-run the script after every change to `main.scad` or any file under `modules/` before sharing the merged file.

Programmatic use:

```python
from build import build

build(entry_name="main.scad", output_name="YAPBPS_merged.scad")
```

The modular split is structural only. Geometry, defaults, ranges, panel names, vent patterns, registry entries, auto-arrange math, validation rules, and render behavior are identical to `YAPBPS.scad`. Edit `main.scad` and `modules/` going forward, then regenerate `YAPBPS_merged.scad`.

---

## License

Released under the **MIT License**. Feel free to fork, adapt, and build upon this design.
