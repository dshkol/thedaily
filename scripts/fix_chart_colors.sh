#!/bin/bash
# Fix red-green color encoding in chart fills
# Replaces conditional fills with single color (#AF3C43)

DOCS_DIR="/Users/dmitryshkolnik/Projects/the-daily/docs"

# Count files before fix
echo "Scanning for red-green color patterns..."
BEFORE_COUNT=$(grep -r "#2e7d32" "$DOCS_DIR" --include="*.md" -l 2>/dev/null | wc -l)
echo "Found $BEFORE_COUNT files with #2e7d32 (green)"

# Pattern 1: fill: d => d.X >= 0 ? "#AF3C43" : "#2e7d32"
# Replace with: fill: "#AF3C43"
echo ""
echo "Fixing pattern 1: Conditional fills with red/green..."
find "$DOCS_DIR" -name "*.md" -type f -exec sed -i '' \
  's/fill: d => d\.\([a-zA-Z]*\) >= 0 ? "#AF3C43" : "#2e7d32"/fill: "#AF3C43"/g' {} \;

# Pattern 2: fill: d => d.X >= 0 ? "#2e7d32" : "#AF3C43"
# Replace with: fill: "#AF3C43"
echo "Fixing pattern 2: Conditional fills with green/red..."
find "$DOCS_DIR" -name "*.md" -type f -exec sed -i '' \
  's/fill: d => d\.\([a-zA-Z]*\) >= 0 ? "#2e7d32" : "#AF3C43"/fill: "#AF3C43"/g' {} \;

# Pattern 3: fill: d => d.X >= Y ? "#AF3C43" : "#666666" (e.g., weekly earnings)
# This pattern is acceptable (comparing to benchmark, not good/bad) - skip

# Count files after fix
AFTER_COUNT=$(grep -r "#2e7d32" "$DOCS_DIR" --include="*.md" -l 2>/dev/null | wc -l)
echo ""
echo "Files still containing #2e7d32: $AFTER_COUNT"
echo "Fixed approximately $((BEFORE_COUNT - AFTER_COUNT)) files"

# Show any remaining instances
if [ "$AFTER_COUNT" -gt 0 ]; then
  echo ""
  echo "Remaining files with #2e7d32 (may need manual review):"
  grep -r "#2e7d32" "$DOCS_DIR" --include="*.md" -l 2>/dev/null | head -20
fi
