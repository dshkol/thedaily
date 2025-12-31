#!/usr/bin/env python3
"""
Fix bar chart label positions in D-AI-LY articles.

Transforms dynamic positioning (labels at bar ends) to fixed positioning (labels at domain max).

Before:
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      dx: d => d.value >= 0 ? 4 : -4,
      textAnchor: d => d.value >= 0 ? "start" : "end",
      fontSize: 10
    }),

After:
    Plot.text(provincialData, {
      x: 10,  // Fixed at domain max
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 10
    }),
"""

import re
import sys
from pathlib import Path
from typing import Optional, Tuple


def extract_domain_max(content: str) -> Optional[int]:
    """Extract the domain max from x: {domain: [..., max]}"""
    # Look for x-axis domain for horizontal bar charts
    # Pattern: domain: [-5, 10] or domain: [0, 15]
    match = re.search(r'x:\s*\{[^}]*domain:\s*\[[\d\-\.]+,\s*([\d\.]+)\]', content)
    if match:
        return int(float(match.group(1)))
    return None


def fix_label_positioning(content: str) -> Tuple[str, bool]:
    """
    Fix label positioning in Plot.text blocks.
    Returns (modified_content, was_modified)
    """
    domain_max = extract_domain_max(content)
    if domain_max is None:
        return content, False

    modified = False

    # Pattern to match the problematic Plot.text block
    # We need to match:
    # - x: "value", → x: <domain_max>,
    # - dx: d => d.value >= 0 ? 4 : -4, (remove entirely)
    # - textAnchor: d => d.value >= 0 ? "start" : "end", → textAnchor: "end",

    # Replace x: "<propname>" with x: <domain_max>
    # Handle various property names: "value", "yoyPct", "change", etc.
    # (only in Plot.text blocks that have the dynamic textAnchor pattern)
    pattern = r'(Plot\.text\([^)]+,\s*\{[^}]*?)x:\s*"\w+"([^}]*?textAnchor:\s*d\s*=>\s*d\.\w+)'

    if re.search(pattern, content):
        # Replace x: "<propname>" with x: <domain_max>
        content = re.sub(
            r'(Plot\.text\([^)]+,\s*\{[^}]*?)x:\s*"\w+",',
            rf'\1x: {domain_max},',
            content
        )
        modified = True

    # Remove dx: d => ... line (handles d.value, d.yoyPct, d.change, etc.)
    pattern_dx = r'\s*dx:\s*d\s*=>\s*d\.\w+\s*>=?\s*0\s*\?\s*[\d\-]+\s*:\s*[\d\-]+,?\n'
    if re.search(pattern_dx, content):
        content = re.sub(pattern_dx, '\n', content)
        modified = True

    # Replace textAnchor: d => ... with textAnchor: "end"
    # Handle various property names: d.value, d.yoyPct, d.change, etc.
    pattern_anchor = r'textAnchor:\s*d\s*=>\s*d\.\w+\s*>=?\s*0\s*\?\s*"start"\s*:\s*"end"'
    if re.search(pattern_anchor, content):
        content = re.sub(pattern_anchor, 'textAnchor: "end"', content)
        modified = True

    return content, modified


def process_file(filepath: Path, dry_run: bool = False) -> bool:
    """Process a single file. Returns True if modified."""
    content = filepath.read_text()

    # Check if this file has the problematic pattern
    # Look for textAnchor: d => d.<prop> >= 0 ? "start" : "end"
    if not re.search(r'textAnchor:\s*d\s*=>\s*d\.\w+\s*>=?\s*0\s*\?\s*"start"\s*:\s*"end"', content):
        return False

    new_content, modified = fix_label_positioning(content)

    if modified:
        if dry_run:
            print(f"Would modify: {filepath}")
        else:
            filepath.write_text(new_content)
            print(f"Fixed: {filepath}")

    return modified


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Fix bar chart label positions")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be changed without modifying files")
    parser.add_argument("path", nargs="?", default="docs", help="Path to search (default: docs)")
    args = parser.parse_args()

    docs_path = Path(args.path)
    if not docs_path.exists():
        print(f"Error: {docs_path} does not exist")
        sys.exit(1)

    # Find all markdown files
    md_files = list(docs_path.rglob("*.md"))

    modified_count = 0
    for filepath in md_files:
        if process_file(filepath, dry_run=args.dry_run):
            modified_count += 1

    print(f"\n{'Would modify' if args.dry_run else 'Modified'}: {modified_count} files")


if __name__ == "__main__":
    main()
