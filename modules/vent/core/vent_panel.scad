// =============================================================================
// YAPBPS - Vent Panel Dispatcher
// @file modules/vent/core/vent_panel.scad
// Per-panel vent type resolver plus margin framing. Dispatches to tool_*
// pattern modules. Requires globals: vent_type_rear/top/right/left,
// margin_top/bottom/left/right, vent_size, vent_spacing. Depends on
// place_port() defined in main.scad. Bodies use TABS for indentation.
// =============================================================================

module vent_panel(panel, p_w, p_h) {
	v_type = (panel == "Rear") ? vent_type_rear :
		(panel == "Top") ? vent_type_top :
		(panel == "Right") ? vent_type_right :
		(panel == "Left") ? vent_type_left : "none";
	m_bot = (panel == "Top") ? margin_top : margin_bottom;
	w = p_w - margin_left - margin_right;
	h = p_h - m_bot - margin_top;
	if (v_type != "none" && w > 0 && h > 0) {
		place_port(panel, 50, (m_bot + h/2) / p_h * 100) {
			if (v_type == "hex") {
				tool_hex_grid(w, h, hole_d = vent_size, spacing = vent_spacing);
			} else if (v_type == "slots") {
				tool_slot_vents(w, h, count = max(1, round(h / (vent_size + vent_spacing))), slot_w = vent_size);
			} else if (v_type == "round") {
				tool_round_grid(w, h, hole_d = vent_size, spacing = vent_spacing);
			} else if (v_type == "diag_slots") {
				tool_diag_slots(w, h, slot_w = vent_size, spacing = vent_spacing);
			} else if (v_type == "chevron") {
				tool_chevron_vents(w, h, slot_w = vent_size, spacing = vent_spacing);
			} else if (v_type == "fan_radial") {
				tool_radial_fan_grille(w, h, rings = 3, spokes = 4, rib_t = vent_spacing);
			} else if (v_type == "diamond") {
				tool_diamond_grid(w, h, size = vent_size, spacing = vent_spacing);
			} else if (v_type == "honeycomb_grad") {
				tool_gradient_honeycomb(w, h, min_d = vent_size * 0.6, max_d = vent_size * 1.3, wall = vent_spacing);
			} else if (v_type == "louver") {
				tool_louver_vents(w, h, slot_w = vent_size, spacing = vent_spacing);
			} else if (v_type == "triangles") {
				tool_triangle_grid(w, h, side = vent_size * 1.5, rib = vent_spacing);
			} else if (v_type == "swirl") {
				tool_swirl_grille(w, h, blades = 10, slot_t = vent_spacing);
			} else if (v_type == "brick") {
				tool_staggered_brick_slots(w, h, slot_w = vent_size * 2.5, slot_h = vent_size * 0.7, spacing = vent_spacing);
			} else if (v_type == "teardrop") {
				tool_teardrop_grid(w, h, hole_w = vent_size, spacing = vent_spacing);
			} else if (v_type == "sine_wave") {
				tool_sine_wave_vents(w, h, waves = 4, slot_t = vent_size * 0.6, spacing = vent_spacing + 2);
			}
		}
	}
}
