# YAPBPS (Yet Another Parametric Bench Power Supply)

A fully parametric, modular 3D-printable enclosure designed in OpenSCAD for custom DC-DC bench power supply builds (SK200W, SK150C, and similar digital modules).

Featuring a classic angled console profile, a 100% support-free slide-to-lock service door, dynamic multi-pattern ventilation, and a coordinate-based matrix placement engine that allows arbitrary assignment of input/output ports to any face of the chassis.

---

## Key Features

* **Console Form Factor:** Angled front face for optimal viewing and control access on the workbench, combined with a flat top landing.
* **Universal Matrix Placement Engine:** Move any connector to any panel (`Front_Slope`, `Front_Lip`, `Top`, `Rear`, `Right`, `Left`) using horizontal and vertical percentage coordinates (`U`, `V`).
* **Z-Dovetail Slide-to-Lock Door:** Completely hinge-less and 100% support-free. The left service door slides into rear wall mortises via dovetail joints and locks securely with a single front M3 screw. An integrated stepped collar prevents light bleed and panel flex.
* **Live Assembly Simulation & Smart Export:** Uses OpenSCAD's `$preview` environment. Press **F5** to see the fully assembled case with interactive sliders to open/slide the door. Press **F6** and the script automatically lays the selected parts flat on the virtual build plate for STL export.
* **Active Collision Detection:** A built-in 2D bounding-box engine audits your port coordinates and throws console warnings if two connectors overlap on the same panel.
* **Per-Panel Dynamic Ventilation:** Choose independent cooling patterns (`hex`, `slots`, `round`, `diag_slots`, or `none`) for Rear, Top, Right, and Left faces.
* **Rear Auto-Arrange Engine:** Automatically balances, spaces, and centers all connectors assigned to the rear panel.
* **Reinforced Internal Hardware:** Integrated USB-C trigger cradle with a grounded anti-sag pillar, chassis floor zip-tie anchor bridges, and standoffs for ideal-diode protection boards.

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

1. Open `YAPBPS.scad` in [OpenSCAD](https://openscad.org/) (v2021.01 or newer).
2. Open the **Customizer** panel (`Window` -> `Customizer`) to adjust dimensions, ports, and ventilation.
3. Toggle `enable_assembly_view` and press **F5** (Preview) to visualize the closed case and check for collision warnings in the console.
4. **Export the Chassis:**
   * Set `render_main_body = true` and `render_side_lid = false`.
   * Press **F6** (Render). The script will automatically lay the part flat for printing.
   * Press **F7** to export `YAPBPS_Chassis.stl`.
5. **Export the Door:**
   * Set `render_main_body = false` and `render_side_lid = true`.
   * Press **F6** (Render), then **F7** to export `YAPBPS_Lid.stl`.

---

## Contributing Custom Connectors

The project uses a unified dispatch matrix (`ALL_PORTS_REGISTRY`), making it incredibly easy to add new connectors without messing with 3D matrix math:

1. **Add Customizer Parameters:** Define the toggle, target panel, position percentages (`U`/`V`), and label text at the top of the file.
2. **Create a Cutout Module:** In the `VENTILATION & CUTTING TOOLS` section, create your `cutout_myport()` 3D tool (centered at `[0,0,0]`, cutting through Z).
3. **Register in the Dispatcher:** Add your type branch to the `render_port_cutout(type)` module.
4. **(Optional) Add Internal Bracket:** Define a support pillar in `render_port_bracket(type, z_h)`.
5. **Update `ALL_PORTS_REGISTRY`:** Add a new row to the main matrix defining its bounding box size (used for auto-arrange and collision detection).

---

## License

Released under the **MIT License**. Feel free to fork, adapt, and build upon this design.