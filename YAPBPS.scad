// ==============================================================================
// YAPBPS (Yet Another Parametric Bench Power Supply)
// ==============================================================================
// Fully parametric OpenSCAD chassis for custom DC-DC bench power supply builds.
// Featuring a 100% Support-Free Dual Rear L-Hook & Single Front M3 Screw Retention System.
// ==============================================================================

/* [Render & Tolerances] */

// Clearance offset applied to all slots, snap fits, and hooks for FDM printer tolerances (mm)
print_tolerance = 0.4; // [0.1:0.05:1.2]

// Generate the primary enclosure chassis body
render_main_body = true;

// Generate the removable side service lid (pre-oriented flat on Z=0 for slicing)
render_side_lid = false;

// Mesh circle and arc facet resolution count
$fn = 60; // [20:10:120]


/* [Preview Colors] */

// Primary enclosure chassis body color in OpenSCAD preview (F5)
color_case = "#333333";

// Removable side service lid color in OpenSCAD preview (F5)
color_lid = "#FF8C00";

// Internal hardware accessories (tabs, standoffs, PCB rails) preview color (F5)
color_mnt = "#FF8C00";


/* [Rear Retention Hook System] */

// Vertical width/span of each rear retention hook tab (mm)
hook_w = 12.0; // [8.0:1.0:20.0]

// Material thickness of each retention hook tab (mm)
hook_t = 1.8; // [1.2:0.1:3.0]

// Depth of internal engagement behind the rear chassis wall (mm)
hook_reach = 3.5; // [2.0:0.5:6.0]


/* [Ventilation Grids & Margins] */

// Rear vertical wall ventilation pattern
vent_type_rear = "hex"; // [hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, none: Disabled]

// Top horizontal landing flat panel ventilation pattern
vent_type_top = "slots"; // [hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, none: Disabled]

// Right side chassis panel ventilation pattern
vent_type_right = "hex"; // [hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, none: Disabled]

// Left removable lid panel ventilation pattern
vent_type_left = "round"; // [hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, none: Disabled]

// Diameter of round/hex perforation holes or height of vent slots (mm)
vent_size = 6.0; // [3.0:0.5:12.0]

// Structural spacing between adjacent ventilation cutouts (mm)
vent_spacing = 2.0; // [1.0:0.5:6.0]

// Clearance distance from top outer edge down to ventilation perimeter (mm)
margin_top = 10.0; // [5.0:1.0:30.0]

// Clearance distance from floor up to ventilation perimeter (mm)
margin_bottom = 35.0; // [15.0:1.0:60.0]

// Left margin clearance from outer corners to ventilation perimeter (mm)
margin_left = 15.0; // [5.0:1.0:30.0]

// Right margin clearance from outer corners to ventilation perimeter (mm)
margin_right = 15.0; // [5.0:1.0:30.0]

// Clearance distance keeping side vents back from the front angled slope (mm)
margin_diagonal = 15.0; // [5.0:1.0:30.0]


/* [Rear Auto-Arrange Engine] */

// Automatically center and distribute all connectors assigned to the Rear panel
auto_arrange_rear = true;

// Center-to-center clearance between adjacent rear connectors (mm)
rear_port_spacing = 5.0; // [3.0:0.5:20.0]

// Vertical elevation percentage from base for auto-arranged rear ports (%)
rear_port_v_pct = 25.0; // [10.0:1.0:90.0]

/* [Universal Internal Brackets] */

// Enable internal rear retention bracket and support pillar for USB-C
enable_bracket_usbc = true;

// Enable internal support pillar for XT60 connector
enable_bracket_xt60 = true;

// Enable internal support pillar for DC Barrel Jack socket
enable_bracket_dc = false;

// Enable internal support pillar for KF2EDG screw terminal
enable_bracket_kf2edg = true;

// Enable internal support pillar for XT30 connector
enable_bracket_xt30 = false;

// Enable internal support pillar for Powerpole paired connector
enable_bracket_pp = false;

// Enable internal support collar for front digital display module
enable_bracket_front_module = false;

// Enable internal support collar for banana binding posts
enable_bracket_banana = false;

// Enable internal support collar for rocker master switch
enable_bracket_switch = false;

// Enable internal support collar for GX aviation connector
enable_bracket_gx = false;

// Enable internal support collar for round push button
enable_bracket_round_sw = false;

/* [Port: Front Meter Module (SK200W/SK150C)] */

// Cutout for front panel DC-DC digital display meter
enable_front_module = true;

// Panel assigned to mount the digital meter display
front_mod_panel = "Front_Slope"; // [Front_Slope: Sloped Front, Top: Top Flat Landing, Rear: Rear Wall, Left: Left Lid, None: Disabled]

// Horizontal placement percentage along the target panel (%)
front_mod_u = 50.0; // [0.0:1.0:100.0]

// Vertical placement percentage along the target panel (%)
front_mod_v = 50.0; // [0.0:1.0:100.0]

// Corner fillet contour for main body cutout
cutout_shape = "rounded"; // [rounded: Rounded Rect, square: Sharp Square]

// Side clearance cutouts for module plastic retaining spring tabs
enable_side_tabs = true;

// Exterior rebate counterbore to sink display bezel flush with chassis face
enable_module_flush = true;


/* [Port: Output Banana Jacks] */

// Dual 4mm isolated banana binding posts
enable_banana = true;

