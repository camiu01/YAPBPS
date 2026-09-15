// =============================================================================
// YAPBPS - XT60 Connector Cutout
// @file modules/cutouts/ports/cutout_xt60.scad
// XT60E-M body plus dual M3 flange holes. Requires globals: xt60_w, xt60_h,
// xt60_pitch. Depends on tool_through. Bodies use TABS for indentation.
// =============================================================================

module cutout_xt60() {
	tool_through(xt60_w, xt60_h);
	translate([-xt60_pitch/2, 0, 0]) cylinder(h = 35, d = 3.2, center = true);
	translate([xt60_pitch/2, 0, 0]) cylinder(h = 35, d = 3.2, center = true);
}
