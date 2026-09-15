// =============================================================================
// YAPBPS - Teardrop Grid Vent Tool
// @file modules/vent/patterns/tool_teardrop_grid.scad
// Aerodynamic teardrop mesh. Bodies use TABS for indentation.
// =============================================================================

module tool_teardrop_grid(w, h, hole_w = 5.0, spacing = 2.5) {
	pitch_x = hole_w + spacing;
	pitch_y = (hole_w * 1.5) + spacing;
	cols = max(0, floor(w / pitch_x));
	rows = max(0, floor(h / pitch_y));
	half_c = floor(cols / 2);
	half_r = floor(rows / 2);
	intersection() {
		cube([w, h, 35], center = true);
		for (r = [-half_r : 1 : half_r], c = [-half_c : 1 : half_c]) {
			off_x = (abs(r) % 2 != 0) ? pitch_x / 2 : 0;
			translate([c * pitch_x + off_x, r * pitch_y, 0]) {
				hull() {
					cylinder(h = 35, d = hole_w, center = true);
					translate([0, hole_w * 0.6, 0]) cube([0.1, 0.1, 35], center = true);
				}
			}
		}
	}
}
