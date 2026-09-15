// =============================================================================
// YAPBPS - USB-A Port Cutout
// @file modules/cutouts/ports/cutout_usba.scad
// USB-A female panel bore. Requires global: print_tolerance. Depends on
// tool_through. Bodies use TABS for indentation.
// =============================================================================

module cutout_usba() {
	tool_through(13.2 + print_tolerance, 5.8 + print_tolerance, r = 0.8);
}
