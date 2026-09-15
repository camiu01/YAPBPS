// =============================================================================
// YAPBPS - Panel Cutouts Aggregator
// @file modules/cutouts/cutouts.scad
// Granular split aggregator only. No geometry here. Includes base helpers,
// one file per port, then the string-keyed dispatcher. Bodies use TABS.
// =============================================================================

include <base/helpers.scad>
include <ports/cutout_front_module.scad>
include <ports/cutout_kcd1.scad>
include <ports/cutout_dc_jack.scad>
include <ports/cutout_kf2edg.scad>
include <ports/cutout_xt60.scad>
include <ports/cutout_xt30.scad>
include <ports/cutout_banana.scad>
include <ports/cutout_usbc.scad>
include <ports/cutout_gx.scad>
include <ports/cutout_powerpole.scad>
include <ports/cutout_round_switch.scad>
include <ports/cutout_usba.scad>
include <ports/cutout_c14.scad>
include <ports/cutout_fan.scad>
include <ports/cutout_potentiometer.scad>
include <ports/cutout_led5mm.scad>
include <ports/cutout_keystone_rj45.scad>
include <ports/cutout_fuse5x20.scad>
include <core/dispatcher.scad>
