// =============================================================================
// YAPBPS - Vent Common Clamp
// @file modules/vent/common/clamp.scad
// Scalar range clamp helper shared by gradient vent patterns.
// Bodies use TABS for indentation.
// SPDX-License-Identifier: CC-BY-SA-4.0
// Copyright (c) 2026 Camiu (https://github.com/camiu01)
// Licensed under CC BY-SA 4.0. See LICENSE or https://creativecommons.org/licenses/by-sa/4.0/
// =============================================================================

function clamp_val(val, min_v, max_v) = min(max_v, max(min_v, val));
