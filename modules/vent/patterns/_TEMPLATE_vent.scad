// =============================================================================
// YAPBPS - Vent Pattern Template (EXAMPLE ONLY, not included by aggregator)
// @file modules/vent/patterns/_TEMPLATE_vent.scad
// HOW-TO: copy this file to tool_mine.scad, rename the module to
// tool_mine(w, h, ...), clip field to [w, h, 35] via intersection() when the
// pattern repeats, add one include line in modules/vent/ventilation.scad,
// then add one else-if branch in modules/vent/core/vent_panel.scad mapping
// your vent_type string. Bodies use TABS for indentation.
// =============================================================================

// Copy pattern: replace tool_template with tool_<your_name>.
module tool_template(w, h, hole_d = 5, spacing = 2.5) {
	intersection() {
		cube([w, h, 35], center = true);
		cylinder(h = 35, d = hole_d, center = true);
	}
}
