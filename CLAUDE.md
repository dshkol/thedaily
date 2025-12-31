# The D-AI-LY - Project Context

An LLM-driven version of Statistics Canada's "The Daily" generating automated statistical bulletins from CANSIM data.

## Critical Rule

**NEVER use synthetic, placeholder, or made-up data.** Every number in an article MUST come directly from Statistics Canada tables via the `cansim` R package. If data cannot be fetched, do not generate the article.

## Architecture

```
docs/                    # Observable Framework site
├── en/{slug}/index.md   # English articles
├── fr/{slug}/index.md   # French articles
└── style.css            # Site styling (StatCan red: #AF3C43)

r-tools/                 # R scripts for data fetching
├── fetch_cansim_enhanced.R
├── discover_topics.R
└── discover_stories.R

src/
└── lang-map.js          # EN↔FR slug mappings

.claude/skills/          # Claude Code skills
├── the-daily-generator/ # Article generation
├── the-daily-publish/   # Build and deploy
└── the-daily-discover/  # Topic discovery
```

## Commands

```bash
# Start dev server
npm run dev

# Fetch data for a table
Rscript r-tools/fetch_cansim_enhanced.R <table-number> output

# Build for production
npm run build
```

## Skills

Use these skills for D-AI-LY tasks:

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `the-daily-generator` | "generate article", "create Daily", "cover table X" | Create articles from CANSIM data |
| `the-daily-publish` | "publish", "build site", "deploy" | Build and deploy the site |
| `the-daily-discover` | "find topics", "what's new", "scan releases" | Discover article candidates |

Each skill contains detailed workflow instructions and reference files.

## Data Fetching

Always use the `cansim` R package (project maintainer is package author):

```r
library(cansim)

# Fetch table
df <- get_cansim("18-10-0004")

# Search for tables
search_cansim_cubes("retail trade")

# Connection-based for large tables
conn <- get_cansim_connection("36-10-0434", refresh = "auto")
```

See skill reference files for detailed patterns.