// Target panel for banana binding posts
banana_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Top: Top Flat Landing, Rear: Rear Wall, Right: Right Wall, Left: Left Lid, None: Disabled]

// Horizontal placement percentage across target panel (%)
banana_u = 50.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
banana_v = 50.0; // [0.0:1.0:100.0]


/* [Port: Input XT60 Connector] */

// Rear XT60E-M panel mount DC connector cutout
enable_xt60 = true;

// Target panel for XT60 connector
xt60_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
xt60_u = 75.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
xt60_v = 25.0; // [0.0:1.0:100.0]


/* [Port: Input DC Barrel Jack] */

// 5.5x2.5mm panel-mount barrel jack round bore
enable_dc_jack = true;

// Target panel for DC barrel jack socket
dc_jack_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
dc_jack_u = 55.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
dc_jack_v = 25.0; // [0.0:1.0:100.0]


/* [Port: KF2EDG Screw Terminal] */

// Pluggable pitch screw terminal block cutout
enable_kf2edg = true;

// Target panel for KF2EDG terminal block
kf2edg_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
kf2edg_u = 35.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
kf2edg_v = 25.0; // [0.0:1.0:100.0]


/* [Port: USB-C PD Input Port] */

// USB Type-C Power Delivery trigger board slot and internal pedestal
enable_usbc = true;

// Target panel for USB-C PD input
usbc_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
usbc_u = 15.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
usbc_v = 25.0; // [0.0:1.0:100.0]


/* [Port: Master Power Switch] */

// Rectangular rocker master switch cutout (KCD1 type)
enable_switch = true;

// Target panel for master power switch
switch_panel = "Right"; // [Right: Right Wall, Left: Left Lid, Rear: Rear Wall, Front_Lip: Lower Front Lip, Top: Top Flat Landing, None: Disabled]

// Horizontal placement percentage along target panel (%)
switch_u = 50.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
switch_v = 25.0; // [0.0:1.0:100.0]


/* [Port: Optional Aux Connectors] */

// XT30E-M panel mount connector cutout
enable_xt30 = false;

// Target panel for XT30 connector
xt30_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
xt30_u = 85.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
xt30_v = 25.0; // [0.0:1.0:100.0]

// Aviation threaded circular connector (GX series)
enable_gx = false;

// Aviation connector shell size
gx_type = "GX12"; // [GX12: 12mm Aviator, GX16: 16mm Aviator]

// Target panel for Aviation connector
gx_panel = "Right"; // [Right: Right Wall, Left: Left Lid, Rear: Rear Wall, Front_Lip: Lower Front Lip, Top: Top Flat Landing, None: Disabled]

// Horizontal placement percentage along target panel (%)
gx_u = 75.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
gx_v = 25.0; // [0.0:1.0:100.0]

// Anderson Powerpole paired modular connector
enable_powerpole = false;

// Target panel for Powerpole connectors
powerpole_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
powerpole_u = 20.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
powerpole_v = 25.0; // [0.0:1.0:100.0]

// Circular momentary or LED push button cutout
enable_round_switch = false;

// Target panel for round push button
round_sw_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Right: Right Wall, Left: Left Lid, Rear: Rear Wall, Top: Top Flat Landing, None: Disabled]

// Horizontal placement percentage along target panel (%)
round_sw_u = 15.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
round_sw_v = 50.0; // [0.0:1.0:100.0]


/* [Internal Accessories] */

// M3 standoffs on floor for auxiliary electronics (e.g. ideal diode module)
enable_diode_mnt = true;

// Cable routing zip-tie anchor bridges on the chassis floor
enable_zipties = true;


/* [Labels & Engraving] */

// Debossed identifying text above connectors
enable_labels = true;

// Font character height for debossed labels (mm)
label_size = 4.5; // [2.5:0.5:8.0]

// Depth cut into the exterior wall for debossed lettering (mm)
label_depth = 1.0; // [0.4:0.2:2.0]

// Vertical distance from connector center up to label baseline (mm)
label_offset_y = 13.0; // [8.0:1.0:25.0]

// Vertical clearance distance above front meter bezel (mm)
label_offset_sk200 = 32.0; // [20.0:1.0:50.0]

// Text above banana output binding posts
label_front = "OUTPUT";

// Text above front DC-DC display module
label_sk200 = "POWER SUPPLY";

// Text above XT60 connector
label_xt60 = "DC IN";

// Text above DC barrel jack
label_dc_jack = "AUX";

// Text above KF2EDG screw terminal
label_kf2edg = "OUT";

// Text above USB-C PD input port
label_usbc = "PD IN";

// Text above master power switch
label_switch = "PWR";

// Text above XT30 connector
label_xt30 = "XT30";

// Text above Aviation connector
label_gx = "AVIATION";

// Text above Powerpole connector
label_powerpole = "PP45";

// Text above push button
label_round_sw = "STBY";


/* [Chassis Dimensions] */

// Total exterior width across the front face (X-axis, mm)
case_width = 120; // [80:5:250]

// Total exterior footprint depth (Y-axis, mm)
case_depth = 110; // [80:5:250]

// Total exterior chassis height at rear edge (Z-axis, mm)
case_height = 90; // [60:5:180]

// Height of vertical lower front face (mm)
front_lip_height = 35; // [20:5:80]

// Depth of top horizontal flat landing before slope starts (mm)
top_flat_depth = 45; // [20:5:120]

// Structural wall thickness of enclosure (mm)
wall_thickness = 3.0; // [2.0:0.5:6.0]

