// =============================================================================
// YAPBPS - Slot Vents Tool
// @file modules/vent/patterns/tool_slot_vents.scad
// Horizontal stadium slots. Bodies use TABS for indentation.
// =============================================================================

module tool_slot_vents(w, d, count = 8, slot_w = 4) {
	safe_count = max(1, count);
	step = d / safe_count;
	span = max(0, w/2 - slot_w/2);
	for (i = [0 : 1 : safe_count - 1]) {
		translate([0, -d/2 + i*step + step/2, 0])
			hull() {
				translate([-span, 0, 0]) cylinder(h = 35, d = slot_w, center = true);
				translate([span, 0, 0]) cylinder(h = 35, d = slot_w, center = true);
			}
	}
}
