// =============================================================================
// YAPBPS - Sine Wave Vents Tool
// @file modules/vent/patterns/tool_sine_wave_vents.scad
// Undulating sine wave slots. Bodies use TABS for indentation.
// =============================================================================

module tool_sine_wave_vents(w, h, waves = 5, wave_amp = 4.0, slot_t = 3.0, spacing = 6.0) {
	pitch_y = wave_amp * 2 + spacing;
	count = max(1, floor(h / pitch_y));
	half_count = floor(count / 2);
	steps = 40;
	intersection() {
		cube([w, h, 35], center = true);
		for (i = [-half_count : 1 : half_count]) {
			translate([0, i * pitch_y, 0]) {
				for (s = [-steps / 2 : 1 : steps / 2 - 1]) {
					x1 = (w / steps) * s;
					x2 = (w / steps) * (s + 1);
					y1 = sin((s / steps) * 360 * waves) * wave_amp;
					y2 = sin(((s + 1) / steps) * 360 * waves) * wave_amp;
					hull() {
						translate([x1, y1, 0]) cylinder(h = 35, d = slot_t, center = true);
						translate([x2, y2, 0]) cylinder(h = 35, d = slot_t, center = true);
					}
				}
			}
		}
	}
}
