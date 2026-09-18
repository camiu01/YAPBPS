// =============================================================================
// YAPBPS - Anderson Powerpole Cutout
// @file modules/cutouts/ports/cutout_powerpole.scad
// Paired modular connector bore. Requires globals: pp_w, pp_h,
// print_tolerance. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_powerpole() {
	cube([pp_w + print_tolerance, pp_h + print_tolerance, 35], center = true);
}
