// =============================================================================
// YAPBPS - USB-C Port Cutout
// @file modules/cutouts/ports/cutout_usbc.scad
// USB Type-C slot via hull of two cylinders. Requires globals: usb_w, usb_h.
// Bodies use TABS for indentation.
// =============================================================================

module cutout_usbc() {
	hull() {
		translate([(usb_w-usb_h)/2, 0, 0]) cylinder(h = 35, d = usb_h, center = true);
		translate([-(usb_w-usb_h)/2, 0, 0]) cylinder(h = 35, d = usb_h, center = true);
	}
}
