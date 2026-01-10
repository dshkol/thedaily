---
title: Frozen poultry stocks down 9.5% year over year in December 2025
verification_json: output/data_23_10_0253_enhanced.json
---
# Frozen poultry stocks down 9.5% year over year in December 2025

<p class="release-date">Released: 2026-01-07</p>

<div class="metric-box">
  <div class="value">82,810</div>
  <div class="label">tonnes, December 2025</div>
</div>

Total frozen poultry meat stocks in Canada fell to 82,810 tonnes in December 2025, down 9.5% from 91,542 tonnes in December 2024. Month over month, stocks decreased 8.1% from the 90,102 tonnes recorded in November 2025, largely due to the draw-down of turkey inventory following the holiday season.

<div class="highlights">

**Highlights**

- Total frozen poultry stocks fell to 82,810 tonnes in December 2025
- Year-over-year decline of 9.5% from December 2024
- Turkey stocks dropped 44.8% month over month to 13,237 tonnes as holiday demand depleted inventories
- Chicken remains the dominant category at 62,393 tonnes (75% of total)

</div>

## Monthly trend

Frozen poultry stocks typically fluctuate seasonally, building up ahead of the holiday season and declining afterward. The December 2025 level represents the lowest point since April 2025.

```js
import * as Plot from "npm:@observablehq/plot";

const stocksData = [
  {date: new Date("2024-01"), value: 96379},
  {date: new Date("2024-02"), value: 94578},
  {date: new Date("2024-03"), value: 95295},
  {date: new Date("2024-04"), value: 95492},
  {date: new Date("2024-05"), value: 99589},
  {date: new Date("2024-06"), value: 101557},
  {date: new Date("2024-07"), value: 100460},
  {date: new Date("2024-08"), value: 100363},
  {date: new Date("2024-09"), value: 101740},
  {date: new Date("2024-10"), value: 99755},
  {date: new Date("2024-11"), value: 97496},
  {date: new Date("2024-12"), value: 91542},
  {date: new Date("2025-01"), value: 83706},
  {date: new Date("2025-02"), value: 87839},
  {date: new Date("2025-03"), value: 83253},
  {date: new Date("2025-04"), value: 82120},
  {date: new Date("2025-05"), value: 80894},
  {date: new Date("2025-06"), value: 85748},
  {date: new Date("2025-07"), value: 87611},
  {date: new Date("2025-08"), value: 91505},
  {date: new Date("2025-09"), value: 97568},
  {date: new Date("2025-10"), value: 87285},
  {date: new Date("2025-11"), value: 90102},
  {date: new Date("2025-12"), value: 82810}
];

display(Plot.plot({
  title: "Frozen poultry meat stocks (tonnes)",
  width: 640,
  height: 280,
  y: {domain: [75000, 110000], grid: true, label: "Tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([80000, 90000, 100000], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(stocksData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(stocksData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(stocksData, {x: "date", y: "value", fill: "#AF3C43", r: 3})
  ]
}));
```

## Stocks by poultry type

Chicken products account for the majority of frozen poultry stocks. Turkey stocks showed a sharp decline in December, falling 44.8% from November as retailers and distributors depleted inventories built up for the holiday season.

```js
const byType = [
  {type: "Chicken (processed)", value: 61132},
  {type: "Chicken cuts", value: 25903},
  {type: "Turkey", value: 13237},
  {type: "Other poultry", value: 6538}
];

display(Plot.plot({
  title: "Frozen poultry stocks by type, December 2025 (tonnes)",
  width: 640,
  height: 200,
  marginLeft: 140,
  x: {grid: true, label: "Tonnes"},
  y: {label: null},
  marks: [
    Plot.barX(byType, {
      y: "type",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(byType, {
      y: "type",
      x: "value",
      text: d => d.value.toLocaleString(),
      dx: 25,
      fill: "currentColor"
    })
  ]
}));
```

## Turkey stocks seasonal pattern

