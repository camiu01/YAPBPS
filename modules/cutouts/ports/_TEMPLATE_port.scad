// =============================================================================
// YAPBPS - Port Template (EXAMPLE ONLY, not included by aggregator)
// @file modules/cutouts/ports/_TEMPLATE_port.scad
// HOW-TO: copy this file to cutout_mine.scad, rename the module to
// cutout_mine(), implement the 35mm-deep through bore, add one include line
// in modules/cutouts/cutouts.scad, then add one else-if branch in
// modules/cutouts/core/dispatcher.scad mapping your REG_TYPE string.
// Keep 35mm extrusion depth convention. Bodies use TABS for indentation.
// =============================================================================

// Copy pattern: replace cutout_template with cutout_<your_name>.
module cutout_template() {
	tool_through(20 + print_tolerance, 12 + print_tolerance, r = 1.0);
}
