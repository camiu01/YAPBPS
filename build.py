"""YAPBPS merge tool.

Reads main.scad, recursively inlines include<...> directives,
and writes a single-file YAPBPS_merged.scad for distribution.
"""
from __future__ import annotations

import logging
import re
from pathlib import Path

INCLUDE_RE = re.compile(r'^\s*include\s*<\s*(?P<path>[^>]+?)\s*>\s*;?\s*$')

logger = logging.getLogger("yapbps_build")


def resolve_includes(entry: Path, seen: set[Path] | None = None) -> str:
	"""Inline include directives recursively.

	Args:
		entry: Entry SCAD file to expand.
		seen: Set of already inlined absolute paths (loop guard).

	Returns:
		Expanded SCAD source text.

	Raises:
		FileNotFoundError: If an included file does not exist.
	"""
	if seen is None:
		seen = set()
	resolved = entry.resolve()
	if resolved in seen:
		logger.warning("Skipping duplicate include: %s", resolved)
		return ""
	seen.add(resolved)
	base_dir = resolved.parent
	lines: list[str] = []
	for raw in resolved.read_text(encoding="utf-8").splitlines(keepends=True):
		stripped = raw.strip()
		match = INCLUDE_RE.match(stripped)
		if match:
			rel = match.group("path").strip()
			target = (base_dir / rel).resolve()
			if not target.exists() and not target.suffix:
				candidate = target.with_suffix(".scad")
				if candidate.exists():
					target = candidate
			if not target.exists():
				raise FileNotFoundError(f"Include not found: {rel} (from {resolved})")
			lines.append(f"// --- inlined: {rel} ---\n")
			lines.append(resolve_includes(target, seen))
		else:
			lines.append(raw)
	return "".join(lines)


def build(entry_name: str = "main.scad", output_name: str = "YAPBPS_merged.scad") -> Path:
	"""Build merged SCAD file next to this script.

	Args:
		entry_name: Entry file containing include directives.
		output_name: Output merged file name.

	Returns:
		Path to the written merged file.
	"""
	root = Path(__file__).resolve().parent
	entry = root / entry_name
	output = root / output_name
	merged = resolve_includes(entry, seen=set())
	output.write_text(merged, encoding="utf-8")
	logger.info("Wrote merged file: %s (%d bytes)", output, len(merged))
	return output


if __name__ == "__main__":
	logging.basicConfig(level=logging.INFO, format="%(levelname)s %(name)s: %(message)s")
	build()
