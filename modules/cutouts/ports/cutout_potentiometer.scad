// =============================================================================
// YAPBPS - Potentiometer Cutout
// @file modules/cutouts/ports/cutout_potentiometer.scad
// Standard 6mm bushing potentiometer / rotary encoder with anti-rotation lug.
// Requires global: print_tolerance. Bodies use TABS for indentation.
// =============================================================================

module cutout_potentiometer() {
	cylinder(h = 35, d = 7.2 + print_tolerance, center = true);
	translate([0, 7.5, 0])
		cylinder(h = 35, d = 3.0 + print_tolerance, center = true);
}
