#!/bin/bash
# The D-AI-LY Pipeline
# Fetches CANSIM data and generates a Daily-style article

set -e

TABLE_NUMBER="${1:-18-10-0004}"
OUTPUT_DIR="output"

echo "=== The D-AI-LY Pipeline ==="
echo "Table: $TABLE_NUMBER"
echo ""

# Step 1: Fetch data from CANSIM
echo "Step 1: Fetching data from Statistics Canada..."
Rscript r-tools/fetch_cansim_data.R "$TABLE_NUMBER" "$OUTPUT_DIR"

# Step 2: Generate article
DATA_FILE="$OUTPUT_DIR/data_$(echo $TABLE_NUMBER | tr '-' '_').json"
ARTICLE_FILE="$OUTPUT_DIR/articles/article_$(date +%Y%m%d).html"

echo ""
echo "Step 2: Generating article..."
python3 generate_article.py "$DATA_FILE" "$ARTICLE_FILE"

echo ""
echo "=== Pipeline Complete ==="
echo "Article: $ARTICLE_FILE"
echo ""
echo "Open in browser: open $ARTICLE_FILE"
