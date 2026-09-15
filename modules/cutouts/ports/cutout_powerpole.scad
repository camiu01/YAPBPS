// =============================================================================
// YAPBPS - Anderson Powerpole Cutout
// @file modules/cutouts/ports/cutout_powerpole.scad
// Paired modular connector bore. Requires globals: pp_w, pp_h,
// print_tolerance. Bodies use TABS for indentation.
// =============================================================================

module cutout_powerpole() {
	cube([pp_w + print_tolerance, pp_h + print_tolerance, 35], center = true);
}