Turkey stocks follow a pronounced seasonal pattern, building up in the fall for Thanksgiving and Christmas demand, then declining sharply in December and January.

```js
const turkeyData = [
  {date: new Date("2024-01"), value: 21456},
  {date: new Date("2024-02"), value: 19892},
  {date: new Date("2024-03"), value: 19547},
  {date: new Date("2024-04"), value: 17994},
  {date: new Date("2024-05"), value: 18738},
  {date: new Date("2024-06"), value: 19802},
  {date: new Date("2024-07"), value: 20584},
  {date: new Date("2024-08"), value: 22106},
  {date: new Date("2024-09"), value: 26583},
  {date: new Date("2024-10"), value: 26754},
  {date: new Date("2024-11"), value: 24186},
  {date: new Date("2024-12"), value: 19234},
  {date: new Date("2025-01"), value: 18880},
  {date: new Date("2025-02"), value: 20730},
  {date: new Date("2025-03"), value: 19515},
  {date: new Date("2025-04"), value: 18747},
  {date: new Date("2025-05"), value: 18603},
  {date: new Date("2025-06"), value: 20380},
  {date: new Date("2025-07"), value: 21705},
  {date: new Date("2025-08"), value: 24549},
  {date: new Date("2025-09"), value: 28436},
  {date: new Date("2025-10"), value: 21442},
  {date: new Date("2025-11"), value: 23992},
  {date: new Date("2025-12"), value: 13237}
];

display(Plot.plot({
  title: "Frozen turkey stocks (tonnes)",
  width: 640,
  height: 260,
  y: {domain: [10000, 30000], grid: true, label: "Tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([15000, 20000, 25000], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.areaY(turkeyData, {x: "date", y: "value", fill: "#2e7d32", fillOpacity: 0.1}),
    Plot.lineY(turkeyData, {x: "date", y: "value", stroke: "#2e7d32", strokeWidth: 2}),
    Plot.dot(turkeyData, {x: "date", y: "value", fill: "#2e7d32", r: 3})
  ]
}));
```

## December 2025 by category

| Category | Tonnes | Share |
|----------|--------|-------|
| Chicken (processed) | 61,132 | 73.8% |
| Chicken cuts | 25,903 | 31.3% |
| Turkey | 13,237 | 16.0% |
| Ducks | 2,084 | 2.5% |
| Other poultry | 4,280 | 5.2% |

*Note: Some chicken products are counted in multiple categories; percentages exceed 100%*

<div class="note-to-readers">

## Note to readers

Frozen poultry meat stocks refer to the quantity of frozen chicken, turkey, duck, goose, and other poultry products held in cold storage facilities across Canada. These data are collected monthly from establishments engaged in processing, storing, or distributing frozen poultry products.

Stocks typically increase in the months leading up to major holidays (Thanksgiving in October and Christmas in December) as producers and distributors build inventory to meet anticipated demand. Post-holiday declines reflect the consumption of these built-up inventories.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Download frozen poultry stocks data
poultry <- get_cansim("32-10-0122")

# Filter for Canada totals
canada_stocks <- poultry %>%
  filter(GEO == "Canada")

# All poultry total - historical
total_hist <- canada_stocks %>%
  filter(Commodity == "All poultry meat, total") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# December 2025 breakdown
dec_breakdown <- canada_stocks %>%
  filter(REF_DATE == "2025-12") %>%
  select(Commodity, VALUE) %>%
  arrange(desc(VALUE))

# Year-over-year change
dec_2025 <- total_hist %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
dec_2024 <- total_hist %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
yoy_change <- (dec_2025 - dec_2024) / dec_2024 * 100

# Turkey stocks
turkey <- canada_stocks %>%
  filter(Commodity == "Turkeys, total") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 32-10-0122](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210012201)
**Survey:** Stocks of Frozen Poultry Meat Survey
**Reference period:** December 2025

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "frozen-poultry-stocks-december-2025", "en"));
```
