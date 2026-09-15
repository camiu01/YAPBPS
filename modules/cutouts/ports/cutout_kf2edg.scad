// =============================================================================
// YAPBPS - KF2EDG Terminal Cutout
// @file modules/cutouts/ports/cutout_kf2edg.scad
// Pluggable pitch screw terminal block bore. Requires globals: kf2edg_w,
// kf2edg_h. Depends on tool_through. Bodies use TABS for indentation.
// =============================================================================

module cutout_kf2edg() { tool_through(kf2edg_w, kf2edg_h); }