// Outer chassis perimeter fillet radius (mm)
corner_rad = 3.0; // [1.0:0.5:8.0]

// Interlocking flange insertion depth into chassis cavity (mm)
lid_lip_depth = 2.5; // [1.5:0.5:5.0]

// Wall thickness of the interlocking alignment rim (mm)
lid_lip_wall = 1.5; // [1.0:0.25:3.0]


/* [Hidden] */

// Standard hardware cutouts and offsets
module_body_w       = 64.0 + print_tolerance;
module_body_h       = 45.0 + print_tolerance;
module_corner_rad   = 8.0;
module_tab_w        = 81.0 + print_tolerance;
module_tab_h        = 12.0 + print_tolerance;
module_rim_w        = 68.0 + print_tolerance + 0.2;
module_rim_h        = 48.0 + print_tolerance + 0.2;
module_rim_rad      = 9.5;
module_recess_depth = 1.5;

xt60_w     = 19.0;
xt60_h     = 12.0;
xt60_pitch = 25.0;

xt30_w     = 15.0;
xt30_h     = 10.5;
xt30_pitch = 20.0;

sw_w = 13.4;
sw_h = 19.4;

jack_d = 8.5;
kf2edg_w = 18.5;
kf2edg_h = 15.5;

usb_w         = 9.5;
usb_h         = 3.5;
usbc_pcb_w    = 15.0;
usbc_pcb_l    = 10.0;
usbc_pcb_t    = 1.6;
usbc_offset_y = -1.6;

banan_d     = 8.2;
banan_pitch = 19.05;

gx12_d = 12.0;
gx16_d = 16.0;

pp_w = 16.0;
pp_h = 8.0;

round_sw_d = 16.0;

// Slope geometry kinematics
dy = case_depth - top_flat_depth;
dz = case_height - front_lip_height;
slope_angle  = atan2(dz, dy);
slope_length = sqrt(dy*dy + dz*dz);


// ==============================================================================
// HOW TO ADD A NEW CUSTOM PORT / CONNECTOR
// ==============================================================================
// Follow these 5 steps to add your own port type:
//
// 1. ADD CUSTOMIZER PARAMETERS:
//    Define toggle, target panel, position percentages, and label text above:
//      enable_myport = true;
//      myport_panel  = "Rear"; // [Rear, Right, Left, Top, Front_Lip, Front_Slope, None]
//      myport_u      = 50.0;
//      myport_v      = 25.0;
//      label_myport  = "MY_PORT";
//
// 2. CREATE A CUTOUT MODULE:
//    In the "VENTILATION & CUTTING TOOLS" section, create the 3D tool:
//      module cutout_myport() {
//          // Cutouts must pass completely through the chassis wall (Z depth >= 35mm)
//          cube([12.0 + print_tolerance, 8.0 + print_tolerance, 35], center = true);
//      }
//
// 3. REGISTER IN THE DISPATCHER:
//    Add your type branch in `render_port_cutout(type)`:
//      else if (type == "myport") cutout_myport();
//
// 4. (OPTIONAL) ADD INTERNAL BRACKET:
//    Define a parameter toggle:
//      enable_bracket_myport = false;
//    In `render_port_bracket(type, z_h)` add:
//      else if (type == "myport") universal_chassis_bracket(w = 14, h = 10, depth = 8, z_floor = z_h);
//
// 5. REGISTER IN `ALL_PORTS_REGISTRY`:
//    Add a new line using this column format:
//    [enable, panel, u_pct, v_pct, label, type_id, bbox_width, bbox_height, enable_bracket]
//      [enable_myport, myport_panel, myport_u, myport_v, label_myport, "myport", 16.0, 12.0, enable_bracket_myport],
//
//    * bbox_width/height are used by the rear auto-arrange and collision engines.
// ==============================================================================

// ==============================================================================
// REGISTRY INDICES & DATA MATRIX
// ==============================================================================
REG_EN      = 0;
REG_PANEL   = 1;
REG_U       = 2;
REG_V       = 3;
REG_LABEL   = 4;
REG_TYPE    = 5;
REG_BW      = 6;
REG_BH      = 7;
REG_BRACKET = 8;
ALL_PORTS_REGISTRY = [
    [enable_front_module, front_mod_panel, front_mod_u, front_mod_v, label_sk200,     "front_module", 82.0, 50.0, enable_bracket_front_module],
    [enable_banana,       banana_panel,    banana_u,    banana_v,    label_front,     "banana",       30.0, 16.0, enable_bracket_banana],
    [enable_usbc,         usbc_panel,      usbc_u,      usbc_v,      label_usbc,      "usbc",         16.0, 12.0, enable_bracket_usbc],
    [enable_kf2edg,       kf2edg_panel,    kf2edg_u,    kf2edg_v,    label_kf2edg,    "kf2edg",       22.0, 18.0, enable_bracket_kf2edg],
    [enable_dc_jack,      dc_jack_panel,   dc_jack_u,   dc_jack_v,   label_dc_jack,   "dc_jack",      14.0, 14.0, enable_bracket_dc],
    [enable_xt60,         xt60_panel,      xt60_u,      xt60_v,      label_xt60,      "xt60",         32.0, 16.0, enable_bracket_xt60],
    [enable_switch,       switch_panel,    switch_u,    switch_v,    label_switch,    "switch",       18.0, 24.0, enable_bracket_switch],
    [enable_xt30,         xt30_panel,      xt30_u,      xt30_v,      label_xt30,      "xt30",         26.0, 14.0, enable_bracket_xt30],
    [enable_gx,           gx_panel,        gx_u,        gx_v,        label_gx,        "gx",           20.0, 20.0, enable_bracket_gx],
    [enable_powerpole,    powerpole_panel, powerpole_u, powerpole_v, label_powerpole, "pp",           22.0, 14.0, enable_bracket_pp],
    [enable_round_switch, round_sw_panel,  round_sw_u,  round_sw_v,  label_round_sw,  "round_sw",     20.0, 20.0, enable_bracket_round_sw]
];


