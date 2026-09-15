// ==============================================================================
// YAPBPS - Chassis, Lid, Brackets, Anchors
// @file modules/chassis_and_lid.scad
// Shell extrusion, base case, lid assembly, port brackets, hardware anchors.
// Bodies use TABS for indentation.
// ==============================================================================

// ==============================================================================
// UNIVERSAL BRACKETS & FIXTURES ENGINE
// ==============================================================================
module render_port_bracket(type, z_h) {
	if (type == "usbc") {
		usbc_bracket(z_h);
	} else if (type == "usba") universal_chassis_bracket(w = 16, h = 9, depth = 8, z_floor = z_h);
	else if (type == "rj45") universal_chassis_bracket(w = 18, h = 22, depth = 10, z_floor = z_h);
	else if (type == "pot") universal_chassis_bracket(w = 12, h = 12, depth = 6, z_floor = z_h);
	else {
		universal_chassis_bracket(w = 18, h = 14, depth = 8, z_floor = z_h);
	}
}

module universal_chassis_bracket(w=16, h=12, depth=8, z_floor=0) {
	translate([0, 0, -wall_thickness - depth/2 + 0.1])
	difference() {
		cube([w + 4, h + 4, depth + 0.2], center = true);
		cube([w, h, depth + 4], center = true);
	}
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
				difference() {
					hollow_shell();
					translate([-1, -1, -1])
						cube([wall_thickness + 1, case_depth + 2, case_height + 2]);
				}
				apply_configured_ports(target_is_lid = false);
				apply_configured_labels(target_is_lid = false);
				vent_panel("Rear", case_width, case_height);
				vent_panel("Top", case_width, top_flat_depth);
				intersection() {
					vent_panel("Right", case_depth, case_height);
					translate([-20, 0, 0])
						extrude_and_map(case_width + 40)
						offset(delta = -margin_diagonal) profile_2d();
				}
				for (z_pos = [case_height * 0.25, case_height * 0.75]) {
					translate([wall_thickness, case_depth - wall_thickness / 2, z_pos]) {
						hull() {
							translate([0, 0, 0])
								cube([0.1, wall_thickness + 2, hook_w + print_tolerance * 2], center = true);
							translate([hook_reach + print_tolerance, 0, 0])
								cube([0.1, wall_thickness + 2, hook_w + 2 * hook_reach + print_tolerance * 4], center = true);
						}
					}
					translate([
						wall_thickness + hook_reach / 2 + print_tolerance,
						case_depth - wall_thickness - hook_slide / 2,
						z_pos
					])
						cube([
							hook_reach + print_tolerance * 2,
							hook_slide + 0.5,
							hook_w + 2 * hook_reach + print_tolerance * 4
						], center = true);
				}
			}
		}
		color(color_mnt) screw_tab_base();
		if (enable_diode_mnt)
			color(color_mnt) mount_standoffs(20, 20, 41.0, 24.0);
		if (enable_zipties) {
			color(color_mnt) {
				ziptie_bridge(case_width * 0.50, case_depth - 25, rot = 0);
				ziptie_bridge(case_width - 16, case_depth * 0.45, rot = 90);
				ziptie_bridge(case_width * 0.50 + 25, 18, rot = 0);
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
				extrude_and_map(wall_thickness) profile_2d();
				translate([wall_thickness - 0.1, 0, 0])
				difference() {
					hull() {
						extrude_and_map(0.2)
							offset(delta = -wall_thickness - print_tolerance) profile_2d();
						translate([lid_lip_depth + 0.1, 0, 0])
							extrude_and_map(0.2)
								offset(delta = -wall_thickness - print_tolerance - lid_lip_depth) profile_2d();
					}
					hull() {
						translate([-0.1, 0, 0])
							extrude_and_map(0.2)
								offset(delta = -wall_thickness - print_tolerance - lid_lip_wall - 0.8) profile_2d();
						translate([lid_lip_depth + 0.2, 0, 0])
							extrude_and_map(0.2)
								offset(delta = -wall_thickness - print_tolerance - lid_lip_wall - 0.8 - lid_lip_depth) profile_2d();
					}
					translate([-0.5, case_depth - 30, -1])
						cube([lid_lip_depth + 2, 40, case_height + 2]);
					translate([-0.5, -5, -5])
						cube([lid_lip_depth + 2, 35, 35]);
				}
			}
			apply_configured_ports(target_is_lid = true);
			apply_configured_labels(target_is_lid = true);
			intersection() {
				vent_panel("Left", case_depth, case_height);
				translate([-20, 0, 0])
					extrude_and_map(case_width + 40)
						offset(delta = -margin_diagonal) profile_2d();
			}
			screw_hole_lid();
		}
		for (z_pos = [case_height * 0.25, case_height * 0.75]) {
			translate([wall_thickness, case_depth - wall_thickness, z_pos]) {
				hull() {
					translate([0.1, wall_thickness / 2, 0])
						cube([0.2, wall_thickness, hook_w], center = true);
					translate([hook_reach, wall_thickness / 2, 0])
						cube([0.2, wall_thickness - 0.5, hook_w + 2 * hook_reach], center = true);
				}
			}
		}
		apply_configured_brackets(target_is_lid = true);
	}
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
	for (dx = [0, pitchX]) {
		for (dy = [0, pitchY]) {
			translate([startX + dx, startY + dy, wall_thickness])
			difference() {
				cylinder(h = 5, d = 6, center = false);
				translate([0, 0, 1.5]) cylinder(h = 4, d = 4, center = false);
			}
		}
	}
}
