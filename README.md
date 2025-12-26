# The D-AI-LY

An autonomous, AI-driven version of Statistics Canada's "The Daily" — generating bilingual statistical bulletins from CANSIM data.

## Overview

The D-AI-LY runs daily at 8am, automatically:
1. Discovering newsworthy CANSIM table updates
2. Fetching real data from Statistics Canada
3. Generating bilingual articles (EN + FR) following The Daily's voice
4. Publishing to a static website

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                 SCHEDULED TRIGGER (launchd)                 │
│                      Runs daily at 8am                      │
└─────────────────────┬───────────────────────────────────────┘
                      │
          ┌───────────▼────────────┐
          │     AI LAYER 1         │  ← discover_topics.R
          │  Topic Selection       │     Score by recency, sector
          └───────────┬────────────┘
                      │
          ┌───────────▼────────────┐
          │   DETERMINISTIC CORE   │  ← fetch_table.R
          │   R + cansim package   │     Config-driven extraction
          └───────────┬────────────┘
                      │
          ┌───────────▼────────────┐
          │     AI LAYER 2         │  ← Claude Code
          │  Article Generation    │     /the-daily-generator skill
          └───────────┬────────────┘
                      │
          ┌───────────▼────────────┐
          │   DETERMINISTIC CORE   │  ← Observable Framework
          │   Build + Publish      │     npm run build
          └────────────────────────┘
```

## Quick Start

### Prerequisites

- **R** with packages: `cansim`, `dplyr`, `tidyr`, `jsonlite`
- **Node.js** 20+
- **Claude Code** CLI (`npm install -g @anthropic-ai/claude-code`)

### Installation

```bash
# Clone and install
git clone https://github.com/mountainmath/the-daily.git
cd the-daily
npm install

# Install R packages
Rscript -e 'install.packages(c("cansim", "dplyr", "tidyr", "jsonlite"))'
```

### Run Manually

```bash
# Full pipeline (discovery → fetch → generate → build)
./automation/run_pipeline.sh

# Specific table
./automation/run_pipeline.sh --table=18-10-0004

# Prep only (no article generation)
./automation/run_pipeline.sh --prep-only
```

### Install Daily Automation

```bash
# Install launchd agent (runs at 8am daily)
./automation/install.sh

# Check status
./automation/install.sh --status

# Remove automation
./automation/install.sh --remove
```

## Project Structure

```
the-daily/
├── automation/
│   ├── run_pipeline.sh          # Daily orchestrator
│   ├── install.sh               # Automation installer
│   └── com.the-daily.pipeline.plist
│
├── r-tools/
│   ├── discover_topics.R        # Topic discovery & ranking
│   ├── fetch_table.R            # CANSIM data fetcher
│   └── table_configs.json       # Table extraction configs (25 tables)
│
├── docs/                        # Observable Framework site
│   ├── en/                      # English articles
│   ├── fr/                      # French articles
│   └── style.css                # StatCan-inspired styling
│
├── .claude/skills/
│   ├── the-daily-generator/     # Article generation skill
│   ├── the-daily-discover/      # Topic discovery skill
│   └── the-daily-publish/       # Build & deploy skill
│
├── .github/workflows/
│   └── daily.yml                # GitHub Action (fallback)
│
└── output/                      # Generated data files
```

## Skills

The project uses Claude Code skills for AI-driven tasks:

| Skill | Purpose |
|-------|---------|
| `/the-daily-generator` | Generate bilingual articles from CANSIM data |
| `/the-daily-discover` | Identify newsworthy table updates |
| `/the-daily-publish` | Build and deploy the site |

## Data Pipeline

### Topic Discovery

The R script `discover_topics.R` scans CANSIM for recently updated tables and ranks them by:

- **Recency** (25%) — How recently was data released?
- **Diversity** (25%) — Avoid covering same sector repeatedly
- **Public Interest** (50%) — Labour, prices, housing score highest

### Data Fetching

The `fetch_table.R` script uses configs from `table_configs.json` to:

- Fetch data via the `cansim` R package
- Apply dimension filters (GEO, categories)
- Calculate MoM and YoY changes
- Export analysis-ready JSON

### Article Generation

Claude Code follows the skill documentation to:

- Write in The Daily's neutral, clinical voice
- Create Observable markdown with embedded charts
- Generate both English and French versions
- Verify data integrity against source JSON

## The Daily Voice

Articles follow strict style guidelines:

- **Neutral and clinical** — no emotional language ("increased" not "surged")
- **Inverted pyramid** — most important facts first
- **Plain language** — accessible to general audiences
- Headlines lead with the key statistic
- Always include MoM and YoY comparisons
- Hedge causation: "amid", "coinciding with" (not "caused by")

## Configuration

### Adding New Tables

1. Add entry to `r-tools/table_configs.json`:

```json
"18-10-0004": {
  "name": "Consumer Price Index",
  "headline": "Consumer prices",
  "unit": "index",
  "filters": {
    "GEO": "Canada",
    "Products and product groups": "All-items"
  }
}
```

2. Test the fetch:
```bash
Rscript r-tools/fetch_table.R 18-10-0004 output
```

### Automation Schedule

Default: 8:00 AM daily. To change, edit `automation/com.the-daily.pipeline.plist` and reinstall.

## Development

```bash
# Start dev server
npm run dev

# Build site
npm run build

# Run discovery only
Rscript r-tools/discover_topics.R --configured --json
```

## Fallback Mechanism

If local automation fails (Mac offline, Claude Code issues):

1. GitHub Action runs at 8am ET (1pm UTC)
2. Runs discovery + fetch
3. Creates GitHub Issue with instructions
4. User runs `claude "/the-daily-generator TABLE"` when available

## License

MIT License. Data is from Statistics Canada (Crown Copyright).

## Acknowledgments

- Statistics Canada for the CANSIM data
- The `cansim` R package by Jens von Bergmann
- Observable Framework for the static site
- Anthropic Claude for AI capabilities
