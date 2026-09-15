// =============================================================================
// YAPBPS - IEC C14 Socket Cutout
// @file modules/cutouts/ports/cutout_c14.scad
// IEC 320 C14 AC inlet plus dual flange screw holes. Requires global:
// print_tolerance. Depends on tool_through. Bodies use TABS for indentation.
// =============================================================================

module cutout_c14() {
	tool_through(27.5 + print_tolerance, 19.8 + print_tolerance, r = 2.0);
	translate([-20.0, 0, 0]) cylinder(h = 35, d = 3.4, center = true);
	translate([20.0, 0, 0]) cylinder(h = 35, d = 3.4, center = true);
}
