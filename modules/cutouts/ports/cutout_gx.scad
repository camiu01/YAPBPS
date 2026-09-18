// =============================================================================
// YAPBPS - GX Aviation Connector Cutout
// @file modules/cutouts/ports/cutout_gx.scad
// Threaded circular GX12/GX16 bore. Requires globals: gx12_d, gx16_d,
// print_tolerance. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_gx(type = "GX12") {
	d_hole = (type == "GX16") ? gx16_d : gx12_d;
	cylinder(h = 35, d = d_hole + print_tolerance, center = true);
}
