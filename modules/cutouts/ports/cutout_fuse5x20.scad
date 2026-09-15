// =============================================================================
// YAPBPS - 5x20mm Fuse Holder Cutout
// @file modules/cutouts/ports/cutout_fuse5x20.scad
// Chassis screw-cap fuse holder, round threaded barrel with anti-spin flats.
// Requires global: print_tolerance. Bodies use TABS for indentation.
// =============================================================================

module cutout_fuse5x20() {
	intersection() {
		cylinder(h = 35, d = 12.2 + print_tolerance, center = true);
		cube([11.2 + print_tolerance, 15.0, 36], center = true);
	}
}
