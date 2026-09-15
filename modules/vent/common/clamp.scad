// =============================================================================
// YAPBPS - Vent Common Clamp
// @file modules/vent/common/clamp.scad
// Scalar range clamp helper shared by gradient vent patterns.
// Bodies use TABS for indentation.
// =============================================================================

function clamp_val(val, min_v, max_v) = min(max_v, max(min_v, val));
