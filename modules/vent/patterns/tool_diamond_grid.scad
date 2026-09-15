// =============================================================================
// YAPBPS - Diamond Grid Vent Tool
// @file modules/vent/patterns/tool_diamond_grid.scad
// Rotated square perforation field. Bodies use TABS for indentation.
// =============================================================================

module tool_diamond_grid(w, h, size = 6.0, spacing = 2.0) {
	pitch = (size + spacing) * sqrt(2);
	cols = max(0, floor(w / pitch));
	rows = max(0, floor(h / pitch));
	half_c = floor(cols / 2);
	half_r = floor(rows / 2);
	intersection() {
		cube([w, h, 35], center = true);
		for (c = [-half_c : 1 : half_c], r = [-half_r : 1 : half_r]) {
			translate([c * pitch, r * pitch, 0])
				rotate([0, 0, 45])
				cube([size, size, 35], center = true);
		}
	}
}
