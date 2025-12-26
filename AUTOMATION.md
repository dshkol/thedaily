# The D-AI-LY Automation

This document describes how to set up and manage the autonomous daily pipeline.

## Architecture

The D-AI-LY runs as a two-layer system:

```
┌─────────────────────────────────────────┐
│     LOCAL AUTOMATION (Primary)          │
│     macOS launchd - runs at 8am daily   │
└─────────────────┬───────────────────────┘
                  │
    ┌─────────────▼─────────────┐
    │   1. Topic Discovery      │  ← R: discover_topics.R
    │   2. Data Fetch           │  ← R: fetch_table.R
    │   3. Article Generation   │  ← Claude Code (Max subscription)
    │   4. Build & Publish      │  ← npm + git
    └───────────────────────────┘

┌─────────────────────────────────────────┐
│     GITHUB ACTION (Fallback)            │
│     Creates issue if local fails        │
└─────────────────────────────────────────┘
```

## Quick Start

### Install Local Automation

```bash
cd automation
./install.sh
```

This installs a launchd agent that runs the pipeline daily at 8:00 AM.

### Check Status

```bash
./automation/install.sh --status
```

### Run Manually

```bash
# Full pipeline
./automation/run_pipeline.sh

# Prep only (discovery + fetch, no generation)
./automation/run_pipeline.sh --prep-only

# Specific table
./automation/run_pipeline.sh --table=18-10-0004
```

### Remove Automation

```bash
./automation/install.sh --remove
```

## How It Works

### Primary: Local Automation

1. **launchd** triggers `run_pipeline.sh` at 8:00 AM daily
2. **R discovers** newsworthy tables from configured list
3. **R fetches** data for the top-ranked table
4. **Claude Code** generates bilingual articles
5. **npm build** creates the static site
6. (Optional) **git push** publishes to GitHub Pages

### Fallback: GitHub Action

If the local automation doesn't run (Mac offline, Claude Code issues, quota exceeded):

1. GitHub Action runs on schedule (8am ET / 1pm UTC)
2. Runs discovery + fetch steps
3. Creates a GitHub Issue with:
   - Recommended table number
   - Command to run manually
   - Link to workflow artifacts

You then run the generation manually when available:

```bash
claude "/the-daily-generator TABLE_NUMBER"
```

## File Structure

```
automation/
├── run_pipeline.sh          # Main pipeline script
├── com.the-daily.pipeline.plist  # macOS launchd config
├── install.sh               # Installation script
└── logs/                    # Pipeline logs
    ├── pipeline_2025-01-01_08-00-00.log
    └── launchd_stdout.log

.github/workflows/
└── daily.yml                # GitHub Action (fallback)
```

## Configuration

### Scheduled Time

The pipeline runs at 8:00 AM local time. To change:

1. Edit `automation/com.the-daily.pipeline.plist`
2. Modify the `StartCalendarInterval` section
3. Reinstall: `./automation/install.sh`

### Table Selection

Tables are selected from `r-tools/table_configs.json`. To add tables:

1. Add configuration to `table_configs.json`
2. Follow the format of existing entries
3. Run discovery to verify: `Rscript r-tools/discover_topics.R --configured`

## Logs

Pipeline logs are stored in `automation/logs/`:

- `pipeline_YYYY-MM-DD_HH-MM-SS.log` - Full pipeline output
- `launchd_stdout.log` - launchd wrapper output
- `launchd_stderr.log` - launchd errors

View recent logs:

```bash
# Latest log
cat automation/logs/$(ls -t automation/logs/pipeline_*.log | head -1)

# Tail live
tail -f automation/logs/launchd_stdout.log
```

## Troubleshooting

### "Claude Code CLI not found"

Install Claude Code:

```bash
npm install -g @anthropic-ai/claude-code
```

### Pipeline runs but no article generated

Check if Claude Code quota is available. The pipeline uses your Max subscription, not API credits.

### launchd not triggering

```bash
# Check if agent is loaded
launchctl list | grep the-daily

# Reload agent
launchctl unload ~/Library/LaunchAgents/com.the-daily.pipeline.plist
launchctl load ~/Library/LaunchAgents/com.the-daily.pipeline.plist
```

### R packages not found

Install required packages:

```r
install.packages(c("cansim", "dplyr", "tidyr", "jsonlite"))
```

## Manual Operation

If you prefer to run the pipeline manually:

```bash
# Step 1: Discover topics
Rscript r-tools/discover_topics.R --configured --json --output=output

# Step 2: Check recommendation
cat output/discovery_results.json | jq '.recommendation'

# Step 3: Fetch data
Rscript r-tools/fetch_table.R TABLE_NUMBER output

# Step 4: Generate article
claude "/the-daily-generator TABLE_NUMBER"

# Step 5: Build site
npm run build

# Step 6: Publish (optional)
git add docs/ output/
git commit -m "Add: Article for TABLE_NUMBER"
git push
```
