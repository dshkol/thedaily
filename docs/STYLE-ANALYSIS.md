# The Daily Style Analysis Report

Comparison of Statistics Canada's "The Daily" with our D-AI-LY implementation.

**Date:** December 24, 2025
**Articles reviewed:** Food Services (Dec 24), CPI November 2025 (Dec 15), Labour Force Survey November 2025 (Dec 5)

---

## Executive Summary

The official Daily articles are **significantly more sophisticated** than our current D-AI-LY implementation in three key areas:

1. **Narrative depth** - StatCan explains causation, not just reports numbers
2. **Headline approach** - StatCan uses neutral titles; we lead with stats
3. **Regional coverage** - StatCan has dedicated provincial analysis sections

---

## 1. Headline Patterns

### StatCan Approach
Titles use the **indicator name + reference period** format without embedding statistics:

| Article | StatCan Title |
|---------|---------------|
| CPI | "Consumer Price Index, November 2025" |
| LFS | "Labour Force Survey, November 2025" |
| Food Services | "Food services and drinking places, October 2025" |

### D-AI-LY Approach
We lead with the **key statistic** in the headline:

| Article | D-AI-LY Title |
|---------|---------------|
| CPI | "Consumer prices up 2.2% year over year in November 2025" |
| Gasoline | "Les prix de l'essence en hausse de 1,7 % en novembre 2025" |
| NHPI | "New housing prices unchanged in November 2025" |

### Assessment
Both approaches are valid. StatCan's is more neutral; ours is more attention-grabbing. **No change recommended** - our approach works for a public-facing summary format.

---

## 2. Structure Comparison

### StatCan Structure
```
Title (indicator + date)
├── Tabs: Text | Tables | Related info | Previous release | PDF
├── Release date
├── Opening paragraphs (key findings with context)
├── Section: [Narrative heading describing finding]
│   └── Multiple paragraphs with causation
├── Section: [Another narrative heading]
├── Section: Regional highlights
├── Special callout boxes (e.g., "Focus on Canada and the United States")
├── Sidebar carousel (key metrics, 3-5 charts)
├── Expandable data table
├── Note to readers (blue background)
└── Contact information
```

### D-AI-LY Structure
```
Title (stat + indicator + date)
├── Release date
├── Highlights box (bullet points)
├── Opening paragraph
├── Chart 1 (inline)
├── Section heading
├── Chart 2 (inline)
├── Section: Provincial variation (table)
├── Note to readers
└── Source info
```

### Key Differences

| Feature | StatCan | D-AI-LY |
|---------|---------|---------|
| Charts | Sidebar carousel (5+) | Inline (2-3) |
| Tables | Expandable | Static markdown |
| Highlights | Sometimes explicit section | Always bullet box |
| Regional data | Dedicated narrative section | Simple table |
| Special boxes | Policy focus callouts | None |
| External links | Bank of Canada, dashboards | Table viewer only |

---

## 3. Tone & Language

### StatCan: Analytical & Explanatory

StatCan articles **explain why** prices or indicators moved, not just that they moved:

> "Higher beef prices have been driven, in part, by lower cattle inventories in North America. Coffee prices have been impacted by adverse weather conditions in growing regions and rose amid American tariffs on coffee-producing countries."

> "The largest contributor to the lower prices was Ontario (-20.2%), partially due to a base-year effect from a swift monthly increase in November 2024 (+11.0%), which coincided with a series of high-profile concerts in Toronto."

**Language patterns:**
- "put downward pressure on"
- "Offsetting the slower growth..."
- "Partially due to a base-year effect"
- "driven by gains in part-time work"

### D-AI-LY: Descriptive & Formulaic

Our articles report what happened without much explanation:

> "The Consumer Price Index (CPI) stood at 165.4 in November 2025, up 2.2% compared with the same month a year earlier."

> "Food prices rose 4.2%."

**Language patterns:**
- "increased X%"
- "rose/fell X%"
- "recorded the highest/lowest"

### Gap Analysis

