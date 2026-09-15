// =============================================================================
// YAPBPS - KCD1 Rocker Switch Cutout
// @file modules/cutouts/ports/cutout_kcd1.scad
// Rectangular rocker master switch bore. Requires globals: sw_w, sw_h.
// Bodies use TABS for indentation.
// =============================================================================

module cutout_kcd1() { cube([sw_w, sw_h, 45], center = true); }
