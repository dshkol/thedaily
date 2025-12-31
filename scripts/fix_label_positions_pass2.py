#!/usr/bin/env python3
"""
Second pass fix for bar chart label positions.

Finds Plot.text blocks that have textAnchor: "end" but still have x: "<property>"
and fixes them to use the domain max.
"""

import re
import sys
from pathlib import Path
from typing import Optional, Tuple


def extract_domain_max(content: str) -> Optional[int]:
    """Extract the domain max from x: {domain: [..., max]}"""
    match = re.search(r'x:\s*\{[^}]*domain:\s*\[[\d\-\.]+,\s*([\d\.]+)\]', content)
    if match:
        return int(float(match.group(1)))
    return None


def fix_remaining_x_positions(content: str) -> Tuple[str, bool]:
    """Fix x: "<prop>" in Plot.text blocks that already have textAnchor: "end"."""
    domain_max = extract_domain_max(content)
    if domain_max is None:
        return content, False

    modified = False

    # Pattern: Plot.text block with x: "<propname>" and textAnchor: "end"
    # We need to find these blocks and replace x: "<propname>" with x: <domain_max>

    # This regex matches Plot.text(..., { ... x: "<word>", ... textAnchor: "end" ... })
    pattern = r'(Plot\.text\([^)]+,\s*\{[^}]*?)x:\s*"\w+",([^}]*?textAnchor:\s*"end")'

    if re.search(pattern, content):
        content = re.sub(
            r'(Plot\.text\([^)]+,\s*\{[^}]*?)x:\s*"\w+",',
            rf'\1x: {domain_max},',
            content
        )
        modified = True

    return content, modified


def process_file(filepath: Path, dry_run: bool = False) -> bool:
    """Process a single file. Returns True if modified."""
    content = filepath.read_text()

    # Check if this file has the pattern we're looking for:
    # Plot.text with x: "<propname>" and textAnchor: "end"
    if not re.search(r'Plot\.text\([^)]+,\s*\{[^}]*?x:\s*"\w+"[^}]*?textAnchor:\s*"end"', content, re.DOTALL):
        return False

    new_content, modified = fix_remaining_x_positions(content)

    if modified:
        if dry_run:
            print(f"Would modify: {filepath}")
        else:
            filepath.write_text(new_content)
            print(f"Fixed: {filepath}")

    return modified


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Fix remaining bar chart label positions")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be changed without modifying files")
    parser.add_argument("path", nargs="?", default="docs", help="Path to search (default: docs)")
    args = parser.parse_args()

    docs_path = Path(args.path)
    if not docs_path.exists():
        print(f"Error: {docs_path} does not exist")
        sys.exit(1)

    md_files = list(docs_path.rglob("*.md"))

    modified_count = 0
    for filepath in md_files:
        # Skip the style guide
        if "CHART-STYLE-GUIDE" in str(filepath):
            continue
        if process_file(filepath, dry_run=args.dry_run):
            modified_count += 1

    print(f"\n{'Would modify' if args.dry_run else 'Modified'}: {modified_count} files")


if __name__ == "__main__":
    main()
