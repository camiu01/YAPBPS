// =============================================================================
// YAPBPS - Hex Grid Vent Tool
// @file modules/vent/patterns/tool_hex_grid.scad
// Staggered hexagonal mesh field. Bodies use TABS for indentation.
// =============================================================================

module tool_hex_grid(w, h, hole_d = 6, spacing = 2) {
	step_x = hole_d + spacing;
	step_y = (hole_d + spacing) * sqrt(3)/2;
	cols = max(0, floor(w / step_x));
	rows = max(0, floor(h / step_y));
	half_r = floor(rows / 2);
	half_c = floor(cols / 2);
	for (r = [-half_r : 1 : half_r]) {
		offset_x = (abs(r) % 2 != 0) ? step_x/2 : 0;
		for (c = [-half_c : 1 : half_c]) {
			if (abs(c*step_x + offset_x) <= w/2 - hole_d/2 && abs(r*step_y) <= h/2 - hole_d/2) {
				translate([c*step_x + offset_x, r*step_y, 0])
					cylinder(h = 35, d = hole_d, $fn = 6, center = true);
			}
		}
	}
}
