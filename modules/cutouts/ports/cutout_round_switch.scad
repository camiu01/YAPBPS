// =============================================================================
// YAPBPS - Round Switch Cutout
// @file modules/cutouts/ports/cutout_round_switch.scad
// Circular momentary or LED push button bore. Requires globals: round_sw_d,
// print_tolerance. Bodies use TABS for indentation.
// =============================================================================

module cutout_round_switch() {
	cylinder(h = 35, d = round_sw_d + print_tolerance, center = true);
}
