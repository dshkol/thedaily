---
title: Consumer prices up 1.9% year over year in August 2025
verification_json: output/data_18_10_0004_enhanced.json
---
# Consumer prices up 1.9% year over year in August 2025

<p class="release-date">Released: 2025-12-25</p>

<div class="metric-box">
  <div class="value">+1.9%</div>
  <div class="label">Year-over-year change in Consumer Price Index, August 2025</div>
</div>

The Consumer Price Index (CPI) rose 1.9% in August 2025 compared with the same month a year earlier.

<div class="highlights">

**Highlights**

- The Consumer Price Index rose 1.9% year over year in August 2025
- Inflation edged up from 1.7% in July

</div>

## Year-over-year inflation trend

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2025-03"), rate: 2.3},
  {date: new Date("2025-04"), rate: 1.7},
  {date: new Date("2025-05"), rate: 1.7},
  {date: new Date("2025-06"), rate: 1.9},
  {date: new Date("2025-07"), rate: 1.7},
  {date: new Date("2025-08"), rate: 1.9}
];

display(Plot.plot({
  title: "Year-over-year inflation rate (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Percent"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData, {x: "date", y: "rate", fill: "#AF3C43", r: 4})
  ]
}));
```

<div class="note-to-readers">

## Note to readers

The Consumer Price Index measures the rate of price change experienced by Canadian consumers. It is calculated by comparing the cost of a fixed basket of goods and services purchased by consumers over time.

The CPI is not seasonally adjusted. Month-to-month movements can reflect seasonal patterns in addition to underlying price trends.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch CPI data
cpi <- get_cansim("18-10-0004")

# National all-items CPI time series
national_cpi <- cpi %>%
  filter(GEO == "Canada",
         `Products and product groups` == "All-items") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Year-over-year change calculation
current <- national_cpi %>% filter(REF_DATE == "2025-08") %>% pull(VALUE)
previous <- national_cpi %>% filter(REF_DATE == "2024-08") %>% pull(VALUE)
yoy_change <- (current - previous) / previous * 100

# Component breakdown
components <- cpi %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-08") %>%
  select(`Products and product groups`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial variation
provincial <- cpi %>%
  filter(`Products and product groups` == "All-items",
         REF_DATE %in% c("2025-08", "2024-08"),
         GEO != "Canada") %>%
  select(GEO, REF_DATE, VALUE) %>%
  pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy_change = (`2025-08` - `2024-08`) / `2024-08` * 100)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, Table 18-10-0004
**Survey:** Consumer Price Index
**Reference period:** August 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "cpi-august-2025", "en"));
```
