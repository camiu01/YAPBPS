# YAPBPS (Yet Another Parametric Bench Power Supply)

A fully parametric, modular 3D-printable enclosure designed in OpenSCAD for custom DC-DC bench power supply builds (SK200W, SK150C, and similar digital modules).

Featuring a classic console-style angled profile, a slide-to-lock service door, dynamic multi-pattern ventilation, and a coordinate-based matrix placement engine that allows arbitrary assignment of input/output ports to any face of the chassis.

---

## Highlights

* **Angled Console Profile:** Optimizes screen viewing angles and control access on the bench while maintaining a flat top deck.
* **Universal Matrix Placement Engine:** Move any connector to any panel (`Front_Slope`, `Front_Lip`, `Top`, `Rear`, `Right`, `Left`) using horizontal and vertical percentage coordinates (`U`, `V`).
* **Z-Dovetail Slide-to-Lock Door:** Completely hinge-free. The left service door slides along rear dovetail mortises and locks with a single front M3 screw. An integrated stepped collar prevents light bleed and panel flex.
* **Active Collision Auditing:** A built-in 2D bounding-box engine audits your port coordinates and throws warnings in the console if two connectors overlap on the same face.
* **Rear Auto-Arrange:** Automatically balances, centers, and spaces all connectors assigned to the rear panel.
* **Per-Panel Dynamic Ventilation:** Choose independent cooling patterns (`hex`, `slots`, `diag_slots`, `chevron`, `louver`, `swirl`, `sine_wave`, `fan_radial`, etc.) for Rear, Top, Right, and Left faces.
* **Integrated Hardware Infrastructure:** Built-in floor zip-tie bridges, an anti-sag grounded pillar for the USB-C trigger PCB, and M3 standoffs for ideal-diode protection boards.

---

## Supported Hardware & Cutouts Out-of-the-Box

