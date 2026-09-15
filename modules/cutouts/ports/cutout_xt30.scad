// =============================================================================
// YAPBPS - XT30 Connector Cutout
// @file modules/cutouts/ports/cutout_xt30.scad
// XT30E-M body plus dual flange holes. Requires globals: xt30_w, xt30_h,
// xt30_pitch. Depends on tool_through. Bodies use TABS for indentation.
// =============================================================================

module cutout_xt30() {
	tool_through(xt30_w, xt30_h, r = 1.5);
	translate([-xt30_pitch/2, 0, 0]) cylinder(h = 35, d = 2.8, center = true);
	translate([xt30_pitch/2, 0, 0]) cylinder(h = 35, d = 2.8, center = true);
}
