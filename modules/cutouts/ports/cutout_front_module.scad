// =============================================================================
// YAPBPS - Front Module Cutout
// @file modules/cutouts/ports/cutout_front_module.scad
// SK200W/SK150C meter body, side tabs and flush bezel recess.
// Requires globals: cutout_shape, enable_side_tabs, enable_module_flush,
// module_body_w/h, module_tab_w/h, module_corner_rad, module_rim_w/h,
// module_rim_rad, module_recess_depth. Depends on rounded_rect_2d.
// Bodies use TABS for indentation.
// =============================================================================

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
