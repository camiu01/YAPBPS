// =============================================================================
// YAPBPS - 5mm LED Cutout
// @file modules/cutouts/ports/cutout_led5mm.scad
// 5mm standard panel LED metal bezel / plastic clip holder. Requires global:
// print_tolerance. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_led5mm() {
	cylinder(h = 35, d = 6.4 + print_tolerance, center = true);
}
