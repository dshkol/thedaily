# The D-AI-LY

An LLM-driven version of Statistics Canada's "The Daily" - generating automated statistical bulletins from CANSIM data.

## Overview

The D-AI-LY fetches data from Statistics Canada's CANSIM database and generates news-style articles following The Daily's distinctive voice: neutral, clinical, and structured using the inverted pyramid format.

## Quick Start

```bash
# Run the full pipeline (fetches latest CPI data and generates article)
./run_pipeline.sh

# Or specify a different table
./run_pipeline.sh "20-10-0008"
```

## Pipeline

1. **Data Fetching** (`r-tools/fetch_cansim_data.R`)
   - Uses the `cansim` R package to fetch CANSIM tables
   - Calculates period-over-period and year-over-year changes
   - Exports analysis-ready JSON

2. **Article Generation** (`generate_article.py`)
   - Generates content in The Daily voice
   - Creates headline, highlights, body sections
   - Embeds Observable Plot chart

3. **Output** (`output/articles/`)
   - Self-contained HTML with inline chart
   - StatCan-inspired styling

## The Daily Voice

Articles follow strict style guidelines:
- **Neutral and clinical** - no emotional language
- **Inverted pyramid** - most important facts first
- **Plain language** - accessible to general audiences
- Headlines lead with the key number
- Always compare to previous period AND year-over-year

## Structure

```
the-daily/
├── r-tools/
│   └── fetch_cansim_data.R    # CANSIM data fetching
├── templates/
│   └── article.html           # HTML template with Observable Plot
├── output/
│   ├── articles/              # Generated articles
│   └── data_*.json            # Cached data
├── generate_article.py        # Article generator
└── run_pipeline.sh            # Full pipeline script
```

## Dependencies

**R packages:**
- `cansim` - Statistics Canada data access
- `dplyr`, `tidyr` - Data manipulation
- `jsonlite` - JSON export

**Python:** Standard library only (json, re, pathlib, datetime)

**Web:** Observable Plot, D3.js (loaded via CDN)

## Next Steps

- [ ] Autonomous table selection (browse 7,000+ tables)
- [ ] LLM-enhanced article generation
- [ ] Static site with index page
- [ ] Scheduled automation

## License

This is an experimental project. Data comes from Statistics Canada (Crown Copyright).
