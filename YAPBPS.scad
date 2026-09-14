// ==============================================================================
// YAPBPS Yet Another Parametric Bench Power Supply
// ==============================================================================
// Fully parametric OpenSCAD chassis for custom DC-DC bench power supply builds.
// Configured with native OpenSCAD Customizer annotations, inline descriptions,
// UI widget constraints, categorized parameter blocks, and complete inline comments.
//
// ==============================================================================
// TUTORIAL: HOW TO ADD A NEW CUSTOM PORT / HARDWARE OBJECT
// ==============================================================================
// To add a new connector (e.g., "USB_A"), follow these 5 simple steps:
//
// 1. ADD CUSTOMIZER PARAMETERS:
//    In the parameter section below, declare:
//    - enable_usba = true;
//    - usba_panel  = "Rear"; // [Rear, Right, Left, Top, Front_Lip, Front_Slope, None]
//    - usba_u      = 50.0;   // [0.0:1.0:100.0]
//    - usba_v      = 25.0;   // [0.0:1.0:100.0]
//    - label_usba  = "USB 5V";
//
// 2. DEFINE PHYSICAL DIMENSIONS:
//    In the /* [Hidden] */ section, declare the nominal sizes + print_tolerance:
//    - usba_w = 14.5 + print_tolerance;
//    - usba_h = 7.0 + print_tolerance;
//
// 3. CREATE THE CUTOUT TOOL MODULE:
//    In the "PANEL CUTTING TOOLS" section, create:
//    module cutout_usba() {
//        // Center on [0,0,0], extrude along Z by at least 25mm to clear wall
//        tool_through(usba_w, usba_h);
//    }
//
// 4. REGISTER IN UNIFIED DISPATCHERS:
//    - In `render_port_cutout(port_type)`:
//      else if (port_type == "usba") cutout_usba();
//    - In `render_port_label(port_type)`:
//      else if (port_type == "usba") translate([0, label_offset_y, 0]) engrave_text(label_usba);
//
// 5. ATTACH TO PORT LOOPS:
//    Inside `apply_configured_ports()`:
//      if (enable_usba && on_target(usba_panel))
//          place_port(usba_panel, usba_u, usba_v) render_port_cutout("usba");
//    Inside `apply_configured_labels()`:
//      if (enable_usba && on_target(usba_panel))
//          place_port(usba_panel, usba_u, usba_v) render_port_label("usba");
// ==============================================================================

/* [Render & Tolerances] */

// Clearance offset applied to all slots and snap fits for FDM printer tolerances (mm)
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
rear_port_spacing = 10.0; // [5.0:1.0:30.0]

// Vertical elevation percentage from base for auto-arranged rear ports (%)
rear_port_v_pct = 25.0; // [10.0:1.0:90.0]


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
// Non-exposed internal dimensions, kinematics, and derived parameters

snap_fit_thick = 1.6;

// Front module dimensions
module_body_w       = 64.0 + print_tolerance;
module_body_h       = 45.0 + print_tolerance;
module_corner_rad   = 8.0;
module_tab_w        = 81.0 + print_tolerance;
module_tab_h        = 12.0 + print_tolerance;
module_rim_w        = 68.0 + (print_tolerance + 0.2);
module_rim_h        = 48.0 + (print_tolerance + 0.2);
module_rim_rad      = 9.5;
module_recess_depth = 1.5;

// XT60 connector dimensions
xt60_w     = 19.0;
xt60_h     = 12.0;
xt60_pitch = 25.0;

// XT30 connector dimensions
xt30_w     = 15.0;
xt30_h     = 10.5;
xt30_pitch = 20.0;

// Rocker switch
sw_w = 13.4;
sw_h = 19.4;

// DC barrel jack
jack_d = 8.5;

// KF2EDG screw terminal
kf2edg_w = 18.5;
kf2edg_h = 15.5;

// USB-C plug slot & PCB cradle
usb_w         = 9.5;
usb_h         = 3.5;
usbc_pcb_w    = 15.0;
usbc_pcb_l    = 10.0;
usbc_pcb_t    = 1.6;
usbc_offset_y = -1.6;

// Banana posts
banan_d     = 8.2;
banan_pitch = 19.05;

// Aviation connectors
gx12_d = 12.0;
gx16_d = 16.0;

// Anderson Powerpole
pp_w = 16.0;
pp_h = 8.0;

// Round switch
round_sw_d = 16.0;

