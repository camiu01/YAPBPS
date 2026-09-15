# YAPBPS (Yet Another Parametric Bench Power Supply)

A fully parametric, modular 3D-printable enclosure designed in OpenSCAD for custom DC-DC bench power supply builds (SK200W, SK150C, and similar digital modules). Featuring an angled console profile, a 100% support-free slide-to-lock service door, dynamic multi-pattern ventilation, and a coordinate-based matrix placement engine that allows arbitrary assignment of input/output ports to any face of the chassis.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for modeling, customizing, and slicing. See deployment for notes on 3D printing and hardware assembly.

### Prerequisites

Requirements for software and tools needed to customize and build the project:

* [OpenSCAD](https://openscad.org/) (v2021.01 or newer) - Parametric CAD modeling engine
* [Python](https://www.python.org/) (v3.10 or newer) - Required only for generating single-file distribution builds

### Installing

A step-by-step series of instructions to set up your local development environment:

1. Clone or download the repository to your machine:

    ```bash
    git clone https://github.com/camiu01/YAPBPS.git
    cd YAPBPS
    ```

2. Open the entry point in OpenSCAD:

    ```bash
    openscad main.scad
    ```
    *(Note: Always open `main.scad`, never open files under `modules/` directly.)*

3. Enable the Customizer interface:

    In OpenSCAD, open the menu and enable `Window` -> `Customizer` to access dimensions, connector toggles, coordinates, and vent patterns.

4. (Optional) Generate the unified single-file distribution:

    ```powershell
    python build.py
    ```

## Running the tests

The project includes an active collision detection engine and interactive visual checks to audit connector spacing and door clearances before slicing.

### Sample Tests

Verify panel clearances and component placements directly inside OpenSCAD:

1. Toggle `enable_assembly_view = true` in the Customizer and press **F5**.
2. Check the OpenSCAD console for clearance audits. If two ports overlap on the same face, the matrix engine prints a warning:

    ```text
    ECHO: "WARNING: Port overlap detected on Rear panel between [XT60E-M] and [DC_Jack]"
    ```

3. Test tolerances using the `preview_slide` and `preview_explode` sliders to confirm door mortise alignment.

### Style test

Audit the modular source tree and include integrity before distribution:

```powershell
python build.py
```

`build.py` verifies recursive `include <>` directives, guards against duplicate includes, and asserts that required leaf modules exist across `modules/cutouts/` and `modules/vent/`.

## Deployment

To export manufacturing-ready STL files and assemble the physical chassis:

### 1. Export STLs
* **Chassis:** Set `render_main_body = true` and `render_side_lid = false`. Press **F6** (Render), then **F7** to export `YAPBPS_Chassis.stl`.
* **Side Door:** Set `render_main_body = false` and `render_side_lid = true`. Press **F6** (Render), then **F7** to export `YAPBPS_Lid.stl` (pre-oriented flat on Z=0).

### 2. Slicer & Print Settings
* **Material:** PETG or PETG-HF (recommended for thermal stability and ductile snaps).
* **Supports:** 100% Support-Free (ensure bridging is tuned for flat landings and vents).
* **Perimeters / Walls:** 4 to 5 loops (solid vent ribs and screw bosses).
* **Infill:** 20% – 25% Gyroid.

### 3. Hardware Assembly
* **Lid Retention:** 1x M3 x 8mm countersunk screw (direct thread or into an M3 heat-set brass insert).
* **Internal Standoffs (Optional):** 4x M3 heat-set inserts (4.2 mm cavity) for auxiliary/ideal-diode boards.
* **Wiring:** 2.5mm nylon zip-ties through floor anchor bridges.

## Built With

* [OpenSCAD](https://openscad.org/) - The Programmers Solid 3D CAD Modeller
* [Python](https://www.python.org/) - Scripting engine used for modular inlining and distribution bundling

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

To add new ports or vent patterns:
1. Copy `modules/cutouts/ports/_TEMPLATE_port.scad` or `modules/vent/patterns/_TEMPLATE_vent.scad`.
2. Implement your geometry centered at `[0,0,0]`.
3. Register the new module in the respective aggregator and dispatcher files.
4. Add the entry to `ALL_PORTS_REGISTRY` in `modules/core_logic.scad` and expose it in `main.scad`.
5. Run `python build.py` to update the merged distribution file.

## Versioning

We use [Semantic Versioning](http://semver.org/) for versioning. For available releases, see the [tags on this repository](https://github.com/camiu01/YAPBPS/tags).

## Authors

* **Camiu** - *Initial work & design* - [camiu01](https://github.com/camiu01)

See also the list of [contributors](https://github.com/camiu01/YAPBPS/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
