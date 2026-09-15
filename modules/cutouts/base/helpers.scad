// =============================================================================
// YAPBPS - Cutout Base Helpers
// @file modules/cutouts/base/helpers.scad
// Shared 2D and through-cut primitives plus text engraving tool.
// Requires globals: label_depth, label_size. Bodies use TABS for indentation.
// =============================================================================

module rounded_rect_2d(w, h, r) {
	safe_r = min(r, max(0.05, min(w, h)/2 - 0.05));
	offset(r = safe_r) square([max(0.1, w - 2*safe_r), max(0.1, h - 2*safe_r)], center = true);
}

module tool_through(w, h, r = 0) {
	if (r > 0) {
		linear_extrude(height = 35, center = true) rounded_rect_2d(w, h, r);
	} else {
		cube([w, h, 35], center = true);
	}
}

module engrave_text(txt) {
	translate([0, 0, -label_depth + 0.01])
		linear_extrude(height = label_depth)
		text(txt, size = label_size, halign = "center", valign = "center", font = "Arial:style=Bold");
}
