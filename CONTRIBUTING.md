# Contributing to YAPBPS

First off, thank you for considering contributing to **YAPBPS (Yet Another Parametric Bench Power Supply)**! Modular and community-driven expansion is at the core of this project.

Please take a moment to review this document to ensure a smooth workflow and maintain high parametric consistency across the codebase.

---

## Code of Conduct

This project adheres to standard open-source community guidelines. Please be respectful, constructive, and considerate of other contributors in issues, discussions, and pull requests.

---

## Architecture Overview

YAPBPS uses OpenSCAD's `include <>` mechanism (not `use <>`) so global variables defined in `main.scad` (such as tolerances, shell parameters, and margins) remain accessible across all submodules.

```text
YAPBPS/
├── main.scad                          # Customizer parameters + placement engine + render stage
├── build.py                           # Bundler: inlines include <> into YAPBPS_merged.scad
└── modules/
    ├── core_logic.scad                # ALL_PORTS_REGISTRY, collision audit, auto-arrange
    ├── chassis_and_lid.scad           # Geometry, shell, lid assembly, brackets
    ├── cutouts/
    │   ├── base/helpers.scad          # rounded_rect_2d(), tool_through(), engrave_text()
    │   ├── ports/cutout_*.scad        # Individual port cutout definitions
    │   ├── cutouts.scad               # Cutouts aggregator
    │   └── core/dispatcher.scad       # Port string dispatcher
    └── vent/
        ├── common/clamp.scad          # Utility math helpers
        ├── patterns/tool_*.scad       # Individual vent pattern modules
        ├── ventilation.scad           # Vent patterns aggregator
        └── core/vent_panel.scad       # Vent panel framing + dispatcher
```

---

## Adding a New Connector / Port

Adding a port does not require editing 3D projection or rotation math. Follow these steps:

1. **Create the Leaf Cutout File:**
   - Copy `modules/cutouts/ports/_TEMPLATE_port.scad` to `modules/cutouts/ports/cutout_<port_name>.scad`.
   - Name the module `cutout_<port_name>()`.
   - The cutout must be centered at `[0, 0, 0]` and bore along the **Z-axis** using the 35mm depth convention (use `tool_through()` with `print_tolerance`).

2. **Register in the Cutouts Aggregator:**
   - In `modules/cutouts/cutouts.scad`, add:
     ```scad
     include <ports/cutout_<port_name>.scad>
     ```
   - Place this line **before** `core/dispatcher.scad`.

3. **Wire the Port Dispatcher:**
   - In `modules/cutouts/core/dispatcher.scad`, add a branch to `render_port_cutout(type)`:
     ```scad
     else if (type == "<port_name>") cutout_<port_name>();
     ```

4. **(Optional) Add Internal Support Brackets:**
   - If the connector requires an internal retention pillar or cradle, add its geometry under `render_port_bracket(type, z_h)` in `modules/chassis_and_lid.scad`.

5. **Register in `ALL_PORTS_REGISTRY`:**
   - In `modules/core_logic.scad`, add an entry to the unified registry matrix. Specify:
     - Enable flag variable
     - Panel assignment variable
     - U / V coordinate variables
     - Engraved label variable
     - Type identifier string (`"<port_name>"`)
     - Bounding box dimensions `[width, height]` (critical for collision audit and auto-arrange).

6. **Expose in `main.scad`:**
   - Add the Customizer toggles and position variables (`enable_*`, `panel_*`, `u_*`, `v_*`, `label_*`) in their appropriate Customizer section.

7. **Rebuild the Merged Distribution:**
   - Run `python build.py` to regenerate `YAPBPS_merged.scad`.

---

## Adding a New Ventilation Pattern

1. **Create the Vent Leaf File:**
   - Copy `modules/vent/patterns/_TEMPLATE_vent.scad` to `modules/vent/patterns/tool_<pattern_name>.scad`.
   - Implement `tool_<pattern_name>(w, h, ...)`.

2. **Enforce Vent Boundary Clipping:**
   - Always intersect repeating vent geometry with a bounding field:
     ```scad
     cube([w, h, 35], center = true);
     ```
     This prevents cutout geometry from bleeding outside the allocated panel area.

3. **Register in the Vent Aggregator:**
   - In `modules/vent/ventilation.scad`, add:
     ```scad
     include <patterns/tool_<pattern_name>.scad>
     ```
   - Place this line **before** `core/vent_panel.scad`.

4. **Wire the Vent Dispatcher:**
   - In `modules/vent/core/vent_panel.scad`, add the branch:
     ```scad
     else if (v_type == "<pattern_name>") tool_<pattern_name>(w, h, ...);
     ```

5. **Expose in `main.scad`:**
   - Add `<pattern_name>` to the Customizer dropdown options for `vent_type_rear`, `vent_type_top`, `vent_type_right`, and `vent_type_left`.

6. **Rebuild the Distribution:**
   - Run `python build.py`.

---

## Development & Testing Checklist

Before opening a pull request:

- [ ] Open `main.scad` in OpenSCAD (v2021.01+) and ensure it renders cleanly without compilation errors.
- [ ] Enable `enable_assembly_view = true` and verify that the 2D collision audit in the OpenSCAD console does not flag unexpected port overlaps.
- [ ] Check both `render_main_body = true` and `render_side_lid = true` independently with **F6** (Render) to guarantee manifold geometry.
- [ ] Run `python build.py` and ensure `YAPBPS_merged.scad` is up-to-date and compiles identically to the modular source.
- [ ] Ensure any newly created template files or draft notes remain excluded from the aggregators.

---

## Submitting Pull Requests

1. Fork the repository and create your feature branch:
   ```bash
   git checkout -b feature/new-connector-name
   ```
2. Commit your changes with clear, descriptive commit messages:
   ```bash
   git commit -m "feat(cutouts): add GX20 aviation plug cutout and registry entry"
   ```
3. Push your branch to GitHub:
   ```bash
   git push origin feature/new-connector-name
   ```
4. Open a Pull Request targeting the `main` branch. Provide a brief explanation of the added component, its real-world dimensions, and any testing performed.
