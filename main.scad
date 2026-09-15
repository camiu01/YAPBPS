// ==============================================================================
// YAPBPS (Yet Another Parametric Bench Power Supply) - Modular Entry Point
// @file main.scad
// Customizer variables + module wiring.
// Bodies use TABS for indentation.
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


/* [Assembly Preview] */

// Show assembled lid in preview (F5). Disables automatically in export mode (F6)!
enable_assembly_view = true;

// Slide the lid backward to test the locking hooks (mm)
preview_slide = 0.0; // [0.0:0.1:15.0]

// Explode the lid laterally to look inside the chassis (mm)
preview_explode = 0.0; // [0.0:1.0:50.0]


/* [Rear Retention Hook System] */

// Vertical width/span of each rear retention hook tab (mm)
hook_w = 12.0; // [8.0:1.0:20.0]

// Material thickness of each retention hook tab (mm)
hook_t = 1.8; // [1.2:0.1:3.0]

// Depth of internal engagement behind the rear chassis wall (mm)
hook_reach = 3.5; // [2.0:0.5:6.0]

// Slide-to-lock travel distance (mm). Set > 3.0 to have the tabs protrude from the rear as a visual lock indicator.
hook_slide = 5.0; // [2.0:0.5:15.0]


/* [Ventilation Grids & Margins] */

// Rear vertical wall ventilation pattern
vent_type_rear = "hex"; //[hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, chevron: Chevron V-Slots, fan_radial: Radial Fan Grille, diamond: Diamond Grid, honeycomb_grad: Gradient Honeycomb, louver: Dust Louvers,triangles: Triangle Truss Grid, swirl: Vortex Swirl Turbine, brick: Staggered Brick Slots, teardrop: Teardrop Aerodynamic Mesh, sine_wave: Undulating Sine Wave, none: Disabled]

// Top horizontal landing flat panel ventilation pattern
vent_type_top = "slots"; //[hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, chevron: Chevron V-Slots, fan_radial: Radial Fan Grille, diamond: Diamond Grid, honeycomb_grad: Gradient Honeycomb, louver: Dust Louvers,triangles: Triangle Truss Grid, swirl: Vortex Swirl Turbine, brick: Staggered Brick Slots, teardrop: Teardrop Aerodynamic Mesh, sine_wave: Undulating Sine Wave, none: Disabled]

// Right side chassis panel ventilation pattern
vent_type_right = "diag_slots"; //[hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, chevron: Chevron V-Slots, fan_radial: Radial Fan Grille, diamond: Diamond Grid, honeycomb_grad: Gradient Honeycomb, louver: Dust Louvers,triangles: Triangle Truss Grid, swirl: Vortex Swirl Turbine, brick: Staggered Brick Slots, teardrop: Teardrop Aerodynamic Mesh, sine_wave: Undulating Sine Wave, none: Disabled]

// Left removable lid panel ventilation pattern
vent_type_left = "hex"; //[hex: Hexagonal Mesh, slots: Horizontal Slots, round: Round Perforated, diag_slots: Diagonal 45-deg Slots, chevron: Chevron V-Slots, fan_radial: Radial Fan Grille, diamond: Diamond Grid, honeycomb_grad: Gradient Honeycomb, louver: Dust Louvers,triangles: Triangle Truss Grid, swirl: Vortex Swirl Turbine, brick: Staggered Brick Slots, teardrop: Teardrop Aerodynamic Mesh, sine_wave: Undulating Sine Wave, none: Disabled]

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
enable_side_tabs = false;

// Exterior rebate counterbore to sink display bezel flush with chassis face
enable_module_flush = true;

// Enable internal support collar for front digital display module
enable_bracket_front_module = false;


/* [Port: Output Banana Jacks] */

// Dual 4mm isolated banana binding posts
enable_banana = true;

// Target panel for banana binding posts
banana_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Top: Top Flat Landing, Rear: Rear Wall, Right: Right Wall, Left: Left Lid, None: Disabled]

// Horizontal placement percentage across target panel (%)
banana_u = 50.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
banana_v = 50.0; // [0.0:1.0:100.0]

// Enable internal support collar for banana binding posts
enable_bracket_banana = false;


/* [Port: Input XT60 Connector] */

// Rear XT60E-M panel mount DC connector cutout
enable_xt60 = true;

// Target panel for XT60 connector
xt60_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
xt60_u = 75.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
xt60_v = 25.0; // [0.0:1.0:100.0]

// Enable internal support pillar for XT60 connector
enable_bracket_xt60 = false;