// Kinematics calculations: calculates triangle dimensions for the console slope
dy = case_depth - top_flat_depth;
dz = case_height - front_lip_height;
slope_angle  = atan2(dz, dy);          // Slope angle relative to horizontal plane
slope_length = sqrt(dy*dy + dz*dz);    // Hypotenuse length of the angled face

// Auto-arrange rear port flags & widths: checks which ports are routed to "Rear"
u_rear_usbc = (enable_usbc && usbc_panel == "Rear") ? 1 : 0;
u_rear_kf   = (enable_kf2edg && kf2edg_panel == "Rear") ? 1 : 0;
u_rear_dc   = (enable_dc_jack && dc_jack_panel == "Rear") ? 1 : 0;
u_rear_xt   = (enable_xt60 && xt60_panel == "Rear") ? 1 : 0;
u_rear_xt30 = (enable_xt30 && xt30_panel == "Rear") ? 1 : 0;
u_rear_pp   = (enable_powerpole && powerpole_panel == "Rear") ? 1 : 0;

// Bounding box widths (in mm) allocated per connector for auto-spacing
w_u  = 16 * u_rear_usbc;
w_k  = 20 * u_rear_kf;
w_d  = 12 * u_rear_dc;
w_x  = 32 * u_rear_xt;
w_30 = 26 * u_rear_xt30;
w_pp = 22 * u_rear_pp;

// Sum active components and calculate available horizontal distribution
active_rear = u_rear_usbc + u_rear_kf + u_rear_dc + u_rear_xt + u_rear_xt30 + u_rear_pp;
spacing_rear_total = max(0, active_rear - 1) * rear_port_spacing;

cluster_w = w_u + w_k + w_d + w_x + w_30 + w_pp + spacing_rear_total;
start_x   = (case_width - cluster_w) / 2; // Centers the entire cluster horizontally

// Cumulative center position calculations
c_u  = start_x + w_u/2;
c_k  = start_x + (u_rear_usbc ? w_u + rear_port_spacing : 0) + w_k/2;
c_d  = start_x + (u_rear_usbc ? w_u + rear_port_spacing : 0) + (u_rear_kf ? w_k + rear_port_spacing : 0) + w_d/2;
c_x  = start_x + (u_rear_usbc ? w_u + rear_port_spacing : 0) + (u_rear_kf ? w_k + rear_port_spacing : 0) + (u_rear_dc ? w_d + rear_port_spacing : 0) + w_x/2;
c_30 = c_x + (u_rear_xt ? w_x/2 + rear_port_spacing : 0) + w_30/2;
c_pp = c_30 + (u_rear_xt30 ? w_30/2 + rear_port_spacing : 0) + w_pp/2;

// Calculated horizontal percentages (0-100% of case_width)
usbc_auto_u      = (auto_arrange_rear && usbc_panel == "Rear")      ? (c_u / case_width) * 100 : -1;
kf2edg_auto_u    = (auto_arrange_rear && kf2edg_panel == "Rear")    ? (c_k / case_width) * 100 : -1;
dc_jack_auto_u   = (auto_arrange_rear && dc_jack_panel == "Rear")   ? (c_d / case_width) * 100 : -1;
xt60_auto_u      = (auto_arrange_rear && xt60_panel == "Rear")      ? (c_x / case_width) * 100 : -1;
xt30_auto_u      = (auto_arrange_rear && xt30_panel == "Rear")      ? (c_30 / case_width) * 100 : -1;
powerpole_auto_u = (auto_arrange_rear && powerpole_panel == "Rear") ? (c_pp / case_width) * 100 : -1;

// Elevation values: overrides manual v when auto-arrange is enabled
usbc_v_final      = (auto_arrange_rear && usbc_panel == "Rear")      ? rear_port_v_pct : usbc_v;
kf2edg_v_final    = (auto_arrange_rear && kf2edg_panel == "Rear")    ? rear_port_v_pct : kf2edg_v;
dc_jack_v_final   = (auto_arrange_rear && dc_jack_panel == "Rear")   ? rear_port_v_pct : dc_jack_v;
xt60_v_final      = (auto_arrange_rear && xt60_panel == "Rear")      ? rear_port_v_pct : xt60_v;
xt30_v_final      = (auto_arrange_rear && xt30_panel == "Rear")      ? rear_port_v_pct : xt30_v;
powerpole_v_final = (auto_arrange_rear && powerpole_panel == "Rear") ? rear_port_v_pct : powerpole_v;


// ==============================================================================
// TOP-LEVEL RENDER STAGE
// ==============================================================================

