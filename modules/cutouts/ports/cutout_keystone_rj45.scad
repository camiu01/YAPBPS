// =============================================================================
// YAPBPS - Keystone RJ45 Cutout
// @file modules/cutouts/ports/cutout_keystone_rj45.scad
// Standard keystone jack snap-in module (RJ45, HDMI, USB keystone).
// Requires global: print_tolerance. Depends on tool_through.
// Bodies use TABS for indentation.
// =============================================================================

module cutout_keystone_rj45() {
	tool_through(14.8 + print_tolerance, 19.4 + print_tolerance, r = 0.5);
}
