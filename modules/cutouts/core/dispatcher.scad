// =============================================================================
// YAPBPS - Port Cutout Dispatcher
// @file modules/cutouts/core/dispatcher.scad
// String-keyed dispatcher over all per-port cutout modules.
// Requires globals: gx_type, fan_size. Bodies use TABS for indentation.
// =============================================================================

module render_port_cutout(type) {
	if (type == "front_module") front_module_cutout();
	else if (type == "banana") cutout_banana();
	else if (type == "xt60") cutout_xt60();
	else if (type == "dc_jack") cutout_dc_jack();
	else if (type == "kf2edg") cutout_kf2edg();
	else if (type == "usbc") cutout_usbc();
	else if (type == "switch") cutout_kcd1();
	else if (type == "xt30") cutout_xt30();
	else if (type == "gx") cutout_gx(gx_type);
	else if (type == "pp") cutout_powerpole();
	else if (type == "round_sw") cutout_round_switch();
	else if (type == "usba") cutout_usba();
	else if (type == "c14") cutout_c14();
	else if (type == "fan") cutout_fan(fan_size);
	else if (type == "pot") cutout_potentiometer();
	else if (type == "led5mm") cutout_led5mm();
	else if (type == "rj45") cutout_keystone_rj45();
	else if (type == "fuse5x20") cutout_fuse5x20();
}