// Render main shell if toggled
if (render_main_body) { 
    base_case(); 
}

// Render hinged side door if toggled (flips door 90 degrees onto print bed)
if (render_side_lid) {
    translate([-110, 0, wall_thickness]) 
        rotate([0, 90, 0]) 
        color(color_lid) lid_assembly();
}


// ==============================================================================
// TRANSFORMATION & POSITION ENGINE
// ==============================================================================
// Normalizes any panel face so that children modules only need to be built
// centered on [0,0,0] cutting along the Z axis.
module place_port(panel, u_pct, v_pct, auto_u = -1) {
    // If auto_u is supplied (>=0), use it; otherwise fallback to manual percentage
    u = (auto_u >= 0) ? auto_u : u_pct;
    
    if (panel == "Rear") {
        // Rear panel transformation matrix (facing back towards -Y)
        multmatrix([ [-1, 0, 0, case_width - (case_width * u/100)],
                     [ 0, 0, 1, case_depth],
                     [ 0, 1, 0, case_height * v_pct/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Right") {
        // Right outer side panel transformation matrix
        multmatrix([ [ 0, 0, 1, case_width],
                     [ 1, 0, 0, case_depth * u/100],
                     [ 0, 1, 0, case_height * v_pct/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Left") {
        // Left door panel transformation matrix
        multmatrix([ [ 0, 0,-1, 0],
                     [-1, 0, 0, case_depth - (case_depth * u/100)],
                     [ 0, 1, 0, case_height * v_pct/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Front_Lip") {
        // Lower vertical front wall transformation matrix
        multmatrix([ [ 1, 0, 0, case_width * u/100],
                     [ 0, 0,-1, 0],
                     [ 0, 1, 0, front_lip_height * v_pct/100],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Top") {
        // Top flat horizontal panel transformation matrix
        multmatrix([ [ 1, 0, 0, case_width * u/100],
                     [ 0, 1, 0, case_depth - top_flat_depth + (top_flat_depth * (100 - v_pct)/100)],
                     [ 0, 0, 1, case_height],
                     [ 0, 0, 0, 1] ]) children();
    } else if (panel == "Front_Slope") {
        // Angled console front panel: rotates coordinate space by slope_angle
        c_a = cos(slope_angle); 
        s_a = sin(slope_angle);
        multmatrix([ [ 1,   0,    0, case_width * u/100],
                     [ 0, c_a, -s_a, 0],
                     [ 0, s_a,  c_a, front_lip_height],
                     [ 0,   0,    0, 1] ]) 
            translate([0, slope_length * v_pct/100, 0]) children();
    }
}


// ==============================================================================
// 3D SHELL GEOMETRY ENGINE
// ==============================================================================

// Helper that maps 2D profile extrusion across the enclosure width (X-axis)
module extrude_and_map(w) {
    multmatrix(m = [[0,0,1,0], [1,0,0,0], [0,1,0,0], [0,0,0,1]])
        linear_extrude(height=w) children();
}

// 2D profile defining the console side silhouette
module base_polygon() {
    polygon([
        [0, 0],                                         // Bottom front origin
        [case_depth, 0],                                // Bottom rear corner
        [case_depth, case_height],                      // Top rear corner
        [case_depth - top_flat_depth, case_height],     // Top flat corner
        [0, front_lip_height]                           // Front lip transition
    ]);
}

// Applies outer rounded corner fillets to the silhouette profile
module profile_2d() {
    offset(r=corner_rad, $fn=30) offset(delta=-corner_rad) base_polygon();
}

// Creates the hollow continuous chassis enclosure wall
module hollow_shell() {
    difference() {
        extrude_and_map(case_width) profile_2d(); // Outer solid body
        // Subtract internal volume offset by wall_thickness
        translate([wall_thickness, 0, 0])
            extrude_and_map(case_width - 2*wall_thickness)
                offset(delta=-wall_thickness) profile_2d();
    }
}


// ==============================================================================
// UNIFIED PORT DISPATCHERS
// ==============================================================================
// Routes a generic port name string to its specific CAD geometry module

module render_port_cutout(port_type) {
    if (port_type == "front_module") front_module_cutout();
    else if (port_type == "banana")   cutout_banana();
    else if (port_type == "xt60")     cutout_xt60();
    else if (port_type == "dc_jack")  cutout_dc_jack();
    else if (port_type == "kf2edg")   cutout_kf2edg();
    else if (port_type == "usbc")     cutout_usbc();
    else if (port_type == "switch")   cutout_kcd1();
    else if (port_type == "xt30")     cutout_xt30();
    else if (port_type == "gx")       cutout_gx(gx_type);
    else if (port_type == "pp")       cutout_powerpole();
    else if (port_type == "round_sw") cutout_round_switch();
}

// Routes a generic port name string to its engraved text label
module render_port_label(port_type) {
    if (port_type == "front_module") translate([0, label_offset_sk200, 0]) engrave_text(label_sk200);
    else if (port_type == "banana")   translate([0, label_offset_y, 0]) engrave_text(label_front);
    else if (port_type == "xt60")     translate([0, label_offset_y, 0]) engrave_text(label_xt60);
    else if (port_type == "dc_jack")  translate([0, label_offset_y, 0]) engrave_text(label_dc_jack);
    else if (port_type == "kf2edg")   translate([0, label_offset_y, 0]) engrave_text(label_kf2edg);
    else if (port_type == "usbc")     translate([0, label_offset_y, 0]) engrave_text(label_usbc);
    else if (port_type == "switch")   translate([0, label_offset_y, 0]) engrave_text(label_switch);
    else if (port_type == "xt30")     translate([0, label_offset_y, 0]) engrave_text(label_xt30);
    else if (port_type == "gx")       translate([0, label_offset_y, 0]) engrave_text(label_gx);
    else if (port_type == "pp")       translate([0, label_offset_y, 0]) engrave_text(label_powerpole);
    else if (port_type == "round_sw") translate([0, label_offset_y, 0]) engrave_text(label_round_sw);
}


// ==============================================================================
// MAIN ASSEMBLIES
// ==============================================================================

// Central iterator for all active cutouts, separating lid cutouts from chassis cutouts
module apply_configured_ports(target_is_lid = false) {
    // Filter condition: True if port belongs to the current part being rendered
    function on_target(panel) = target_is_lid ? (panel == "Left") : (panel != "Left" && panel != "None");

    if (enable_front_module && on_target(front_mod_panel))
        place_port(front_mod_panel, front_mod_u, front_mod_v) render_port_cutout("front_module");

    if (enable_banana && on_target(banana_panel))
        place_port(banana_panel, banana_u, banana_v) render_port_cutout("banana");

    if (enable_xt60 && on_target(xt60_panel))
        place_port(xt60_panel, xt60_u, xt60_v_final, target_is_lid ? -1 : xt60_auto_u) render_port_cutout("xt60");

    if (enable_dc_jack && on_target(dc_jack_panel))
        place_port(dc_jack_panel, dc_jack_u, dc_jack_v_final, target_is_lid ? -1 : dc_jack_auto_u) render_port_cutout("dc_jack");

    if (enable_kf2edg && on_target(kf2edg_panel))
        place_port(kf2edg_panel, kf2edg_u, kf2edg_v_final, target_is_lid ? -1 : kf2edg_auto_u) render_port_cutout("kf2edg");

    if (enable_usbc && on_target(usbc_panel))
        place_port(usbc_panel, usbc_u, usbc_v_final, target_is_lid ? -1 : usbc_auto_u) render_port_cutout("usbc");

    if (enable_switch && on_target(switch_panel))
        place_port(switch_panel, switch_u, switch_v) render_port_cutout("switch");

    if (enable_xt30 && on_target(xt30_panel))
        place_port(xt30_panel, xt30_u, xt30_v_final, target_is_lid ? -1 : xt30_auto_u) render_port_cutout("xt30");

    if (enable_gx && on_target(gx_panel))
        place_port(gx_panel, gx_u, gx_v) render_port_cutout("gx");

    if (enable_powerpole && on_target(powerpole_panel))
        place_port(powerpole_panel, powerpole_u, powerpole_v_final, target_is_lid ? -1 : powerpole_auto_u) render_port_cutout("pp");

    if (enable_round_switch && on_target(round_sw_panel))
        place_port(round_sw_panel, round_sw_u, round_sw_v) render_port_cutout("round_sw");
}

// Central iterator for all engraved port labels
module apply_configured_labels(target_is_lid = false) {
    function on_target(panel) = target_is_lid ? (panel == "Left") : (panel != "Left" && panel != "None");

    if (enable_labels) {
        if (enable_front_module && on_target(front_mod_panel))
            place_port(front_mod_panel, front_mod_u, front_mod_v) render_port_label("front_module");
        if (enable_banana && on_target(banana_panel))
            place_port(banana_panel, banana_u, banana_v) render_port_label("banana");
        if (enable_xt60 && on_target(xt60_panel))
            place_port(xt60_panel, xt60_u, xt60_v_final, target_is_lid ? -1 : xt60_auto_u) render_port_label("xt60");
        if (enable_dc_jack && on_target(dc_jack_panel))
            place_port(dc_jack_panel, dc_jack_u, dc_jack_v_final, target_is_lid ? -1 : dc_jack_auto_u) render_port_label("dc_jack");
        if (enable_kf2edg && on_target(kf2edg_panel))
            place_port(kf2edg_panel, kf2edg_u, kf2edg_v_final, target_is_lid ? -1 : kf2edg_auto_u) render_port_label("kf2edg");
        if (enable_usbc && on_target(usbc_panel))
            place_port(usbc_panel, usbc_u, usbc_v_final, target_is_lid ? -1 : usbc_auto_u) render_port_label("usbc");
        if (enable_switch && on_target(switch_panel))
            place_port(switch_panel, switch_u, switch_v) render_port_label("switch");
        if (enable_xt30 && on_target(xt30_panel))
            place_port(xt30_panel, xt30_u, xt30_v_final, target_is_lid ? -1 : xt30_auto_u) render_port_label("xt30");
        if (enable_gx && on_target(gx_panel))
            place_port(gx_panel, gx_u, gx_v) render_port_label("gx");
        if (enable_powerpole && on_target(powerpole_panel))
            place_port(powerpole_panel, powerpole_u, powerpole_v_final, target_is_lid ? -1 : powerpole_auto_u) render_port_label("pp");
        if (enable_round_switch && on_target(round_sw_panel))
            place_port(round_sw_panel, round_sw_u, round_sw_v) render_port_label("round_sw");
    }
}

// Master module for the main structural enclosure chassis
module base_case() {
    union() {
        color(color_case) {
            difference() {
                // Step 1: Create main body shell and open the left wall for the door
                difference() {
                    hollow_shell();
                    translate([-1, -1, -1]) 
                        cube([wall_thickness + 1, case_depth + 2, case_height + 2]);
                }
                
                // Step 2: Carve all hardware ports routed to main shell
                apply_configured_ports(target_is_lid = false);

                // Step 3: Deboss engraved label text
                apply_configured_labels(target_is_lid = false);

                // Step 4: Perforate panels with ventilation patterns
                vent_panel("Rear", case_width, case_height);
                vent_panel("Top", case_width, top_flat_depth);

                // Side vents clipped by offset profile to avoid piercing the front slope
                intersection() {
                    vent_panel("Right", case_depth, case_height);
                    translate([-20, 0, 0]) 
                        extrude_and_map(case_width + 40) 
                        offset(delta=-margin_diagonal) profile_2d();
                }
            }

            // Step 5: Chassis hinge knuckles (lower and upper)
            hinge_base(case_height * 0.25);
            hinge_base(case_height * 0.75);
        }
        
        // Step 6: Internal mounting hardware & accessories
        color(color_mnt) screw_tab_base(); // Front retention screw anchor

        // Auxiliary PCB standoffs
        if (enable_diode_mnt) 
            color(color_mnt) mount_standoffs(20, 20, 41.0, 24.0);

        // Floor-mounted cable tie loops
        if (enable_zipties) {
            color(color_mnt) {
                ziptie_bridge(case_width * 0.50, case_depth - 25, rot=0);
                ziptie_bridge(case_width - 16, case_depth * 0.45, rot=90);
                ziptie_bridge(case_width * 0.50, 18, rot=0);
            }
        }

        // Structural support pillar underneath the USB-C PCB holder
        if (enable_usbc && usbc_panel != "Left" && usbc_panel != "None") {
            z_h = (usbc_panel == "Rear")      ? (case_height * usbc_v_final / 100) :
                  (usbc_panel == "Right")     ? (case_height * usbc_v / 100) :
                  (usbc_panel == "Front_Lip") ? (front_lip_height * usbc_v / 100) : 0;

            place_port(usbc_panel, usbc_u, usbc_v_final, usbc_auto_u) 
                color(color_mnt) usbc_holder(z_h); 
        }
    }
}

// Master module for the removable side service door
module lid_assembly() {
    union() {
        difference() {
            // Door outer skin + interlocking inner lip
            union() {
                // Outer wall matching the chassis contour
                intersection() {
                    hollow_shell();
                    translate([-1, -1, -1]) cube([wall_thickness + 1, case_depth + 2, case_height + 2]);
                }
                
                // Stepped interlocking perimeter flange
                translate([wall_thickness, 0, 0])
                difference() {
                    extrude_and_map(lid_lip_depth) 
                        offset(delta = -wall_thickness - print_tolerance) 
                        profile_2d();
                    
                    // Hollow out center of interlocking flange
                    translate([-0.1, 0, 0])
                    extrude_and_map(lid_lip_depth + 0.2) 
                        offset(delta = -wall_thickness - print_tolerance - lid_lip_wall) 
                        profile_2d();
                    
                    // Relief cut: hinge rotation clearance
                    translate([-1, case_depth - 15, -1])
                        cube([lid_lip_depth + 2, 20, case_height + 2]);
                    
                    // Relief cut: front fastening screw tab clearance
                    translate([-1, 0, 0])
                        cube([lid_lip_depth + 2, 28, 28]);
                }
            }
            
            // Cutouts and debossed labels routed to the Left door panel
            apply_configured_ports(target_is_lid = true);
            apply_configured_labels(target_is_lid = true);

            // Door ventilation grid
            intersection() {
                vent_panel("Left", case_depth, case_height);
                translate([-20, 0, 0]) 
                    extrude_and_map(case_width + 40) 
                    offset(delta=-margin_diagonal) profile_2d();
            }
            
            // Countersunk retention screw hole
            screw_hole_lid();
        }
        
        // Door-side hinge pivot brackets
        hinge_lid(case_height * 0.25);
        hinge_lid(case_height * 0.75);
        
        // Internal USB-C holder if assigned to the door
        if (enable_usbc && usbc_panel == "Left") 
            place_port("Left", usbc_u, usbc_v) color(color_mnt) usbc_holder(case_height * usbc_v / 100); 
    }
}


// ==============================================================================
// VENTILATION GENERATORS
// ==============================================================================

// Calculates active vent area and delegates to specific pattern modules
module vent_panel(panel, p_w, p_h) {
    // Select pattern type according to target panel
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
                tool_hex_grid(w, h, hole_d=vent_size, spacing=vent_spacing);
            } else if (v_type == "slots") {
                tool_slot_vents(w, h, count=max(1, round(h / (vent_size + vent_spacing))), slot_w=vent_size);
            } else if (v_type == "round") {
                tool_round_grid(w, h, hole_d=vent_size, spacing=vent_spacing);
            } else if (v_type == "diag_slots") {
                tool_diag_slots(w, h, slot_w=vent_size, spacing=vent_spacing);
            }
        }
    }
}

// Hexagonal honeycomb vent mesh
module tool_hex_grid(w, h, hole_d=6, spacing=2) {
    step_x = hole_d + spacing; 
    step_y = (hole_d + spacing) * sqrt(3)/2; // Triangular grid vertical pitch
    cols = round(w / step_x); 
    rows = round(h / step_y);
    for(r = [-rows/2 : rows/2]) {
        // Offset alternating rows by half pitch for honeycomb nesting
        offset_x = (r % 2 != 0) ? step_x/2 : 0;
        for(c = [-cols/2 : cols/2]) {
            if (abs(c*step_x + offset_x) <= w/2 - hole_d/2 && abs(r*step_y) <= h/2 - hole_d/2) {
                translate([c*step_x + offset_x, r*step_y, 0]) 
                    cylinder(h=20, d=hole_d, $fn=6, center=true);
            }
        }
    }
}

// Horizontal ventilation slots with rounded ends
module tool_slot_vents(w, d, count=8, slot_w=4) {
    step = d / count;
    for(i=[0 : count-1]) {
        translate([0, -d/2 + i*step + step/2, 0])
            hull() {
                translate([-w/2 + slot_w, 0, 0]) cylinder(h=20, d=slot_w, center=true);
                translate([ w/2 - slot_w, 0, 0]) cylinder(h=20, d=slot_w, center=true);
            }
    }
}

// Perforated circular hole grid
module tool_round_grid(w, h, hole_d=4, spacing=2.5) {
    step_x = hole_d + spacing;
    step_y = (hole_d + spacing) * sqrt(3)/2;
    cols = round(w / step_x);
    rows = round(h / step_y);
    for(r = [-rows/2 : rows/2]) {
        offset_x = (r % 2 != 0) ? step_x/2 : 0;
        for(c = [-cols/2 : cols/2]) {
            if (abs(c*step_x + offset_x) <= w/2 - hole_d/2 && abs(r*step_y) <= h/2 - hole_d/2) {
                translate([c*step_x + offset_x, r*step_y, 0]) 
                    cylinder(h=20, d=hole_d, $fn=30, center=true);
            }
        }
    }
}

// 45-degree diagonal ventilation louvers/slots
module tool_diag_slots(w, h, slot_w=4, spacing=4) {
    pitch = slot_w + spacing;
    diag_span = w + h;
    count = round(diag_span / pitch);
    
    intersection() {
        cube([w, h, 30], center=true); // Bounds slots to panel dimensions
        rotate([0, 0, 45]) {
            for (i = [-count/2 : count/2]) {
                translate([i * pitch, 0, 0])
                    cube([slot_w, diag_span * 1.5, 35], center=true);
            }
        }
    }
}


// ==============================================================================
// PANEL CUTTING TOOLS
// ==============================================================================

// 2D rounded rectangle primitive
module rounded_rect_2d(w, h, r) { 
    offset(r=r) square([max(0.1, w - 2*r), max(0.1, h - 2*r)], center=true); 
}

// Composite 2D cutout for the main front digital meter
module front_module_2d() {
    union() {
        if (cutout_shape == "rounded") rounded_rect_2d(module_body_w, module_body_h, module_corner_rad);
        else square([module_body_w, module_body_h], center=true);
        if (enable_side_tabs) square([module_tab_w, module_tab_h], center=true); // Side tab pockets
    }
}

// 3D extrusion of front display cutout + flush bezel rebate pocket
module front_module_cutout() {
    linear_extrude(height=30, center=true) front_module_2d();
    if (enable_module_flush) {
        // Counterbore recess for bezel flush mounting
        translate([0, 0, -module_recess_depth])
            linear_extrude(height=10) rounded_rect_2d(module_rim_w, module_rim_h, module_rim_rad);
    }
}

// Text engraving tool that cuts text into wall surface
module engrave_text(txt) {
    translate([0, 0, -label_depth + 0.01])
        linear_extrude(height=label_depth)
        text(txt, size=label_size, halign="center", valign="center", font="Arial:style=Bold");
}

// Generic 3D rectangular cutting volume
module tool_through(w, h, r=0) {
    if (r > 0) { linear_extrude(height=30, center=true) rounded_rect_2d(w, h, r); } 
    else { cube([w, h, 30], center=true); }
}

// KCD1 Rocker switch cutout
module cutout_kcd1() {
    cube([sw_w, sw_h, 40], center=true);
}

// DC Barrel socket round hole
module cutout_dc_jack() { 
    cylinder(h=25, d=jack_d, center=true); 
}

// KF2EDG terminal block rectangular hole
module cutout_kf2edg() { 
    tool_through(kf2edg_w, kf2edg_h); 
}

// XT60E-M connector cutout with flanking M3 mounting screw holes
module cutout_xt60() {
    tool_through(xt60_w, xt60_h);
    translate([-xt60_pitch/2, 0, 0]) cylinder(h=25, d=3.2, center=true);
    translate([ xt60_pitch/2, 0, 0]) cylinder(h=25, d=3.2, center=true);
}

// XT30E-M connector cutout with flanking M2.5 mounting screw holes
module cutout_xt30() {
    tool_through(xt30_w, xt30_h, r=1.5);
    translate([-xt30_pitch/2, 0, 0]) cylinder(h=25, d=2.8, center=true);
    translate([ xt30_pitch/2, 0, 0]) cylinder(h=25, d=2.8, center=true);
}

// Dual 4mm banana post boreholes
module cutout_banana() {
    translate([-banan_pitch/2, 0, 0]) cylinder(h=25, d=banan_d, center=true);
    translate([ banan_pitch/2, 0, 0]) cylinder(h=25, d=banan_d, center=true);
}

// USB Type-C elongated slot
module cutout_usbc() {
    hull() {
        translate([(usb_w-usb_h)/2, 0, 0]) cylinder(h=25, d=usb_h, center=true);
        translate([-(usb_w-usb_h)/2, 0, 0]) cylinder(h=25, d=usb_h, center=true);
    }
}

// Aviation circular hole
module cutout_gx(type="GX12") {
    d_hole = (type == "GX16") ? gx16_d : gx12_d;
    cylinder(h=25, d=d_hole + print_tolerance, center=true);
}

// Paired Anderson Powerpole rectangular cutout
module cutout_powerpole() {
    cube([pp_w + print_tolerance, pp_h + print_tolerance, 25], center=true);
}

// Circular push button mounting hole
module cutout_round_switch() {
    cylinder(h=25, d=round_sw_d + print_tolerance, center=true);
}


// ==============================================================================
// INTERNAL HARDWARE SUPPORTS & FASTENERS
// ==============================================================================

// Internal retention cradle for USB-C trigger board
module usbc_holder(port_z = 0) {
    holder_w = usbc_pcb_w + 6; 
    holder_h = usbc_pcb_t + 8;
    
    // U-channel bracket holding the PCB firmly behind the front slot
    translate([0, usbc_offset_y, -wall_thickness - usbc_pcb_l/2])
    difference() {
        cube([holder_w, holder_h, usbc_pcb_l], center=true);
        cube([usbc_pcb_w, usbc_pcb_t + 0.2, usbc_pcb_l + 2], center=true); // Slide channel
        translate([0, 5, 0]) cube([usbc_pcb_w - 4, 10, usbc_pcb_l + 2], center=true); // Top wire access
    }
    
    // Vertical anti-sag support pillar connecting cradle to enclosure floor
    if (port_z > wall_thickness) {
        bottom_of_holder_local_y = usbc_offset_y - holder_h/2;
        pillar_h = port_z + bottom_of_holder_local_y - wall_thickness;
        
        if (pillar_h > 0) {
            pillar_cy = bottom_of_holder_local_y - pillar_h/2;
            translate([0, pillar_cy, -wall_thickness - usbc_pcb_l/2])
                cube([holder_w, pillar_h, usbc_pcb_l], center=true);
        }
    }
}

// Floor-mounted cable tie anchor
module ziptie_bridge(x, y, rot=0) {
    translate([x, y, wall_thickness])
    rotate([0, 0, rot]) {
        difference() {
            translate([0, 0, 2.5])
                cube([8.0, 10.0, 5.0], center=true);
            
            // Internal loop channel for standard zip ties (4.5mm x 2.2mm)
            translate([0, 0, 2.2/2 + 1.0])
                cube([10.0, 4.5, 2.2], center=true);
        }
    }
}

// Fixed hinge knuckle anchored to chassis body
module hinge_base(z_pos) {
    translate([wall_thickness, case_depth - corner_rad/2, z_pos]) {
        difference() {
            union() {
                translate([-4, 0, -7.5]) cylinder(h=4.8, d=8, center=true);
                translate([-4, 0,  2.5]) cylinder(h=4.8, d=8, center=true);
                translate([3, -1.5, -7.5]) cube([8, 3, 4.8], center=true);
                translate([3, -1.5,  2.5]) cube([8, 3, 4.8], center=true);
            }
            // 2.2mm central pivot hole for 2mm steel pin or filament segment
            translate([-4, 0, 0]) cylinder(h=30, d=2.2, center=true);
        }
    }
}

// Rotating hinge tongue attached to the side service lid
module hinge_lid(z_pos) {
    translate([wall_thickness, case_depth - corner_rad/2, z_pos]) {
        difference() {
            union() {
                translate([-4, 0, -2.5]) cylinder(h=4.6, d=8, center=true);
                translate([-1, -4, -2.5]) cube([3, 8, 4.6], center=true);
            }
            translate([-4, 0, 0]) cylinder(h=30, d=2.2, center=true);
        }
    }
}

// Internal threaded boss/tab to secure side door via self-tapping screw
module screw_tab_base() {
    translate([wall_thickness, 15, 15]) { 
        difference() {
            translate([0, -12, -12]) cube([8, 17, 17]);
            // Pilot hole for M3 screw or heat-set insert
            translate([-1, 0, 0]) rotate([0, 90, 0]) cylinder(h=15, d=4.0);
        }
    }
}

// Screw pass-through and countersink on the side door panel
module screw_hole_lid() {
    translate([0, 15, 15]) {
        rotate([0, 90, 0]) {
            cylinder(h=wall_thickness * 4, d=3.4, center=true); // M3 clearance
            translate([0, 0, -1]) cylinder(h=1.01, d=6.5);     // Screw head counterbore
            translate([0, 0, 0]) cylinder(h=2.0, d1=6.5, d2=3.4); // Countersink taper
        }
    }
}

// Cylindrical M3 board standoffs on enclosure floor
module mount_standoffs(startX, startY, pitchX, pitchY) {
    for(dx = [0, pitchX]) {
        for(dy = [0, pitchY]) {
            translate([startX + dx, startY + dy, wall_thickness])
            difference() {
                cylinder(h=5, d=6, center=false); 
                translate([0, 0, 1.5]) cylinder(h=4, d=4, center=false); // M3 heat-set insert cavity
            }
        }
    }
}