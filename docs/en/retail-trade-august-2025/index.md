---
title: Retail sales up 1.0% in August 2025
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---
# Retail sales up 1.0% in August 2025

<p class="release-date">Released: October 18, 2025</p>

<div class="highlights">

- Retail sales increased 1.0% to $70.2 billion in August 2025
- This followed a 0.9% decline in July
- Year over year, retail sales were up 4.7%

</div>

Retail sales rose 1.0% to $70.2 billion in August 2025, rebounding from a 0.9% decline in July. On a year-over-year basis, retail trade increased 4.7% compared with August 2024, when sales totalled $67.1 billion.

The August increase brought retail sales to their highest level in 2025, though volatility continued to characterize the retail sector through the year.

## Sales trend

Retail sales have fluctuated through 2025, with August marking a recovery from July's decline.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
  {date: new Date("2023-08-01"), value: 65.32},
  {date: new Date("2023-09-01"), value: 66.18},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51},
  {date: new Date("2024-10-01"), value: 68.04},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14},
  {date: new Date("2025-07-01"), value: 69.53},
  {date: new Date("2025-08-01"), value: 70.22}
];

display(Plot.plot({
  title: "Retail sales, Canada (billions of dollars, seasonally adjusted)",
  width: 700,
  height: 400,
  y: {
    domain: [64, 72],
    grid: true,
    label: "Billions ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(salesData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.text(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => "$" + d.value.toFixed(1) + "B",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Monthly changes in 2025

Retail sales have been volatile in 2025, with August marking the second-strongest monthly gain of the year.

```js
const monthlyChanges = [
  {month: "Jan", change: -0.5},
  {month: "Feb", change: -0.7},
  {month: "Mar", change: 0.9},
  {month: "Apr", change: 0.3},
  {month: "May", change: -1.2},
  {month: "Jun", change: 1.4},
  {month: "Jul", change: -0.9},
  {month: "Aug", change: 1.0}
];

display(Plot.plot({
  title: "Month-over-month change in retail sales, 2025 (%)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
  },
  y: {
    grid: true,
    label: "Percent change",
    domain: [-2, 2]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyChanges, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyChanges, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.15 : d.change - 0.15,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|-----------------:|------------------------:|
| Retail sales ($ billions) | 70.2 | +1.0% | +4.7% |

<div class="note-to-readers">

**Note to readers**

Retail trade estimates are expressed in current dollars and are seasonally adjusted. The Monthly Retail Trade Survey covers retail businesses across Canada.

This is a backfill article covering data from August 2025, published as part of the D-AI-LY's historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)
library(tidyr)

# Fetch retail trade data (seasonally adjusted)
retail <- get_cansim("20-10-0056")

# Total retail trade time series
total_retail <- retail %>%
  filter(GEO == "Canada",
         `North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         `Adjustments` == "Seasonally adjusted") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Month-over-month change
current <- total_retail %>% filter(REF_DATE == "2025-08") %>% pull(VALUE)
previous <- total_retail %>% filter(REF_DATE == "2025-07") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Year-over-year change
year_ago <- total_retail %>% filter(REF_DATE == "2024-08") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Sector breakdown
sectors <- retail %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-08",
         `Adjustments` == "Seasonally adjusted") %>%
  select(`North American Industry Classification System (NAICS)`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- retail %>%
  filter(`North American Industry Classification System (NAICS)` == "Retail trade [44-45]",
         REF_DATE %in% c("2025-08", "2024-08"),
         `Adjustments` == "Seasonally adjusted",
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-08` - `2024-08`) / `2024-08` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2010005601)
**Survey:** Monthly Retail Trade Survey
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/2010005601-eng](https://doi.org/10.25318/2010005601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-august-2025", "en"));
```
