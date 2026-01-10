# Data Verification: Ensuring Integrity in AI-Generated Statistics

*How The D-AI-LY prevents hallucinated data from reaching publication*

---

## The Challenge

The D-AI-LY is an experimental project: using large language models to automatically generate Statistics Canada "Daily"-style statistical bulletins from CANSIM data tables. The vision is compelling - automated, timely coverage of economic releases that would otherwise require human statisticians to write.

But there's a fundamental problem: **LLMs hallucinate**.

When generating text about economic statistics, an LLM might:
- Invent plausible-looking numbers that aren't in the source data
- Confuse similar metrics (Bank Rate vs Policy Rate)
- Apply the wrong decimal place (0.04% becomes 0.4%)
- Generate data for periods that haven't been released yet
- Fill in table cells with fabricated values when the real data isn't available

The danger is that fabricated economic data *looks real*. A reader has no way to distinguish "Employment rate: 62.3%" derived from Statistics Canada from "Employment rate: 62.3%" that the LLM invented to fill a table.

**The stakes are high.** Publishing incorrect economic statistics - even in an explicitly experimental, AI-generated publication - erodes trust and could mislead anyone who uses these numbers.

This document describes the multi-layer verification system we built to address this challenge, the failure modes we encountered along the way, and why we believe the current system is robust.

---

## The Architecture: Defense in Depth

Our approach is defense in depth - multiple independent verification layers, each catching different types of errors. If one layer fails, another catches the problem.

### Layer 1: Data Acquisition with Validation (R)

All data flows through a single R script: `fetch_cansim_enhanced.R`. This script:

**Fetches data from Statistics Canada:**
```bash
# Complex tables (CPI, LFS, GDP, Retail Trade)
Rscript r-tools/fetch_cansim_enhanced.R 18-10-0004 output

# Simple single-series indicators
Rscript r-tools/fetch_cansim_enhanced.R 14-10-0005 output --simple \
  --filter "GEO=Canada" \
  --filter "Type of claim=Initial and renewal claims" \
  --name "ei_claims"
```

**Validates data quality at fetch time:**
- **Freshness check**: Warns if data is more than 3 months old
- **Continuity check**: Detects gaps greater than 45 days in monthly series
- **Outlier detection**: Flags changes more than 3 standard deviations from the mean
- **Required fields**: Ensures VALUE, REF_DATE, and change calculations are present
- **Value ranges**: Domain-specific checks (e.g., CPI should be 50-300, MoM changes typically < ±10%)

**Captures provenance metadata:**
Every JSON file includes a provenance block recording exactly where the data came from:

```json
{
  "provenance": {
    "table_number": "14-10-0005",
    "fetched_at": "2026-01-10 14:30:00 PST",
    "statcan_url": "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410000501",
    "filters_applied": {
      "GEO": "Canada",
      "Type of claim": "Initial and renewal claims, seasonally adjusted"
    },
    "r_version": "4.5.0",
    "cansim_package_version": "0.4.4"
  }
}
```

This creates an audit trail: for any number in any article, we can trace back to the exact table, filters, and timestamp of the fetch.

### Layer 2: JSON Verification Files

Every article is backed by a JSON verification file containing the authoritative data. We maintain two formats:

**Enhanced format** for complex tables with multiple dimensions:
```json
{
  "metadata": {
    "table_number": "18-10-0004",
    "reference_period": "2025-11",
    "fetched_at": "2025-12-25 12:07:52"
  },
  "latest": {
    "value": 165.4,
    "yoy_pct_change": 2.22
  },
  "time_series": [...],
  "subseries": {...},
  "provincial": {...},
  "validation": {...}
}
```

**Simple format** for single-series indicators:
```json
{
  "series": "Manufacturing sales",
  "ref_date": "2025-10",
  "value": 71505434,
  "mom_pct": -1.0,
  "yoy_pct": 0.7,
  "time_series": [...],
  "provenance": {...}
}
```

