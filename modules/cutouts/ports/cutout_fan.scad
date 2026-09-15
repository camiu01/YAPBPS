// =============================================================================
// YAPBPS - Axial Fan Cutout
// @file modules/cutouts/ports/cutout_fan.scad
// Axial fan bore with 4x corner mount screw holes. Bodies use TABS.
// =============================================================================

module cutout_fan(size = 40) {
	fan_bore_d = (size == 60) ? 57.0 : 38.0;
	screw_pitch = (size == 60) ? 50.0 : 32.0;
	screw_hole_d = (size == 60) ? 4.3 : 3.4;
	cylinder(h = 35, d = fan_bore_d, center = true);
	for (dx = [-screw_pitch / 2, screw_pitch / 2]) {
		for (dy = [-screw_pitch / 2, screw_pitch / 2]) {
			translate([dx, dy, 0])
				cylinder(h = 35, d = screw_hole_d, center = true);
		}
	}
}