/* [Port: Input DC Barrel Jack] */

// 5.5x2.5mm panel-mount barrel jack round bore
enable_dc_jack = true;

// Target panel for DC barrel jack socket
dc_jack_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
dc_jack_u = 55.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
dc_jack_v = 25.0; // [0.0:1.0:100.0]

// Enable internal support pillar for DC Barrel Jack socket
enable_bracket_dc = false;


/* [Port: KF2EDG Screw Terminal] */

// Pluggable pitch screw terminal block cutout
enable_kf2edg = true;

// Target panel for KF2EDG terminal block
kf2edg_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
kf2edg_u = 35.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
kf2edg_v = 25.0; // [0.0:1.0:100.0]

// Enable internal support pillar for KF2EDG screw terminal
enable_bracket_kf2edg = false;


/* [Port: USB-C PD Input Port] */

// USB Type-C Power Delivery trigger board slot and internal pedestal
enable_usbc = true;

// Target panel for USB-C PD input
usbc_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
usbc_u = 15.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
usbc_v = 25.0; // [0.0:1.0:100.0]

// Enable internal rear retention bracket and support pillar for USB-C
enable_bracket_usbc = true;


/* [Port: Master Power Switch] */

// Rectangular rocker master switch cutout (KCD1 type)
enable_switch = true;

// Target panel for master power switch
switch_panel = "Right"; // [Right: Right Wall, Left: Left Lid, Rear: Rear Wall, Front_Lip: Lower Front Lip, Top: Top Flat Landing, None: Disabled]

// Horizontal placement percentage along target panel (%)
switch_u = 50.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
switch_v = 25.0; // [0.0:1.0:100.0]

// Text above master power switch
label_switch = "PWR";

// Enable internal support collar for rocker master switch
enable_bracket_switch = false;


/* [Port: XT30 Connector] */

// XT30E-M panel mount connector cutout
enable_xt30 = false;

// Target panel for XT30 connector
xt30_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, Front_Slope: Sloped Front, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
xt30_u = 85.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
xt30_v = 25.0; // [0.0:1.0:100.0]

// Text above XT30 connector
label_xt30 = "XT30";

// Enable internal support pillar for XT30 connector
enable_bracket_xt30 = false;


/* [Port: Aviation Connector (GX Series)] */

// Aviation threaded circular connector (GX series)
enable_gx = false;

// Aviation connector shell size
gx_type = "GX12"; // [GX12: 12mm Aviator, GX16: 16mm Aviator]

// Target panel for Aviation connector
gx_panel = "Right"; // [Right: Right Wall, Left: Left Lid, Rear: Rear Wall, Front_Lip: Lower Front Lip, Top: Top Flat Landing, Front_Slope: Sloped Front, None: Disabled]

// Horizontal placement percentage along target panel (%)
gx_u = 75.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
gx_v = 25.0; // [0.0:1.0:100.0]

// Text above Aviation connector
label_gx = "AVIATION";

// Enable internal support collar for GX aviation connector
enable_bracket_gx = false;


/* [Port: Anderson Powerpole] */

// Anderson Powerpole paired modular connector
enable_powerpole = false;

// Target panel for Powerpole connectors
powerpole_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, Front_Lip: Lower Front Lip, Front_Slope: Sloped Front, None: Disabled]

// Horizontal position % (manual override, ignored when auto-arrange is enabled)
powerpole_u = 20.0; // [0.0:1.0:100.0]

// Vertical elevation % (manual override, ignored when auto-arrange is enabled)
powerpole_v = 25.0; // [0.0:1.0:100.0]

// Text above Powerpole connector
label_powerpole = "PP45";

// Enable internal support pillar for Powerpole paired connector
enable_bracket_pp = false;


/* [Port: Round Push Button / Switch] */

// Circular momentary or LED push button cutout
enable_round_switch = false;

// Target panel for round push button
round_sw_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Right: Right Wall, Left: Left Lid, Rear: Rear Wall, Top: Top Flat Landing, Front_Slope: Sloped Front, None: Disabled]

// Horizontal placement percentage along target panel (%)
round_sw_u = 15.0; // [0.0:1.0:100.0]

// Vertical placement percentage along target panel (%)
round_sw_v = 50.0; // [0.0:1.0:100.0]

// Text above push button
label_round_sw = "STBY";

// Enable internal support collar for round push button
enable_bracket_round_sw = false;


/* [Port: USB-A Female Panel Port] */