These files serve as the single source of truth. Every number in an article must exist in its verification JSON.

### Layer 3: Article Frontmatter Declaration

Every article must declare which JSON file contains its source data:

```yaml
---
title: Consumer prices up 2.2% year over year in November 2025
verification_json: output/data_18_10_0004_enhanced.json
toc: false
---
```

This creates a self-documenting audit trail. Looking at any article, you can immediately see which JSON file backs it, and that JSON file contains the full provenance chain back to Statistics Canada.

### Layer 4: Build-Time Enforcement

The build process runs validation before generating the site:

```json
{
  "scripts": {
    "build": "node scripts/validate-verification.js && observable build && node scripts/fix-paths.js"
  }
}
```

The `validate-verification.js` script:
1. Scans all articles in `docs/en/`
2. Checks each article has `verification_json` in frontmatter
3. Verifies the referenced JSON file exists
4. **Exits with code 1 if any check fails** - the build stops

This is the critical enforcement layer. It's not a guideline or a best practice - **the site literally cannot be built if verification JSON is missing**.

```
Validating verification JSON for all articles...

Checked 122 articles
Valid: 122

✓ All articles have valid verification JSON
```

### Layer 5: Audit Tools

Two audit tools provide coverage reporting:

**R-based auditor** (`check_verification_coverage.R`):
```
=== VERIFICATION COVERAGE REPORT ===

VERIFIED (JSON exists): 122
MISSING FRONTMATTER FIELD: 0
JSON FILE NOT FOUND: 0

Verification coverage: 100%
✓ All articles have valid verification JSON.
```

**Node.js validator** (`npm run validate`):
```
Validating verification JSON for all articles...
Checked 122 articles
Valid: 122
✓ All articles have valid verification JSON
```

---

## The Fabrication Prevention Checklist

Beyond the technical architecture, we enforce an operational checklist before any article is finalized. Each check addresses a specific failure mode we encountered.

### 1. Provenance Check
*Every number must have a source*

- [ ] Headline figure: cite JSON path (e.g., `latest.yoy_pct_change = 2.2`)
- [ ] Each chart data point: from `time_series[N].value`
- [ ] Each table cell: from `subseries[N]` or `provincial[N]`
- [ ] **If you cannot cite the source, do not include the number**

### 2. Arithmetic Verification
*Math must be exact*

- [ ] Recalculate YoY from time_series: `(current - year_ago) / year_ago × 100`
- [ ] Recalculate MoM from time_series: `(current - previous) / previous × 100`
- [ ] If trade data: verify `balance = exports - imports` exactly
- [ ] **If calculated value differs from claimed by >0.1pp, STOP and investigate**

### 3. Period Match Check
*Never generate data that doesn't exist*

- [ ] Article reference period ≤ JSON `metadata.reference_period`
- [ ] **If article period > JSON period, data doesn't exist - STOP**

### 4. Variation Check
*For batch generation of multiple months*

- [ ] Component values DIFFER across months generated
- [ ] Provincial values DIFFER across months generated
- [ ] **If values are identical across months, you're copying stale data - STOP**

### 5. Data Existence Check
*Don't fabricate breakdowns*

- [ ] Does `subseries[]` array exist and have entries? If empty, omit breakdown.
- [ ] Does `provincial[]` array exist and have entries? If empty, omit provincial table.
- [ ] Can you cite exact JSON path for EACH breakdown value?

---

## Failure Modes: What Went Wrong

The verification system evolved through real failures. Each failure mode led to a specific prevention measure. Understanding what went wrong is as important as understanding what we built.

### Failure Mode 1: Auxiliary Data Fabrication
*December 28, 2025*

**What happened:**
Backfill articles for Labour Force Survey had fabricated employment rate, participation rate, and full-time/part-time split values. The fabricated values weren't just slightly wrong - some were in the **opposite direction** from reality.

