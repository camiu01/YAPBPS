// =============================================================================
// YAPBPS - 5mm LED Cutout
// @file modules/cutouts/ports/cutout_led5mm.scad
// 5mm standard panel LED metal bezel / plastic clip holder. Requires global:
// print_tolerance. Bodies use TABS for indentation.
// =============================================================================

module cutout_led5mm() {
	cylinder(h = 35, d = 6.4 + print_tolerance, center = true);
}
