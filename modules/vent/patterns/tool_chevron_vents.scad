// =============================================================================
// YAPBPS - Chevron Vents Tool
// @file modules/vent/patterns/tool_chevron_vents.scad
// Chevron V-slot field. Bodies use TABS for indentation.
// =============================================================================

module tool_chevron_vents(w, h, slot_w = 3.5, spacing = 3.5) {
	pitch = slot_w + spacing;
	rows = max(1, floor(h / pitch));
	half_rows = floor(rows / 2);
	span_w = max(0.1, w / 2 - slot_w);
	intersection() {
		cube([w, h, 35], center = true);
		for (r = [-half_rows : 1 : half_rows]) {
			translate([0, r * pitch, 0]) {
				hull() {
					translate([0, 0, 0]) cylinder(h = 35, d = slot_w, center = true);
					translate([-span_w, span_w * 0.45, 0]) cylinder(h = 35, d = slot_w, center = true);
				}
				hull() {
					translate([0, 0, 0]) cylinder(h = 35, d = slot_w, center = true);
					translate([span_w, span_w * 0.45, 0]) cylinder(h = 35, d = slot_w, center = true);
				}
			}
		}
	}
}