| Component | Default Panel | Description / Standards |
| :--- | :--- | :--- |
| **Front Display Meter** | `Front_Slope` | SK200W / SK150C DC-DC modules with flush-mount bezel counterbore |
| **Banana Binding Posts** | `Front_Lip` | Dual isolated 4mm posts (standard 19.05 mm / 3/4" pitch) |
| **XT60E-M** | `Rear` | Flanged DC input with dual M3 screw anchors |
| **DC Barrel Jack** | `Rear` | Standard 5.5 x 2.5 mm threaded bulkhead jack |
| **KF2EDG** | `Rear` | Pluggable industrial screw terminal block |
| **USB-C PD Trigger** | `Rear` | Front-slotted port with interior retention cradle & floor support |
| **Power Switch** | `Right` | Standard KCD1 rectangular rocker switch |
| **XT30E-M** | `Rear` | Compact flanged panel-mount DC connector |
| **Aviation Plug** | `Right` | Circular GX12 or GX16 threaded metal connector |
| **Anderson Powerpole** | `Rear` | Dual 15A/30A/45A modular quick-disconnect |
| **Push Button** | `Front_Lip` | 16mm circular metal / LED standby pushbutton |
| **USB-A** | `Front_Lip` | Standard panel-mount USB-A port |
| **C14 AC Inlet** | `Rear` | IEC 60320 C14 mains power socket |
| **Cooling Fan** | `Rear` | Axial fan cutout with mounting ring (parameterized size) |
| **Potentiometer** | `Front_Lip` | Rotary potentiometer / encoder bore |
| **LED 5mm** | `Front_Lip` | 5mm panel LED bezel bore |
| **Keystone RJ45** | `Rear` | Snap-in modular network pass-through |
| **Fuse 5x20** | `Rear` | Panel-mount 5x20 mm fuse holder |

---

## Getting Started

### Prerequisites

* [OpenSCAD](https://openscad.org/) (v2021.01 or newer) - Parametric CAD modeling engine
* [Python](https://www.python.org/) (v3.10 or newer) - Only required for single-file distribution builds (`build.py`)

### Setup & Customization

1. Clone the repository:
   ```bash
   git clone [https://github.com/camiu01/YAPBPS.git](https://github.com/camiu01/YAPBPS.git)
   cd YAPBPS

```

2. Open the main entry point:
```bash
openscad main.scad

```


*(Note: Always open `main.scad`. Never open module files under `modules/` directly.)*
3. Enable the Customizer interface:
In OpenSCAD, open the menu and enable `Window` -> `Customizer` to adjust dimensions, ports, positions, and ventilation.
4. (Optional) Generate the unified single-file distribution:
```powershell
python build.py

```



---

## Verification & Testing

### Interactive Previews & Clearances

* Press **F5** in OpenSCAD with `enable_assembly_view = true` to view the assembled console.
* Use `preview_slide` and `preview_explode` sliders to inspect the dovetail fit and internal spacing.
* Check the OpenSCAD console output. The placement engine automatically audits clearances and flags overlaps:
```text
ECHO: "WARNING: Port overlap detected on Rear panel between [XT60E-M] and [DC_Jack]"

```



### Modular Build Integrity

Run the distribution merger to verify file tree includes and include guards:

```powershell
python build.py

```

---

## Manufacturing & Deployment

### 1. Export STLs

* **Chassis:** Set `render_main_body = true` and `render_side_lid = false`. Press **F6** (Render), then **F7** to export `YAPBPS_Chassis.stl`.
* **Side Door:** Set `render_main_body = false` and `render_side_lid = true`. Press **F6** (Render), then **F7** to export `YAPBPS_Lid.stl` (pre-oriented flat on `Z = 0`).

### 2. Slicer & Print Settings

* **Filament:** PETG or PETG-HF (recommended for thermal resistance near regulators and ductile snap-fits).
* **Build Plate:** Textured PEI Plate recommended.
* **Fuzzy Skin:** Enable **Fuzzy Skin: Contour Only** (Thickness: `0.1 mm`, Point Distance: `0.25 mm`) on the chassis for a clean matte finish without compromising internal dovetail tolerances.
* **Supports:**
* **Chassis:** Supports required for port cutouts and overhangs (tree/organic supports recommended).
* **Side Door:** Prints flat on the sheet with supports disabled (None).


* **Wall Loops:** 4 to 5 (ensures vent grids, dovetail guides, and screw bosses are solid plastic).
* **Infill:** 20% – 25% Gyroid.

### 3. Assembly Hardware

* **Lid Retention:** 1x M3 x 8mm countersunk screw (threads directly into plastic or an M3 heat-set insert).
* **Internal Standoffs (Optional):** Up to 4x M3 heat-set brass inserts (4.2 mm hole) for auxiliary boards.
* **Cable Management:** 2.5 mm nylon zip-ties for the base plate tie-down loops.

---

## Built With

* [OpenSCAD](https://openscad.org/) - The Programmers Solid 3D CAD Modeller
* [Python](https://www.python.org/) - Scripting engine used for modular inlining and distribution bundling

---

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for guidelines on code standards and the pull request process.

To add new ports or vent patterns:

1. Copy `modules/cutouts/ports/_TEMPLATE_port.scad` or `modules/vent/patterns/_TEMPLATE_vent.scad`.
2. Implement your geometry centered at `[0,0,0]`.
3. Register the new module in the respective aggregator and dispatcher files.
4. Add the entry to `ALL_PORTS_REGISTRY` in `modules/core_logic.scad` and expose it in `main.scad`.
5. Run `python build.py` to update the merged distribution file.

---

## Versioning

We use [Semantic Versioning](https://semver.org/). For available releases, see the [tags on this repository](https://github.com/camiu01/YAPBPS/tags).

---

## Authors

* **Camiu** - *Initial work & design* - [camiu01](https://github.com/camiu01)

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```

```