**How it was detected:**
- Time series data (unemployment rate, employment levels) were correct because they came from verified JSON sources
- But auxiliary indicators in summary tables were invented to fill gaps
- The fabrication pattern was suspiciously consistent: FT/PT splits always "mirrored" overall employment direction
- Real economic data is more nuanced - sometimes part-time rises while full-time falls

**Root cause:**
The generator derived or estimated values to complete summary tables, rather than fetching each value from Statistics Canada. Without enforcement, it was too easy to invent "plausible" numbers.

**Prevention implemented:**
- **Mandatory rule**: For every numeric value in an article - FETCH from StatCan, not derived, not estimated
- **Pre-publish checklist**: For each number in summary tables - Can I cite the specific vector/table?
- **Safe vs. unsafe backfill patterns**: Extending line charts backward (each point validated) is SAFE. Filling in auxiliary table values is UNSAFE.
- **Reference vectors documented** for LFS auxiliary indicators

---

### Failure Mode 2: Stale Breakdown Data in Historical Articles
*January 9, 2026*

**What happened:**
Five CPI articles for July-October 2025 were generated using historical reference dates. The headlines and time series correctly showed historical periods, BUT component breakdowns and provincial tables showed November 2025 data.

**The evidence:**
- Component percentages were **identical** across all five months: Food: 4.2%, Household: 3.3%, Transportation: 0.7%, etc.
- Provincial YoY values were **identical** across all five months
- Real economic data has natural month-to-month variation - identical values across 5 consecutive months is a red flag

**Root cause:**
The generator's `rebase_data_to_period()` function only rebased headlines, not breakdowns. The JSON file contained only the latest period's `subseries[]` and `provincial[]` data. The function silently copied stale data without validation.

**Prevention implemented:**
- Generator now **strips `subseries`/`provincial`** when rebasing to historical periods
- Always verify `JSON.metadata.reference_period` matches article period
- For historical articles: only include headline + trend, not breakdowns
- **Variation check**: If values are identical across months, you're copying stale data

**The fix:**
Commit `444de03` removed 591 lines of fabricated breakdown data across 10 articles.

---

### Failure Mode 3: Year-over-Year Calculation Errors
*January 9, 2026*

**What happened:**
GDP October 2025 article claimed +0.4% year-over-year growth, but the actual calculation from time_series data was +0.04% - a 10x error.

**The data:**
```
time_series: Oct 2024 = 2317.1B, Oct 2025 = 2318.0B
Correct YoY: (2318.0 - 2317.1) / 2317.1 × 100 = 0.039% ≈ 0.04%
Article incorrectly stated: 0.4%
```

**Root cause:**
Decimal place error when transcribing small percentage changes. The difference between 0.04% and 0.4% is enormous in economic terms - the former suggests stagnation, the latter suggests modest growth.

**Prevention implemented:**
- **Always cross-validate YoY** by manual calculation from time_series
- Be especially careful with small percentage changes (<1%)
- Double-check decimal places: 0.04% ≠ 0.4% ≠ 4%
- Copy-paste values from JSON, don't type from memory

---

### Failure Mode 4: Article Generated for Unreleased Period
*January 9, 2026 - Fixed with official data*

**What happened:**
International trade article claimed to cover October 2025, but the JSON file only contained September 2025 data. October data wasn't released by Statistics Canada until January 8, 2026.

**The evidence:**
```
JSON reference_period: "2025-09"
JSON end_period: "2025-09"
JSON fetched_at: "2025-12-23"
Article claimed: October 2025
Official October release: 2026-01-08
```

**The result:**
Without real data, the LLM fabricated internally-consistent but completely wrong October figures:

| Metric | Fabricated Value | Actual Value (Jan 8 release) |
|--------|------------------|------------------------------|
| Exports | $64.2B (flat) | $65.6B (+2.1%) |
| Imports | $66.8B (+4.2%) | $66.2B (+3.4%) |
| Trade deficit | $2.6B | $583M |

