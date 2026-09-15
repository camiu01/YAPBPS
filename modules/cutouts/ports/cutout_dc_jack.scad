// =============================================================================
// YAPBPS - DC Barrel Jack Cutout
// @file modules/cutouts/ports/cutout_dc_jack.scad
// 5.5x2.5mm panel-mount barrel jack round bore. Requires global: jack_d.
// Bodies use TABS for indentation.
// =============================================================================

module cutout_dc_jack() { cylinder(h = 35, d = jack_d, center = true); }
