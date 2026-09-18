// =============================================================================
// YAPBPS - USB-C Port Cutout
// @file modules/cutouts/ports/cutout_usbc.scad
// USB Type-C slot via hull of two cylinders. Requires globals: usb_w, usb_h.
// Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_usbc() {
	hull() {
		translate([(usb_w-usb_h)/2, 0, 0]) cylinder(h = 35, d = usb_h, center = true);
		translate([-(usb_w-usb_h)/2, 0, 0]) cylinder(h = 35, d = usb_h, center = true);
	}
}