**Critical insight:** Internally consistent ≠ externally accurate. The fabricated data formed a coherent narrative, but was completely wrong.

**Root cause:**
The article was requested for a period beyond what existed in the JSON. Without real data, the LLM invented plausible-looking values.

**Prevention implemented:**
- **NEVER generate articles for periods beyond `metadata.reference_period`**
- Before generating, verify: `article_period <= JSON.metadata.reference_period`
- If user requests future period, STOP and report: "Data not yet available"
- Check StatCan release schedule before attempting to generate

---

### Failure Mode 5: Percentage Fabrication from Dollar Values
*January 9, 2026*

**What happened:**
Building permits article showed industrial component +12.5%, but the source only provided a dollar change: "edged down $3.9 million."

**The evidence:**
```
Source text: "industrial component edged down $3.9 million"
Article claimed: Industrial +12.5%
Problem: No base value was available to calculate percentage
```

**Root cause:**
The LLM invented a percentage when only absolute change was provided. Percentage requires: `(new - old) / old × 100`. Without the denominator (base value), percentage cannot be calculated - it can only be fabricated.

**Prevention implemented:**
- Only show percentages when BOTH values (before and after) are available
- If source only provides dollar change, report dollar change (not invented %)
- Ask: "Can I calculate this percentage from values I have?" If no, don't show %
- Better to omit a metric than to fabricate it

**The fix:**
Commit `640141c` replaced unverified percentage table with verified dollar amounts from official StatCan release.

---

### Failure Mode 6: Hardcoded Plausible Values
*January 2026*

**What happened:**
Articles were generated with numbers that looked reasonable but weren't from the fetched JSON data.

**Examples:**
- Interest rates article used 2.50% (the "Bank Rate") instead of 2.25% (the "Policy Rate" from JSON)
- Manufacturing capacity used 80.8% instead of actual 80.7% from JSON

The errors were small - close enough to seem right at a glance - but they were wrong.

**Root cause:**
1. JSON file wasn't read before generating article text
2. LLM used approximate values from training data instead of exact JSON values
3. Similar-sounding terms confused (Bank Rate ≠ Policy Rate)

**Prevention implemented:**
- **ALWAYS read JSON file before writing ANY numbers**
- **ALWAYS state headline value explicitly**: "The JSON shows X.X%"
- Copy-paste values from JSON, don't type from memory
- For financial data: verify exact terminology matches the JSON field name

---

### Failure Mode 7: Missing Verification JSON
*January 10, 2026*

**What happened:**
A verification audit found 32 articles without corresponding JSON verification files. During the audit, these articles couldn't be immediately validated because there was no saved data to compare against.

**Affected categories:**
Manufacturing, Food Services, IPPI, RMPI, Electricity, EI Claims, and others.

**The evidence:**
- Articles existed in `docs/en/`
- No JSON files in `output/` for these indicators
- Required manual re-fetch from CANSIM to verify article claims
- The data was correct (verified via re-fetch), but the audit trail was missing

**Root cause:**
Articles were generated using ad-hoc R fetches that didn't save JSON files. The workflow wasn't enforced.

**Prevention implemented:**
This failure led to the comprehensive verification JSON system described in this document:

1. **Every article MUST declare `verification_json` in frontmatter**
2. **Build fails** if `verification_json` is missing or file doesn't exist
3. **Single data fetching tool** (`fetch_cansim_enhanced.R`) that always saves JSON
4. **240 articles updated** with verification_json frontmatter

---

## The Golden Rules

Distilled from these failures, we now follow seven golden rules:

1. **Every number must trace to a real StatCan value.**
   No exceptions. No approximations. No placeholders.

2. **Read JSON before writing.**
   State the headline value explicitly before writing article text.

3. **Copy-paste, don't transcribe.**
   Memory errors cause decimal place mistakes.

4. **Article period ≤ JSON period.**
   Never generate for data that doesn't exist yet.