// ==============================================================================
// DYNAMIC REAR AUTO-ARRANGE ENGINE
// ==============================================================================
function port_is_on_rear(idx) = ALL_PORTS_REGISTRY[idx][REG_EN] && ALL_PORTS_REGISTRY[idx][REG_PANEL] == "Rear";

function rear_active_count(i=0) = 
    (i >= len(ALL_PORTS_REGISTRY)) ? 0 : 
    (port_is_on_rear(i) ? 1 : 0) + rear_active_count(i + 1);

function rear_total_width(i=0) = 
    (i >= len(ALL_PORTS_REGISTRY)) ? 0 : 
    (port_is_on_rear(i) ? ALL_PORTS_REGISTRY[i][REG_BW] : 0) + rear_total_width(i + 1);

function rear_span_before(target_idx, i=0) = 
    (i >= target_idx) ? 0 : 
    (port_is_on_rear(i) ? ALL_PORTS_REGISTRY[i][REG_BW] + rear_port_spacing : 0) + rear_span_before(target_idx, i + 1);

rear_ports_num = rear_active_count();
rear_cluster_w = rear_total_width() + max(0, rear_ports_num - 1) * rear_port_spacing;
rear_start_x   = (case_width - rear_cluster_w) / 2;

function get_resolved_u(idx) = 
    (auto_arrange_rear && port_is_on_rear(idx)) 
        ? ((rear_start_x + rear_span_before(idx) + ALL_PORTS_REGISTRY[idx][REG_BW] / 2) / case_width) * 100 
        : ALL_PORTS_REGISTRY[idx][REG_U];

function get_resolved_v(idx) = 
    (auto_arrange_rear && port_is_on_rear(idx)) 
        ? rear_port_v_pct 
        : ALL_PORTS_REGISTRY[idx][REG_V];


// ==============================================================================
// 2D BOUNDING-BOX COLLISION DETECTION ENGINE
// ==============================================================================
function panel_extent_w(panel) = 
    (panel == "Rear" || panel == "Top" || panel == "Front_Lip") ? case_width :
    (panel == "Right" || panel == "Left") ? case_depth :
    (panel == "Front_Slope") ? case_width : 100;

function panel_extent_h(panel) = 
    (panel == "Rear" || panel == "Right" || panel == "Left") ? case_height :
    (panel == "Front_Lip") ? front_lip_height :
    (panel == "Top") ? top_flat_depth :
    (panel == "Front_Slope") ? slope_length : 100;

function check_bbox_clash(i, j) = 
    let(pA = ALL_PORTS_REGISTRY[i], pB = ALL_PORTS_REGISTRY[j])
    (pA[REG_EN] && pB[REG_EN] && pA[REG_PANEL] == pB[REG_PANEL] && pA[REG_PANEL] != "None") ?
        let(
            w_panel = panel_extent_w(pA[REG_PANEL]),
            h_panel = panel_extent_h(pA[REG_PANEL]),
            cxA = (get_resolved_u(i) / 100) * w_panel,
            cyA = (get_resolved_v(i) / 100) * h_panel,
            cxB = (get_resolved_u(j) / 100) * w_panel,
            cyB = (get_resolved_v(j) / 100) * h_panel,
            min_dx = (pA[REG_BW] + pB[REG_BW]) / 2,
            min_dy = (pA[REG_BH] + pB[REG_BH]) / 2
        )
        (abs(cxA - cxB) < min_dx && abs(cyA - cyB) < min_dy) : false;

module run_collision_audit(i = 0) {
    if (i < len(ALL_PORTS_REGISTRY)) {
        if (i + 1 <= len(ALL_PORTS_REGISTRY) - 1) {
            for (j = [i + 1 : 1 : len(ALL_PORTS_REGISTRY) - 1]) {
                if (check_bbox_clash(i, j)) {
                    echo(str("⚠️ COLLISION DETECTED: [", ALL_PORTS_REGISTRY[i][REG_TYPE], "] overlaps [", ALL_PORTS_REGISTRY[j][REG_TYPE], "] on panel '", ALL_PORTS_REGISTRY[i][REG_PANEL], "'!"));
                }
            }
        }
        run_collision_audit(i + 1);
    }
}

module validate_configuration() {
    assert(case_width > 2 * wall_thickness, "case_width must be greater than 2 * wall_thickness");
    assert(case_depth > top_flat_depth, "case_depth must exceed top_flat_depth");
    assert(case_height > front_lip_height, "case_height must exceed front_lip_height");
    assert(corner_rad >= 0, "corner_rad cannot be negative");
    assert(print_tolerance >= 0, "print_tolerance cannot be negative");
    if (auto_arrange_rear && rear_cluster_w > (case_width - 2 * margin_left))
        echo("WARNING: Rear auto-arrange width exceeds case inner margins.");
    
    run_collision_audit();
}
validate_configuration();


