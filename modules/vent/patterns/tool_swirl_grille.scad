// =============================================================================
// YAPBPS - Swirl Grille Vent Tool
// @file modules/vent/patterns/tool_swirl_grille.scad
// Vortex swirl turbine grille. Bodies use TABS for indentation.
// =============================================================================

module tool_swirl_grille(w, h, blades = 12, outer_d_pct = 0.95, twist_deg = 35, slot_t = 2.4) {
	outer_d = min(w, h) * outer_d_pct;
	inner_d = outer_d * 0.25;
	intersection() {
		cube([w, h, 35], center = true);
		difference() {
			cylinder(h = 35, d = outer_d, center = true);
			cylinder(h = 36, d = inner_d, center = true);
			for (i = [0 : 1 : blades - 1]) {
				rotate([0, 0, i * (360 / blades)]) {
					linear_extrude(height = 36, center = true) {
						polygon([
							[cos(0) * inner_d / 2, sin(0) * inner_d / 2],
							[cos(twist_deg) * outer_d / 2, sin(twist_deg) * outer_d / 2],
							[cos(twist_deg + slot_t * 2) * outer_d / 2, sin(twist_deg + slot_t * 2) * outer_d / 2],
							[cos(slot_t * 2) * inner_d / 2, sin(slot_t * 2) * inner_d / 2]
						]);
					}
				}
			}
		}
	}
}
