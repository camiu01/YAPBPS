// =============================================================================
// YAPBPS - Triangle Grid Vent Tool
// @file modules/vent/patterns/tool_triangle_grid.scad
// Triangle truss grid, alternating orientation. Bodies use TABS.
// =============================================================================

module tool_triangle_grid(w, h, side = 8.0, rib = 1.8) {
	h_tri = side * sqrt(3) / 2;
	pitch_x = side + rib * sqrt(3);
	pitch_y = h_tri + rib * 1.5;
	cols = max(0, floor(w / pitch_x));
	rows = max(0, floor(h / pitch_y));
	half_c = floor(cols / 2);
	half_r = floor(rows / 2);
	intersection() {
		cube([w, h, 35], center = true);
		for (r = [-half_r : 1 : half_r], c = [-half_c : 1 : half_c]) {
			off_x = (abs(r) % 2 != 0) ? pitch_x / 2 : 0;
			translate([c * pitch_x + off_x, r * pitch_y, 0])
				cylinder(h = 35, r = side / sqrt(3), $fn = 3, center = true);
			translate([c * pitch_x + off_x + pitch_x / 2, r * pitch_y + pitch_y / 3, 0])
				rotate([0, 0, 180])
				cylinder(h = 35, r = side / sqrt(3), $fn = 3, center = true);
		}
	}
}