// ==============================================================================
// TOP-LEVEL RENDER STAGE
// ==============================================================================
if (render_main_body) { 
    base_case(); 
}

if (render_side_lid) {
    // Oriented completely flat on Z=0 with exterior surface contacting build plate
    translate([-15, 0, 0]) 
        rotate([0, -90, 0]) 
        color(color_lid) lid_assembly();
}


// ==============================================================================
// 3D TRANSFORMATION & PLACEMENT ENGINE
// ==============================================================================
module place_port(panel, u, v) {
    if (panel == "Rear") {
        multmatrix([ [-1, 0, 0, case_width - (case_width * u/100)],
                     [ 0, 0, 1, case_depth],
                     [ 0, 1, 0, case_height * v/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Right") {
        multmatrix([ [ 0, 0, 1, case_width],
                     [ 1, 0, 0, case_depth * u/100],
                     [ 0, 1, 0, case_height * v/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Left") {
        multmatrix([ [ 0, 0,-1, 0],
                     [-1, 0, 0, case_depth - (case_depth * u/100)],
                     [ 0, 1, 0, case_height * v/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Front_Lip") {
        multmatrix([ [ 1, 0, 0, case_width * u/100],
                     [ 0, 0,-1, 0],
                     [ 0, 1, 0, front_lip_height * v/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Top") {
        multmatrix([ [ 1, 0, 0, case_width * u/100],
                     [ 0, 1, 0, case_depth - top_flat_depth + (top_flat_depth * (100 - v)/100)],
                     [ 0, 0, 1, case_height],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Front_Slope") {
        c_a = cos(slope_angle); 
        s_a = sin(slope_angle);
        multmatrix([ [ 1,   0,    0, case_width * u/100],
                     [ 0, c_a, -s_a, 0],
                     [ 0, s_a,  c_a, front_lip_height],
                     [ 0,   0,    0, 1] ]) 
            translate([0, slope_length * v/100, 0]) children();
    }
}

function panel_matches_part(panel, is_lid) = is_lid ? (panel == "Left") : (panel != "Left" && panel != "None");

module apply_configured_ports(target_is_lid = false) {
    for (i = [0 : len(ALL_PORTS_REGISTRY) - 1]) {
        item = ALL_PORTS_REGISTRY[i];
        if (item[REG_EN] && panel_matches_part(item[REG_PANEL], target_is_lid)) {
            place_port(item[REG_PANEL], get_resolved_u(i), get_resolved_v(i))
                render_port_cutout(item[REG_TYPE]);
        }
    }
}

module apply_configured_labels(target_is_lid = false) {
    if (enable_labels) {
        for (i = [0 : len(ALL_PORTS_REGISTRY) - 1]) {
            item = ALL_PORTS_REGISTRY[i];
            if (item[REG_EN] && panel_matches_part(item[REG_PANEL], target_is_lid)) {
                offset_y = (item[REG_TYPE] == "front_module") ? label_offset_sk200 : label_offset_y;
                place_port(item[REG_PANEL], get_resolved_u(i), get_resolved_v(i))
                    translate([0, offset_y, 0]) engrave_text(item[REG_LABEL]);
            }
        }
    }
}

module apply_configured_brackets(target_is_lid = false) {
    for (i = [0 : len(ALL_PORTS_REGISTRY) - 1]) {
        item = ALL_PORTS_REGISTRY[i];
        if (item[REG_EN] && item[REG_BRACKET] && panel_matches_part(item[REG_PANEL], target_is_lid)) {
            u_pos = get_resolved_u(i);
            v_pos = get_resolved_v(i);
            p_type = item[REG_TYPE];
            panel  = item[REG_PANEL];

            z_floor = (panel == "Rear" || panel == "Right" || panel == "Left") ? (case_height * v_pos / 100) :
                      (panel == "Front_Lip") ? (front_lip_height * v_pos / 100) : 0;

            place_port(panel, u_pos, v_pos)
                color(color_mnt) render_port_bracket(p_type, z_floor);
        }
    }
}


// ==============================================================================
// UNIVERSAL BRACKETS & FIXTURES ENGINE
// ==============================================================================
module render_port_bracket(type, z_h) {
    if (type == "usbc") {
        usbc_bracket(z_h);
    } else {
        universal_chassis_bracket(w = 18, h = 14, depth = 8, z_floor = z_h);
    }
}

module universal_chassis_bracket(w=16, h=12, depth=8, z_floor=0) {
    // 0.2mm overlap into the wall to guarantee a solid non-manifold union
    translate([0, 0, -wall_thickness - depth/2 + 0.1])
    difference() {
        // Outer bracket collar
        cube([w + 4, h + 4, depth + 0.2], center = true);
        
        // Inner through pocket (extended through the face to prevent floating flakes)
        cube([w, h, depth + 4], center = true);
    }
    
    // Optional floor support pillar
    if (z_floor > wall_thickness) {
        pillar_h = z_floor - (h + 4)/2 - wall_thickness;
        if (pillar_h > 0) {
            translate([0, -(h + 4)/2 - pillar_h/2, -wall_thickness - depth/2 + 0.1])
                cube([w + 4, pillar_h, depth], center = true);
        }
    }
}

module usbc_bracket(port_z = 0) {
    holder_w = usbc_pcb_w + 6; 
    holder_h = usbc_pcb_t + 8;
    
    translate([0, usbc_offset_y, -wall_thickness - usbc_pcb_l/2])
    difference() {
        cube([holder_w, holder_h, usbc_pcb_l], center = true);
        cube([usbc_pcb_w, usbc_pcb_t + 0.2, usbc_pcb_l + 2], center = true);
        translate([0, 5, 0]) cube([usbc_pcb_w - 4, 10, usbc_pcb_l + 2], center = true);
    }
    
    if (port_z > wall_thickness) {
        bottom_y = usbc_offset_y - holder_h/2;
        pillar_h = port_z + bottom_y - wall_thickness;
        if (pillar_h > 0) {
            pillar_cy = bottom_y - pillar_h/2;
            translate([0, pillar_cy, -wall_thickness - usbc_pcb_l/2])
                cube([holder_w, pillar_h, usbc_pcb_l], center = true);
        }
    }
}


// ==============================================================================
// 3D CHASSIS ENGINE
// ==============================================================================
module extrude_and_map(w) {
    multmatrix(m = [[0,0,1,0], [1,0,0,0], [0,1,0,0], [0,0,0,1]])
        linear_extrude(height = w) children();
}

module base_polygon() {
    polygon([
        [0, 0],
        [case_depth, 0],
        [case_depth, case_height],
        [case_depth - top_flat_depth, case_height],
        [0, front_lip_height]
    ]);
}

module profile_2d() {
    offset(r = corner_rad, $fn = 30) offset(delta = -corner_rad) base_polygon();
}

module hollow_shell() {
    difference() {
        extrude_and_map(case_width) profile_2d();
        translate([wall_thickness, 0, 0])
            extrude_and_map(case_width - 2 * wall_thickness)
                offset(delta = -wall_thickness) profile_2d();
    }
}

module base_case() {
    union() {
        color(color_case) {
            difference() {
                // Cutout primary left side wall opening
                difference() {
                    hollow_shell();
                    translate([-1, -1, -1]) 
                        cube([wall_thickness + 1, case_depth + 2, case_height + 2]);
                }
                
                // Cutouts for configured connectors and debossed text labels
                apply_configured_ports(target_is_lid = false);
                apply_configured_labels(target_is_lid = false);

                // Ventilation grids
                vent_panel("Rear", case_width, case_height);
                vent_panel("Top", case_width, top_flat_depth);

                intersection() {
                    vent_panel("Right", case_depth, case_height);
                    translate([-20, 0, 0]) 
                        extrude_and_map(case_width + 40) 
                        offset(delta = -margin_diagonal) profile_2d();
                }

                // Rear retention hook receiver slots (recessed into internal rear wall)
                for (z_pos = [case_height * 0.25, case_height * 0.75]) {
                    // Clearance sliding pocket and locking engagement seat
                    translate([
                        wall_thickness + (hook_t + hook_reach / 2) / 2, 
                        case_depth - wall_thickness - hook_reach / 2, 
                        z_pos
                    ])
                        cube([
                            hook_t + hook_reach / 2 + print_tolerance * 2, 
                            hook_reach + print_tolerance * 2, 
                            hook_w + print_tolerance * 2
                        ], center = true);
                }
            }
        }
        
        // Front threaded M3 mounting tab (secures front lip of the lid)
        color(color_mnt) screw_tab_base();

        if (enable_diode_mnt) 
            color(color_mnt) mount_standoffs(20, 20, 41.0, 24.0);

        if (enable_zipties) {
            color(color_mnt) {
                ziptie_bridge(case_width * 0.50, case_depth - 25, rot = 0);
                ziptie_bridge(case_width - 16, case_depth * 0.45, rot = 90);
                ziptie_bridge(case_width * 0.50, 18, rot = 0);
            }
        }

        apply_configured_brackets(target_is_lid = false);
    }
}


// Removable service door: 100% support-free flat bed assembly
module lid_assembly() {
    union() {
        difference() {
            union() {
                // 1. Solid flat exterior skin (X: 0 to wall_thickness)
                extrude_and_map(wall_thickness) profile_2d();
                
                // 2. Continuous self-supporting interlocking alignment rim (Solidly welded to the skin)
                translate([wall_thickness - 0.1, 0, 0])
                difference() {
                    // Outer rim chamfer
                    hull() {
                        extrude_and_map(0.2) 
                            offset(delta = -wall_thickness - print_tolerance) profile_2d();
                        translate([lid_lip_depth + 0.1, 0, 0]) 
                            extrude_and_map(0.2) 
                                offset(delta = -wall_thickness - print_tolerance - lid_lip_depth) profile_2d();
                    }
                    
                    // Inner rim chamfer (prevents unsupported ceilings)
                    hull() {
                        translate([-0.1, 0, 0])
                            extrude_and_map(0.2) 
                                offset(delta = -wall_thickness - print_tolerance - lid_lip_wall - 0.8) profile_2d();
                        translate([lid_lip_depth + 0.2, 0, 0]) 
                            extrude_and_map(0.2) 
                                offset(delta = -wall_thickness - print_tolerance - lid_lip_wall - 0.8 - lid_lip_depth) profile_2d();
                    }
                    
                    // Rear clearance pocket for retention hooks
                    translate([-0.5, case_depth - 30, -1]) 
                        cube([lid_lip_depth + 2, 40, case_height + 2]);
                    
                    // Lower clearance pocket for front M3 screw block
                    translate([-0.5, -5, -5]) 
                        cube([lid_lip_depth + 2, 35, 35]);
                }
            }
            
            // Port cutouts configured on left door panel
            apply_configured_ports(target_is_lid = true);
            
            // Debossed text labels
            apply_configured_labels(target_is_lid = true);

            // Perforated ventilation grid
            intersection() {
                vent_panel("Left", case_depth, case_height);
                translate([-20, 0, 0]) 
                    extrude_and_map(case_width + 40) 
                        offset(delta = -margin_diagonal) profile_2d();
            }
            
            // Countersunk front screw hole
            screw_hole_lid();
        }
        
        // 3. Rear L-Hook Tabs: completely recessed inside the chassis cavity
        for (z_pos = [case_height * 0.25, case_height * 0.75]) {
            translate([
                wall_thickness, 
                case_depth - wall_thickness - hook_reach, 
                z_pos
            ]) {
                // 1. Longitudinal shank extending toward the rear (+Y)
                translate([hook_t / 2, hook_reach / 2, 0])
                    cube([hook_t, hook_reach, hook_w], center = true);

                // 2. L-latch hook tab turning inward toward the chassis core (+X)
                translate([hook_t + hook_reach / 4, hook_reach - hook_t / 2, 0])
                    cube([hook_reach / 2, hook_t, hook_w], center = true);
            }
        }
        
        // Internal hardware brackets routed to lid
        apply_configured_brackets(target_is_lid = true);
    }
}


// ==============================================================================
// VENTILATION & CUTTING TOOLS
// ==============================================================================
module vent_panel(panel, p_w, p_h) {
    v_type = (panel == "Rear")  ? vent_type_rear :
             (panel == "Top")   ? vent_type_top :
             (panel == "Right") ? vent_type_right :
             (panel == "Left")  ? vent_type_left : "none";

    m_bot = (panel == "Top") ? margin_top : margin_bottom;
    w = p_w - margin_left - margin_right;
    h = p_h - m_bot - margin_top;

    if (v_type != "none" && w > 0 && h > 0) {
        place_port(panel, 50, (m_bot + h/2) / p_h * 100) {
            if (v_type == "hex") {
                tool_hex_grid(w, h, hole_d = vent_size, spacing = vent_spacing);
            } else if (v_type == "slots") {
                tool_slot_vents(w, h, count = max(1, round(h / (vent_size + vent_spacing))), slot_w = vent_size);
            } else if (v_type == "round") {
                tool_round_grid(w, h, hole_d = vent_size, spacing = vent_spacing);
            } else if (v_type == "diag_slots") {
                tool_diag_slots(w, h, slot_w = vent_size, spacing = vent_spacing);
            }
        }
    }
}

module tool_hex_grid(w, h, hole_d = 6, spacing = 2) {
    step_x = hole_d + spacing; 
    step_y = (hole_d + spacing) * sqrt(3)/2;
    cols = max(0, floor(w / step_x)); 
    rows = max(0, floor(h / step_y));
    half_r = floor(rows / 2);
    half_c = floor(cols / 2);

    for(r = [-half_r : 1 : half_r]) {
        offset_x = (abs(r) % 2 != 0) ? step_x/2 : 0;
        for(c = [-half_c : 1 : half_c]) {
            if (abs(c*step_x + offset_x) <= w/2 - hole_d/2 && abs(r*step_y) <= h/2 - hole_d/2) {
                translate([c*step_x + offset_x, r*step_y, 0]) 
                    cylinder(h = 35, d = hole_d, $fn = 6, center = true);
            }
        }
    }
}

module tool_slot_vents(w, d, count = 8, slot_w = 4) {
    safe_count = max(1, count);
    step = d / safe_count;
    span = max(0, w/2 - slot_w/2);
    for(i = [0 : 1 : safe_count - 1]) {
        translate([0, -d/2 + i*step + step/2, 0])
            hull() {
                translate([-span, 0, 0]) cylinder(h = 35, d = slot_w, center = true);
                translate([ span, 0, 0]) cylinder(h = 35, d = slot_w, center = true);
            }
    }
}

module tool_round_grid(w, h, hole_d = 4, spacing = 2.5) {
    step_x = hole_d + spacing;
    step_y = (hole_d + spacing) * sqrt(3)/2;
    cols = max(0, floor(w / step_x));
    rows = max(0, floor(h / step_y));
    half_r = floor(rows / 2);
    half_c = floor(cols / 2);

    for(r = [-half_r : 1 : half_r]) {
        offset_x = (abs(r) % 2 != 0) ? step_x/2 : 0;
        for(c = [-half_c : 1 : half_c]) {
            if (abs(c*step_x + offset_x) <= w/2 - hole_d/2 && abs(r*step_y) <= h/2 - hole_d/2) {
                translate([c*step_x + offset_x, r*step_y, 0]) 
                    cylinder(h = 35, d = hole_d, $fn = 30, center = true);
            }
        }
    }
}

module tool_diag_slots(w, h, slot_w = 4, spacing = 4) {
    pitch = slot_w + spacing;
    diag_span = w + h;
    count = round(diag_span / pitch);
    half_count = max(0, floor(count / 2));
    
    intersection() {
        cube([w, h, 35], center = true);
        rotate([0, 0, 45]) {
            if (half_count >= 0) {
                for (i = [-half_count : 1 : half_count]) {
                    translate([i * pitch, 0, 0]) 
                        cube([slot_w, diag_span * 1.5, 40], center = true);
                }
            }
        }
    }
}

module rounded_rect_2d(w, h, r) { 
    safe_r = min(r, max(0.05, min(w, h)/2 - 0.05));
    offset(r = safe_r) square([max(0.1, w - 2*safe_r), max(0.1, h - 2*safe_r)], center = true); 
}

module front_module_2d() {
    union() {
        if (cutout_shape == "rounded") 
            rounded_rect_2d(module_body_w, module_body_h, module_corner_rad);
        else 
            square([module_body_w, module_body_h], center = true);
        
        if (enable_side_tabs) 
            square([module_tab_w, module_tab_h], center = true);
    }
}

module front_module_cutout() {
    linear_extrude(height = 35, center = true) front_module_2d();
    if (enable_module_flush) {
        translate([0, 0, -module_recess_depth])
            linear_extrude(height = 12) rounded_rect_2d(module_rim_w, module_rim_h, module_rim_rad);
    }
}

module engrave_text(txt) {
    translate([0, 0, -label_depth + 0.01])
        linear_extrude(height = label_depth)
        text(txt, size = label_size, halign = "center", valign = "center", font = "Arial:style=Bold");
}

module tool_through(w, h, r = 0) {
    if (r > 0) { 
        linear_extrude(height = 35, center = true) rounded_rect_2d(w, h, r); 
    } else { 
        cube([w, h, 35], center = true); 
    }
}

module cutout_kcd1()         { cube([sw_w, sw_h, 45], center = true); }
module cutout_dc_jack()      { cylinder(h = 35, d = jack_d, center = true); }
module cutout_kf2edg()       { tool_through(kf2edg_w, kf2edg_h); }

module cutout_xt60() {
    tool_through(xt60_w, xt60_h);
    translate([-xt60_pitch/2, 0, 0]) cylinder(h = 35, d = 3.2, center = true);
    translate([ xt60_pitch/2, 0, 0]) cylinder(h = 35, d = 3.2, center = true);
}

module cutout_xt30() {
    tool_through(xt30_w, xt30_h, r = 1.5);
    translate([-xt30_pitch/2, 0, 0]) cylinder(h = 35, d = 2.8, center = true);
    translate([ xt30_pitch/2, 0, 0]) cylinder(h = 35, d = 2.8, center = true);
}

module cutout_banana() {
    translate([-banan_pitch/2, 0, 0]) cylinder(h = 35, d = banan_d, center = true);
    translate([ banan_pitch/2, 0, 0]) cylinder(h = 35, d = banan_d, center = true);
}

module cutout_usbc() {
    hull() {
        translate([(usb_w-usb_h)/2, 0, 0]) cylinder(h = 35, d = usb_h, center = true);
        translate([-(usb_w-usb_h)/2, 0, 0]) cylinder(h = 35, d = usb_h, center = true);
    }
}

module cutout_gx(type = "GX12") {
    d_hole = (type == "GX16") ? gx16_d : gx12_d;
    cylinder(h = 35, d = d_hole + print_tolerance, center = true);
}

module cutout_powerpole() {
    cube([pp_w + print_tolerance, pp_h + print_tolerance, 35], center = true);
}

module cutout_round_switch() {
    cylinder(h = 35, d = round_sw_d + print_tolerance, center = true);
}

module render_port_cutout(type) {
    if      (type == "front_module") front_module_cutout();
    else if (type == "banana")       cutout_banana();
    else if (type == "xt60")         cutout_xt60();
    else if (type == "dc_jack")      cutout_dc_jack();
    else if (type == "kf2edg")       cutout_kf2edg();
    else if (type == "usbc")         cutout_usbc();
    else if (type == "switch")       cutout_kcd1();
    else if (type == "xt30")         cutout_xt30();
    else if (type == "gx")           cutout_gx(gx_type);
    else if (type == "pp")           cutout_powerpole();
    else if (type == "round_sw")     cutout_round_switch();
}


// ==============================================================================
// INTERNAL HARDWARE ANCHORS
// ==============================================================================
module ziptie_bridge(x, y, rot = 0) {
    translate([x, y, wall_thickness])
    rotate([0, 0, rot]) {
        difference() {
            translate([0, 0, 2.5]) cube([8.0, 10.0, 5.0], center = true);
            translate([0, 0, 2.1]) cube([10.0, 4.5, 2.2], center = true);
        }
    }
}

module screw_tab_base() {
    translate([wall_thickness, 15, 15]) { 
        difference() {
            translate([0, -12, -12]) cube([8, 17, 17]);
            translate([-1, 0, 0]) rotate([0, 90, 0]) cylinder(h = 15, d = 4.0);
        }
    }
}

module screw_hole_lid() {
    translate([0, 15, 15]) {
        rotate([0, 90, 0]) {
            cylinder(h = wall_thickness * 4, d = 3.4, center = true);
            translate([0, 0, -wall_thickness/2]) cylinder(h = 2.0, d1 = 6.8, d2 = 3.4, center = false);
            translate([0, 0, -wall_thickness]) cylinder(h = wall_thickness/2 + 0.05, d = 6.8, center = false);
        }
    }
}

module mount_standoffs(startX, startY, pitchX, pitchY) {
    for(dx = [0, pitchX]) {
        for(dy = [0, pitchY]) {
            translate([startX + dx, startY + dy, wall_thickness])
            difference() {
                cylinder(h = 5, d = 6, center = false); 
                translate([0, 0, 1.5]) cylinder(h = 4, d = 4, center = false);
            }
        }
    }
}
