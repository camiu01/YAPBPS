// =============================================================================
// YAPBPS - KCD1 Rocker Switch Cutout
// @file modules/cutouts/ports/cutout_kcd1.scad
// Rectangular rocker master switch bore. Requires globals: sw_w, sw_h.
// Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_kcd1() { cube([sw_w, sw_h, 45], center = true); }
