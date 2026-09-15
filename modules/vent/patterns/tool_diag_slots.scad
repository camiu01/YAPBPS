// =============================================================================
// YAPBPS - Diagonal Slots Vent Tool
// @file modules/vent/patterns/tool_diag_slots.scad
// 45-degree parallel slot field. Bodies use TABS for indentation.
// =============================================================================

module tool_diag_slots(w, h, slot_w = 4, spacing = 4) {
	pitch = slot_w + spacing;
	diag_span = w + h;
	count = round(diag_span / pitch);
	half_count = max(0, floor(count / 2));
	intersection() {
		cube([w, h, 35], center = true);
		rotate([0, 0, 45]) {
			if (half_count >= 0) {
				for (i = [-half_count : 1 : half_count]) {
					translate([i * pitch, 0, 0])
						cube([slot_w, diag_span * 1.5, 40], center = true);
				}
			}
		}
	}
}
