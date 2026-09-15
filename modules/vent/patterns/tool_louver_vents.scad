// =============================================================================
// YAPBPS - Louver Vents Tool
// @file modules/vent/patterns/tool_louver_vents.scad
// Tilted dust louver slats. Bodies use TABS for indentation.
// =============================================================================

module tool_louver_vents(w, h, slot_w = 4.0, spacing = 3.0, louver_angle = 35) {
	pitch = slot_w + spacing;
	count = max(1, floor(h / pitch));
	half_count = floor(count / 2);
	span = max(0.1, w - 4);
	intersection() {
		cube([w, h, 35], center = true);
		for (i = [-half_count : 1 : half_count]) {
			translate([0, i * pitch, 0])
				rotate([louver_angle, 0, 0])
				cube([span, slot_w, 35], center = true);
		}
	}
}