| Aspect | StatCan | D-AI-LY | Gap |
|--------|---------|---------|-----|
| Causation | Explains drivers | Reports changes | **High** |
| Context | Real-world events | Historical comparison | **Medium** |
| Transitions | Sophisticated | Basic | **Medium** |
| Specificity | Product-level detail | Category-level | **Medium** |

---

## 4. Regional Coverage

### StatCan Approach
Dedicated "Regional highlights" section with narrative:

> "On an annual basis in November, prices rose at a faster pace in five provinces, were unchanged in two, and rose at a slower pace in the remaining three compared with October."

> "Of all the provinces, prices accelerated the most in New Brunswick, rising 2.7% year over year in November, following an increase of 2.1% in October."

### D-AI-LY Approach
Simple table with minimal narrative:

> "Price increases varied across provinces and territories. Manitoba recorded the highest year-over-year increase at 3.3%."

| Province | Year-over-year change |
|----------|----------------------|
| Manitoba | +3.3% |
| Quebec | +3.0% |
| ... | ... |

### Recommendation
**Enhance regional coverage** with more narrative analysis. Our discovery tool already identifies regional variance - we should use this to generate richer provincial stories.

---

## 5. Special Features We're Missing

### 1. Causation Explanations
StatCan explains **why** things changed. We should add brief explanations where data supports it.

### 2. Policy Context Boxes
StatCan includes special callouts like "Focus on Canada and the United States" about tariffs. We could add similar topical context.

### 3. Multi-metric Sidebars
StatCan shows 4-5 key metrics in a carousel. We show 1 chart at a time.

### 4. Dashboard Links
StatCan links to interactive dashboards: "Further information is available in the Food Services and Drinking Places Sales dashboard."

### 5. Specific Product Mentions
CPI article mentions specific products: berries, beef (+17.7%), coffee (+27.8%). Our articles stay at category level.

---

## 6. Recommendations

### Keep (Working Well)
- Lead-with-stat headlines (more engaging than StatCan's neutral titles)
- Highlights bullet box (clear and scannable)
- Observable Plot charts (modern, interactive)
- Bilingual coverage (EN/FR parity)
- Reproducibility code blocks (unique value-add)

### Enhance (Priority Changes)

#### High Priority
1. **Add causation** - Include brief "why" explanations where data supports inference
2. **Richer regional sections** - Use discovery tool findings to write provincial narratives
3. **More specific detail** - Break down categories into specific products/drivers

#### Medium Priority
4. **Contextual boxes** - Add "Focus on" sections for major policy/economic context
5. **Multiple chart types** - Add component breakdown charts, not just time series
6. **External links** - Link to StatCan dashboards and related releases

#### Low Priority
7. **Sidebar carousel** - Consider multi-metric sidebar (requires template changes)
8. **Expandable tables** - Interactive table toggling

---

## 7. Voice Guide Updates

Based on this analysis, update VOICE-GUIDE.md to include:

### New Patterns to Adopt

**Causation phrases:**
- "driven by..."
- "partially due to..."
- "contributed to..."
- "put upward/downward pressure on..."

**Transition phrases:**
- "Offsetting the [increase/decrease] in X were..."
- "Contributing to the [rise/fall] were..."
- "While X remained elevated, growth slowed in..."

**Regional narrative patterns:**
- "Of all the provinces, [Province] recorded the [largest/smallest]..."
- "Prices rose at a faster pace in X provinces, were unchanged in Y, and rose at a slower pace in Z"

---

## Sources

- [The Daily - Consumer Price Index, November 2025](https://www150.statcan.gc.ca/n1/daily-quotidien/251215/dq251215a-eng.htm)
- [The Daily - Labour Force Survey, November 2025](https://www150.statcan.gc.ca/n1/daily-quotidien/251205/dq251205a-eng.htm)
- [The Daily - Food services and drinking places, October 2025](https://www150.statcan.gc.ca/n1/daily-quotidien/251224/dq251224a-eng.htm)
