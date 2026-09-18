// =============================================================================
// YAPBPS - Banana Jacks Cutout
// @file modules/cutouts/ports/cutout_banana.scad
// Dual 4mm isolated binding posts. Requires globals: banan_d, banan_pitch.
// Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_banana() {
	translate([-banan_pitch/2, 0, 0]) cylinder(h = 35, d = banan_d, center = true);
	translate([banan_pitch/2, 0, 0]) cylinder(h = 35, d = banan_d, center = true);
}
