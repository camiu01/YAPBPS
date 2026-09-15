// =============================================================================
// YAPBPS - Gradient Honeycomb Vent Tool
// @file modules/vent/patterns/tool_gradient_honeycomb.scad
// Honeycomb cells shrinking toward panel edges. Depends on clamp_val.
// Bodies use TABS for indentation.
// =============================================================================

module tool_gradient_honeycomb(w, h, min_d = 3.5, max_d = 7.5, wall = 1.8) {
	step_x = max_d + wall;
	step_y = step_x * sqrt(3) / 2;
	cols = max(0, floor(w / step_x));
	rows = max(0, floor(h / step_y));
	half_c = floor(cols / 2);
	half_r = floor(rows / 2);
	max_radius = sqrt(pow(w / 2, 2) + pow(h / 2, 2));
	for (r = [-half_r : 1 : half_r]) {
		offset_x = (abs(r) % 2 != 0) ? step_x / 2 : 0;
		for (c = [-half_c : 1 : half_c]) {
			pos_x = c * step_x + offset_x;
			pos_y = r * step_y;
			dist = sqrt(pow(pos_x, 2) + pow(pos_y, 2));
			t = clamp_val(1 - (dist / max(1, max_radius)), 0, 1);
			cell_d = min_d + (max_d - min_d) * t;
			if (abs(pos_x) <= w / 2 - cell_d / 2 && abs(pos_y) <= h / 2 - cell_d / 2) {
				translate([pos_x, pos_y, 0])
					cylinder(h = 35, d = cell_d, $fn = 6, center = true);
			}
		}
	}
}
