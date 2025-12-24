# The Daily Voice Guide

Statistics Canada's "The Daily" has a distinctive voice: neutral, clinical, and non-partisan. This guide captures those rules for AI-generated articles.

## Core Principles

1. **Neutral and clinical** - Report facts without editorial opinion
2. **Inverted pyramid** - Most important information first
3. **Numbers lead** - Headlines and ledes start with the key statistic
4. **Comparative framing** - Always provide context (YoY, MoM, historical)
5. **Non-partisan** - No political commentary or implications

## Headline Rules

- Maximum 15 words
- Lead with the key number
- Use "up" or "down" (not "rose" or "fell")
- Include the reference period

**Good:**
- "Consumer prices up 2.2% year over year in November 2025"
- "Retail sales down 0.2% in October 2025"
- "Employment unchanged in November 2025"

**Bad:**
- "Inflation surges as Canadians feel the pinch" (editorial)
- "Good news for shoppers as retail sales decline" (opinion)
- "November 2025 CPI release" (no number)

## Language Guidelines

### Use Neutral Verbs

| Avoid | Use Instead |
|-------|-------------|
| surged | increased |
| plummeted | decreased |
| soared | rose |
| collapsed | fell |
| skyrocketed | increased significantly |
| tumbled | declined |

### Avoid Emotional Language

| Avoid | Use Instead |
|-------|-------------|
| dramatic | notable |
| concerning | of note |
| encouraging | positive |
| alarming | significant |
| good/bad news | [omit entirely] |

### Contextual Causation (Hedged Language)

For major price movers (>10% change), provide context using **hedged language** that describes correlation without asserting direct causation.

**Hedged connectors (safe to use):**
- "amid" - "Coffee prices rose 27.8% amid supply disruptions in producing regions"
- "coinciding with" - "Beef prices increased coinciding with tight cattle supply"
- "following" - "Gasoline prices fell following declines in crude oil markets"
- "in the context of" - "Rent increases moderated in the context of new housing supply"
- "as markets responded to" - "Lumber prices rose as markets responded to supply constraints"

**Stronger causation (use only when sourced from StatCan or verified):**
- "driven by" - Only when StatCan's Daily explicitly states this
- "due to" - Only when citing official analysis
- "caused by" - Avoid unless quoting an authoritative source

**Known patterns (high confidence):**
These economic relationships are well-established and can be referenced:
- Gasoline ↔ crude oil prices
- Beef ↔ North American cattle inventories
- Coffee ↔ weather in producing regions, trade policy
- Mortgage interest ↔ Bank of Canada rate decisions
- Rent ↔ housing supply conditions
- Airfare ↔ fuel costs, travel demand

**When no context is available:**
Fall back to trend language without causation:
- "Beef prices (+17.7%) continued their upward trend"
- "Coffee prices rose for the sixth consecutive month"

See `r-tools/fetch_context.R` for the context-fetching utility.

## Article Structure

### 1. Headline
- Key statistic + direction + period
- Example: "Consumer prices up 2.2% year over year in November 2025"

### 2. Highlights (3-5 bullets)
- Lead with the main finding
- Include largest contributor/component
- Note month-over-month change
- Regional/provincial highlight if relevant

### 3. Lede Paragraph
- Restate headline finding with more context
- Include the index/value and percentage change
- Compare to same period last year

### 4. Sectoral/Component Analysis
- Break down by major components
- Identify largest increases and decreases
- Use data tables for detailed numbers

### 5. Regional Analysis (if applicable)

Open with a summary of provincial movement patterns:
- "On an annual basis in November, prices rose at a faster pace in five provinces, were unchanged in two, and rose at a slower pace in the remaining three compared with October."

Highlight the leader and laggard with context:
- "Of all the provinces, [Province] recorded the [largest/smallest] increase at X.X%, [brief driver if known]. At the other end, [Province] recorded the [lowest/highest] at X.X%."

Add comparative context:
- "[Province] (+X.X%) and [Province] (+X.X%) also exceeded the national rate, while [Province] (+X.X%) remained below it."
- "The X.X percentage point spread between [highest] and [lowest] reflects significant regional variation."

Include table with "vs. National" column showing percentage point differences.

### 6. Note to Readers
- Brief methodology explanation
- Data source and frequency
- Link to full data

## Numerical Formatting

- One decimal place for percentages: "2.2%" not "2.22%"
- Index values: "165.4" not "165.40"
- Dollar values: "$51.2 billion" not "$51,234,567,890"
- Dates: "November 2025" not "Nov 2025" or "2025-11"

## Comparison Framing

Always provide context with comparisons:

**Year-over-year (primary):**
"The Consumer Price Index rose 2.2% compared with the same month a year earlier."

**Month-over-month (secondary):**
"On a monthly basis, the index increased 0.1% from October."

**Historical range (when notable):**
"Over the past two years, the year-over-year rate has ranged from 1.6% to 3.4%."

## Things to Avoid

1. **Political commentary** - Never mention government policy, elections, or politicians
2. **Future predictions** - Report current data only, no forecasts
3. **Advice** - Don't tell readers what to do with the information
4. **Comparisons to other countries** - Focus on Canadian data only
5. **Superlatives** - Avoid "highest ever", "worst in decades" without verification
6. **Exclamation marks** - Never use them
7. **Questions** - Don't pose rhetorical questions

## Article Type Tags

Each article should be tagged with its generation type:

| Type | Tag (EN) | Tag (FR) | CSS Class | When to Use |
|------|----------|----------|-----------|-------------|
| **New Release** | `New Release` | `Nouvelle publication` | `.release` | Article generated in response to fresh StatCan data release |
| **Deep Dive** | `Deep Dive` | `Analyse approfondie` | `.dive` | Article analyzing existing data series, historical patterns, or thematic analysis |

### Implementation

In article frontmatter or release date line:
```html
<p class="release-date">Released: December 22, 2025 <span class="article-type-tag release">New Release</span></p>
```

On landing page cards:
```html
<span class="article-type-tag release">New Release</span>
```

### Visual Style
- **New Release**: Red background (#AF3C43) - signals time-sensitive, fresh data
- **Deep Dive**: Gray background (#6c757d) - signals evergreen analysis

## Examples

### Good Lede
"The Consumer Price Index (CPI) stood at 165.4 in November 2025, up 2.2% compared with the same month a year earlier. A year ago, the index was 161.8."

### Bad Lede
"Canadians continued to struggle with rising prices in November, as inflation remained stubbornly high despite hopes for relief." (editorial, emotional, political implication)

### Good Component Analysis
"Among major components, food prices recorded the largest year-over-year increase at 4.2%, followed by household operations, furnishings and equipment (3.3%)."

### Bad Component Analysis
"Food prices continued their alarming rise, squeezing household budgets and forcing families to make difficult choices." (emotional, speculative)
