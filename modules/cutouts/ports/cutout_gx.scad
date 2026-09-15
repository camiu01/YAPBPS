// =============================================================================
// YAPBPS - GX Aviation Connector Cutout
// @file modules/cutouts/ports/cutout_gx.scad
// Threaded circular GX12/GX16 bore. Requires globals: gx12_d, gx16_d,
// print_tolerance. Bodies use TABS for indentation.
// =============================================================================

module cutout_gx(type = "GX12") {
	d_hole = (type == "GX16") ? gx16_d : gx12_d;
	cylinder(h = 35, d = d_hole + print_tolerance, center = true);
}
