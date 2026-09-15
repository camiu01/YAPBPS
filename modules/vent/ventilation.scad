// =============================================================================
// YAPBPS - Ventilation Aggregator
// @file modules/vent/ventilation.scad
// Granular split aggregator only. No geometry here. Includes common clamp,
// one file per pattern, then the panel dispatcher. Bodies use TABS.
// =============================================================================

include <common/clamp.scad>
include <patterns/tool_hex_grid.scad>
include <patterns/tool_slot_vents.scad>
include <patterns/tool_round_grid.scad>
include <patterns/tool_diag_slots.scad>
include <patterns/tool_chevron_vents.scad>
include <patterns/tool_radial_fan_grille.scad>
include <patterns/tool_diamond_grid.scad>
include <patterns/tool_gradient_honeycomb.scad>
include <patterns/tool_louver_vents.scad>
include <patterns/tool_triangle_grid.scad>
include <patterns/tool_swirl_grille.scad>
include <patterns/tool_staggered_brick_slots.scad>
include <patterns/tool_teardrop_grid.scad>
include <patterns/tool_sine_wave_vents.scad>
include <core/vent_panel.scad>
