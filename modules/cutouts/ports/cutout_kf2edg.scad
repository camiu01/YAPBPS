// =============================================================================
// YAPBPS - KF2EDG Terminal Cutout
// @file modules/cutouts/ports/cutout_kf2edg.scad
// Pluggable pitch screw terminal block bore. Requires globals: kf2edg_w,
// kf2edg_h. Depends on tool_through. Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

module cutout_kf2edg() { tool_through(kf2edg_w, kf2edg_h); }
