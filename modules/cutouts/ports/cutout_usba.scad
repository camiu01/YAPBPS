// =============================================================================
// YAPBPS - USB-A Port Cutout
// @file modules/cutouts/ports/cutout_usba.scad
// USB-A female panel bore. Requires global: print_tolerance. Depends on
// tool_through. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_usba() {
	tool_through(13.2 + print_tolerance, 5.8 + print_tolerance, r = 0.8);
}
