// ==============================================================================
// YAPBPS - Core Logic Registry
// @file modules/core_logic.scad
// Port registry, rear auto-arrange engine, collision audit, config validation.
// No top-level executable statements. Bodies use TABS for indentation.
// ==============================================================================

// ==============================================================================
// REGISTRY INDICES & DATA MATRIX
// ==============================================================================
REG_EN = 0;
REG_PANEL = 1;
REG_U = 2;
REG_V = 3;
REG_LABEL = 4;
REG_TYPE = 5;
REG_BW = 6;
REG_BH = 7;
REG_BRACKET = 8;
ALL_PORTS_REGISTRY = [
	[enable_front_module, front_mod_panel, front_mod_u, front_mod_v, label_sk200, "front_module", 82.0, 50.0, enable_bracket_front_module],
	[enable_banana, banana_panel, banana_u, banana_v, label_front, "banana", 30.0, 16.0, enable_bracket_banana],
	[enable_usbc, usbc_panel, usbc_u, usbc_v, label_usbc, "usbc", 16.0, 12.0, enable_bracket_usbc],
	[enable_kf2edg, kf2edg_panel, kf2edg_u, kf2edg_v, label_kf2edg, "kf2edg", 22.0, 18.0, enable_bracket_kf2edg],
	[enable_dc_jack, dc_jack_panel, dc_jack_u, dc_jack_v, label_dc_jack, "dc_jack", 14.0, 14.0, enable_bracket_dc],
	[enable_xt60, xt60_panel, xt60_u, xt60_v, label_xt60, "xt60", 32.0, 16.0, enable_bracket_xt60],
	[enable_switch, switch_panel, switch_u, switch_v, label_switch, "switch", 18.0, 24.0, enable_bracket_switch],
	[enable_xt30, xt30_panel, xt30_u, xt30_v, label_xt30, "xt30", 26.0, 14.0, enable_bracket_xt30],
	[enable_gx, gx_panel, gx_u, gx_v, label_gx, "gx", 20.0, 20.0, enable_bracket_gx],
	[enable_powerpole, powerpole_panel, powerpole_u, powerpole_v, label_powerpole, "pp", 22.0, 14.0, enable_bracket_pp],
	[enable_round_switch, round_sw_panel, round_sw_u, round_sw_v, label_round_sw, "round_sw", 20.0, 20.0, enable_bracket_round_sw],
	[enable_usba, usba_panel, usba_u, usba_v, label_usba, "usba", 18.0, 10.0, enable_bracket_usba],
	[enable_c14, c14_panel, c14_u, c14_v, label_c14, "c14", 48.0, 24.0, enable_bracket_c14],
	[enable_fan, fan_panel, fan_u, fan_v, label_fan, "fan", 62.0, 62.0, enable_bracket_fan],
	[enable_pot, pot_panel, pot_u, pot_v, label_pot, "pot", 16.0, 16.0, enable_bracket_pot],
	[enable_led5mm, led5mm_panel, led5mm_u, led5mm_v, label_led5mm, "led5mm", 10.0, 10.0, enable_bracket_led5mm],
	[enable_rj45, rj45_panel, rj45_u, rj45_v, label_rj45, "rj45", 20.0, 24.0, enable_bracket_rj45],
	[enable_fuse5x20, fuse5x20_panel, fuse5x20_u, fuse5x20_v, label_fuse5x20, "fuse5x20", 16.0, 16.0, enable_bracket_fuse5x20]
];

// ==============================================================================
// DYNAMIC REAR AUTO-ARRANGE ENGINE
// ==============================================================================
function port_is_on_rear(idx) = ALL_PORTS_REGISTRY[idx][REG_EN] && ALL_PORTS_REGISTRY[idx][REG_PANEL] == "Rear";

function rear_active_count(i=0) =
	(i >= len(ALL_PORTS_REGISTRY)) ? 0 :
	(port_is_on_rear(i) ? 1 : 0) + rear_active_count(i + 1);

function rear_total_width(i=0) =
	(i >= len(ALL_PORTS_REGISTRY)) ? 0 :
	(port_is_on_rear(i) ? ALL_PORTS_REGISTRY[i][REG_BW] : 0) + rear_total_width(i + 1);

