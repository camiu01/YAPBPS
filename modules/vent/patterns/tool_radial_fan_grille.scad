// =============================================================================
// YAPBPS - Radial Fan Grille Tool
// @file modules/vent/patterns/tool_radial_fan_grille.scad
// Concentric rings with radial spokes. Bodies use TABS for indentation.
// =============================================================================

module tool_radial_fan_grille(w, h, rings = 3, spokes = 4, rib_t = 1.6, center_hub_d = 12) {
	outer_d = min(w, h);
	intersection() {
		cube([w, h, 35], center = true);
		difference() {
			cylinder(h = 35, d = outer_d, center = true);
			cylinder(h = 36, d = center_hub_d, center = true);
			for (i = [1 : 1 : rings]) {
				r_outer = (outer_d / 2) * (i / rings);
				r_inner = max(0.1, r_outer - rib_t);
				difference() {
					cylinder(h = 36, r = r_outer, center = true);
					cylinder(h = 37, r = r_inner, center = true);
				}
			}
			for (s = [0 : 1 : spokes - 1]) {
				rotate([0, 0, s * (180 / spokes)])
					cube([outer_d, rib_t, 36], center = true);
			}
		}
	}
}