5. **Identical values across months = fabricated.**
   Real economic data has natural variation.

6. **If you can't calculate it, don't show it.**
   No percentages without both before and after values.

7. **Build must fail.**
   Enforcement through tooling, not documentation.

---

## Why We Believe It Works

### Defense in Depth

Multiple independent checks catch different failure modes:
- R validation catches data quality issues at the source
- JSON structure preserves provenance metadata
- Frontmatter declaration makes audit trail explicit
- Node validation catches missing files at build time
- Build enforcement prevents publication without verification

If one layer fails, another catches the problem.

### Enforcement, Not Guidelines

The critical insight: **documentation alone doesn't prevent errors**. An LLM (or a human) can read guidelines and still make mistakes.

The build literally fails without verification JSON. There's no way to publish an article that hasn't passed validation. The enforcement is mechanical, not aspirational.

### Complete Audit Trail

For any number in any article:
1. Article frontmatter points to verification JSON
2. JSON contains the exact values used in the article
3. JSON provenance block shows table number, fetch timestamp, filters
4. R code in article shows how to reproduce the data extraction

Anyone can verify any number by following this chain back to Statistics Canada.

### Lessons from Failure

The system didn't emerge from theoretical design. Each failure mode led to a specific prevention measure. The failures were painful - but they taught us exactly what could go wrong.

---

## Current State

As of January 10, 2026:

- **122 English articles** with verification_json
- **118 French articles** with verification_json
- **100% verification coverage**
- **Build-time validation enforced**
- **All 7 failure modes** addressed with specific controls

The site cannot be built without passing verification.

---

## Technical Reference

### Commands

```bash
# Fetch data for complex tables
Rscript r-tools/fetch_cansim_enhanced.R 18-10-0004 output

# Fetch data for simple indicators
Rscript r-tools/fetch_cansim_enhanced.R 14-10-0005 output --simple \
  --filter "GEO=Canada" \
  --filter "Type of claim=Initial and renewal claims, seasonally adjusted" \
  --name "ei_claims"

# Check verification coverage (R)
Rscript r-tools/check_verification_coverage.R

# Check verification coverage (Node)
npm run validate

# Build site (includes validation)
npm run build
```

### Key Files

| File | Purpose |
|------|---------|
| `r-tools/fetch_cansim_enhanced.R` | Primary data fetcher with validation |
| `r-tools/check_verification_coverage.R` | R-based coverage auditor |
| `scripts/validate-verification.js` | Build-time validator |
| `output/*.json` | Verification JSON files |
| `.claude/skills/the-daily-generator/references/data-workflow.md` | Detailed workflow reference |

### JSON Structures

**Enhanced format** (for complex tables):
- `metadata`: table info, reference period, fetch timestamp
- `latest`: current values with changes
- `time_series`: historical data points
- `subseries`: component breakdowns
- `provincial`: geographic breakdowns
- `validation`: data quality checks

**Simple format** (for single indicators):
- `series`: indicator name
- `ref_date`: reference period
- `value`, `mom_pct`, `yoy_pct`: current metrics
- `time_series`: historical data
- `provenance`: complete audit trail

---

## Conclusion

Building an AI system that publishes statistical data requires solving the hallucination problem. Not partially - completely. A single fabricated number undermines the entire publication.

Our approach is defense in depth: multiple verification layers, each catching different failure modes. The key insight is that **enforcement must be mechanical, not aspirational**. Documentation alone doesn't prevent errors. Build failures do.

The system evolved through real failures. Each failure mode we encountered led to a specific prevention measure. The failures were embarrassing - but they taught us exactly what could go wrong, and exactly how to prevent it.

Today, every article traces back to verified Statistics Canada data through an unbroken audit trail. The build cannot complete without verification. The system is not perfect - but it's robust enough that we're confident publishing the results.

---

*This document describes the data verification system for The D-AI-LY as of January 2026.*
