// =============================================================================
// YAPBPS - Round Switch Cutout
// @file modules/cutouts/ports/cutout_round_switch.scad
// Circular momentary or LED push button bore. Requires globals: round_sw_d,
// print_tolerance. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_round_switch() {
	cylinder(h = 35, d = round_sw_d + print_tolerance, center = true);
}
