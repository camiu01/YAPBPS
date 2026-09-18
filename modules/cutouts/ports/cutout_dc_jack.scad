// =============================================================================
// YAPBPS - DC Barrel Jack Cutout
// @file modules/cutouts/ports/cutout_dc_jack.scad
// 5.5x2.5mm panel-mount barrel jack round bore. Requires global: jack_d.
// Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_dc_jack() { cylinder(h = 35, d = jack_d, center = true); }