enable_usba = false;
usba_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, None: Disabled]
usba_u = 30.0; // [0.0:1.0:100.0]
usba_v = 50.0; // [0.0:1.0:100.0]
label_usba = "5V OUT";

// Enable internal support collar for USB-A panel port
enable_bracket_usba = false;


/* [Port: AC IEC C14 Socket with M3 Flange] */

enable_c14 = false;
c14_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, None: Disabled]
c14_u = 85.0; // [0.0:1.0:100.0]
c14_v = 40.0; // [0.0:1.0:100.0]
label_c14 = "AC IN";

// Enable internal support collar for C14 socket
enable_bracket_c14 = false;


/* [Port: 40/60mm Axial Fan Cutout + M3/M4 Mount Holes] */

enable_fan = false;
fan_size = 40; // [40: 40mm Fan, 60: 60mm Fan]
fan_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Top: Top Flat Landing, None: Disabled]
fan_u = 20.0; // [0.0:1.0:100.0]
fan_v = 60.0; // [0.0:1.0:100.0]
label_fan = "FAN";

// Enable internal support collar for 40/60mm fan
enable_bracket_fan = false;


/* [Port: 6mm Rotary Potentiometer / Encoder with Anti-Rotation Lug] */

enable_pot = false;
pot_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Front_Slope: Sloped Front, Top: Top Flat Landing, Right: Right Wall, Left: Left Lid, None: Disabled]
pot_u = 70.0; // [0.0:1.0:100.0]
pot_v = 50.0; // [0.0:1.0:100.0]
label_pot = "ADJ";

// Enable internal support collar for rotary pot/encoder
enable_bracket_pot = false;


/* [Port: 5mm LED Indicator Bezel / Clip] */

enable_led5mm = false;
led5mm_panel = "Front_Lip"; // [Front_Lip: Lower Front Lip, Front_Slope: Sloped Front, Top: Top Flat Landing, Right: Right Wall, Left: Left Lid, None: Disabled]
led5mm_u = 85.0; // [0.0:1.0:100.0]
led5mm_v = 50.0; // [0.0:1.0:100.0]
label_led5mm = "ON";

// Enable internal support collar for 5mm LED
enable_bracket_led5mm = false;


/* [Port: RJ45 / Ethernet Keystone Jack Snap-In] */

enable_rj45 = false;
rj45_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, None: Disabled]
rj45_u = 40.0; // [0.0:1.0:100.0]
rj45_v = 30.0; // [0.0:1.0:100.0]
label_rj45 = "LAN";

// Enable internal support collar for RJ45 keystone
enable_bracket_rj45 = false;


/* [Port: 5x20mm Panel-Mount Screw Fuse Holder] */

enable_fuse5x20 = false;
fuse5x20_panel = "Rear"; // [Rear: Rear Wall, Right: Right Wall, Left: Left Lid, Front_Lip: Lower Front Lip, None: Disabled]
fuse5x20_u = 15.0; // [0.0:1.0:100.0]
fuse5x20_v = 75.0; // [0.0:1.0:100.0]
label_fuse5x20 = "FUSE";

// Enable internal support collar for 5x20mm fuse holder
enable_bracket_fuse5x20 = false;


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
label_offset_sk200 = 38.0; // [20.0:1.0:50.0]

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


/* [Chassis Dimensions] */

// Total exterior width across the front face (X-axis, mm)
case_width = 135; // [80:5:250]

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
// MODULE WIRING
// ==============================================================================
include <modules/core_logic.scad>
include <modules/cutouts/cutouts.scad>
include <modules/vent/ventilation.scad>
include <modules/chassis_and_lid.scad>

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
			panel = item[REG_PANEL];
			z_floor = (panel == "Rear" || panel == "Right" || panel == "Left") ? (case_height * v_pos / 100) :
				(panel == "Front_Lip") ? (front_lip_height * v_pos / 100) : 0;
			place_port(panel, u_pos, v_pos)
				color(color_mnt) render_port_bracket(p_type, z_floor);
		}
	}
}

// ==============================================================================
// VALIDATION & TOP-LEVEL RENDER STAGE
// ==============================================================================
validate_configuration();

if ($preview && enable_assembly_view) {
	if (render_main_body) base_case();
	if (render_side_lid) {
		translate([-preview_explode, preview_slide, 0])
			color(color_lid, 0.75) lid_assembly();
	}
} else {
	if (render_main_body) base_case();
	if (render_side_lid) {
		translate([-15, 0, 0])
			rotate([0, -90, 0])
			color(color_lid) lid_assembly();
	}
}