// =============================================================================
// YAPBPS - Potentiometer Cutout
// @file modules/cutouts/ports/cutout_potentiometer.scad
// Standard 6mm bushing potentiometer / rotary encoder with anti-rotation lug.
// Requires global: print_tolerance. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_potentiometer() {
	cylinder(h = 35, d = 7.2 + print_tolerance, center = true);
	translate([0, 7.5, 0])
		cylinder(h = 35, d = 3.0 + print_tolerance, center = true);
}
