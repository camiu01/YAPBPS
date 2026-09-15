// =============================================================================
// YAPBPS - Staggered Brick Slots Vent Tool
// @file modules/vent/patterns/tool_staggered_brick_slots.scad
// Staggered brick slot courses. Bodies use TABS for indentation.
// =============================================================================

module tool_staggered_brick_slots(w, h, slot_w = 12.0, slot_h = 3.2, spacing = 2.4) {
	pitch_x = slot_w + spacing;
	pitch_y = slot_h + spacing;
	cols = max(0, floor(w / pitch_x));
	rows = max(0, floor(h / pitch_y));
	half_c = floor(cols / 2);
	half_r = floor(rows / 2);
	intersection() {
		cube([w, h, 35], center = true);
		for (r = [-half_r : 1 : half_r]) {
			row_offset = (abs(r) % 2 != 0) ? pitch_x / 2 : 0;
			for (c = [-half_c - 1 : 1 : half_c + 1]) {
				translate([c * pitch_x + row_offset, r * pitch_y, 0])
					hull() {
						translate([-(slot_w - slot_h) / 2, 0, 0]) cylinder(h = 35, d = slot_h, center = true);
						translate([(slot_w - slot_h) / 2, 0, 0]) cylinder(h = 35, d = slot_h, center = true);
					}
			}
		}
	}
}