function rear_span_before(target_idx, i=0) =
	(i >= target_idx) ? 0 :
	(port_is_on_rear(i) ? ALL_PORTS_REGISTRY[i][REG_BW] + rear_port_spacing : 0) + rear_span_before(target_idx, i + 1);

rear_ports_num = rear_active_count();
rear_cluster_w = rear_total_width() + max(0, rear_ports_num - 1) * rear_port_spacing;
rear_start_x = (case_width - rear_cluster_w) / 2;

function get_resolved_u(idx) =
	(auto_arrange_rear && port_is_on_rear(idx))
		? ((rear_start_x + rear_span_before(idx) + ALL_PORTS_REGISTRY[idx][REG_BW] / 2) / case_width) * 100
		: ALL_PORTS_REGISTRY[idx][REG_U];

function get_resolved_v(idx) =
	(auto_arrange_rear && port_is_on_rear(idx))
		? rear_port_v_pct
		: ALL_PORTS_REGISTRY[idx][REG_V];

// ==============================================================================
// 2D BOUNDING-BOX COLLISION DETECTION ENGINE
// ==============================================================================
function panel_extent_w(panel) =
	(panel == "Rear" || panel == "Top" || panel == "Front_Lip") ? case_width :
	(panel == "Right" || panel == "Left") ? case_depth :
	(panel == "Front_Slope") ? case_width : 100;

function panel_extent_h(panel) =
	(panel == "Rear" || panel == "Right" || panel == "Left") ? case_height :
	(panel == "Front_Lip") ? front_lip_height :
	(panel == "Top") ? top_flat_depth :
	(panel == "Front_Slope") ? slope_length : 100;

function check_bbox_clash(i, j) =
	let(pA = ALL_PORTS_REGISTRY[i], pB = ALL_PORTS_REGISTRY[j])
	(pA[REG_EN] && pB[REG_EN] && pA[REG_PANEL] == pB[REG_PANEL] && pA[REG_PANEL] != "None") ?
		let(
			w_panel = panel_extent_w(pA[REG_PANEL]),
			h_panel = panel_extent_h(pA[REG_PANEL]),
			cxA = (get_resolved_u(i) / 100) * w_panel,
			cyA = (get_resolved_v(i) / 100) * h_panel,
			cxB = (get_resolved_u(j) / 100) * w_panel,
			cyB = (get_resolved_v(j) / 100) * h_panel,
			min_dx = (pA[REG_BW] + pB[REG_BW]) / 2,
			min_dy = (pA[REG_BH] + pB[REG_BH]) / 2
		)
		(abs(cxA - cxB) < min_dx && abs(cyA - cyB) < min_dy) : false;

module run_collision_audit(i = 0) {
	if (i < len(ALL_PORTS_REGISTRY)) {
		if (i + 1 <= len(ALL_PORTS_REGISTRY) - 1) {
			for (j = [i + 1 : 1 : len(ALL_PORTS_REGISTRY) - 1]) {
				if (check_bbox_clash(i, j)) {
					echo(str("⚠️ COLLISION DETECTED: [", ALL_PORTS_REGISTRY[i][REG_TYPE], "] overlaps [", ALL_PORTS_REGISTRY[j][REG_TYPE], "] on panel '", ALL_PORTS_REGISTRY[i][REG_PANEL], "'!"));
				}
			}
		}
		run_collision_audit(i + 1);
	}
}

module validate_configuration() {
	assert(case_width > 2 * wall_thickness, "case_width must be greater than 2 * wall_thickness");
	assert(case_depth > top_flat_depth, "case_depth must exceed top_flat_depth");
	assert(case_height > front_lip_height, "case_height must exceed front_lip_height");
	assert(corner_rad >= 0, "corner_rad cannot be negative");
	assert(print_tolerance >= 0, "print_tolerance cannot be negative");
	if (auto_arrange_rear && rear_cluster_w > (case_width - 2 * margin_left))
		echo("WARNING: Rear auto-arrange width exceeds case inner margins.");
	run_collision_audit();
}
