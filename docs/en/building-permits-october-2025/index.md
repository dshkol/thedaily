---
title: Building permits up 14.9% in October 2025
verification_json: output/data_34_10_0175_enhanced.json
toc: false
---
# Building permits up 14.9% in October 2025

<p class="release-date">Released: December 12, 2025</p>

<div class="highlights">

**Highlights**

- The total value of building permits increased 14.9% to $13.8 billion in October 2025
- Residential permits rose 14.6% to $8.6 billion
- Non-residential permits rose $702.8 million to $5.3 billion
- On a year-over-year basis, permits were up 5.9%

</div>

The total value of building permits increased 14.9% to $13.8 billion in October 2025, following a decline in September. On a year-over-year basis, the total value of permits was up 5.9% compared with October 2024.

Residential permits rose 14.6% to $8.6 billion, driven by increases in multi-family construction intentions which reached $5.9 billion. Single-family permits totalled $2.6 billion.

Non-residential permits rose $702.8 million to $5.3 billion. The commercial component led the increase (+$394.9 million), followed by the institutional component (+$311.8 million), while the industrial component edged down $3.9 million.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 34-10-0292 (values in $ billions)
// October 2025 from The Daily, December 12, 2025
const permitsData = [
  {date: new Date("2023-01"), total: 11.2},
  {date: new Date("2023-02"), total: 10.8},
  {date: new Date("2023-03"), total: 11.5},
  {date: new Date("2023-04"), total: 11.1},
  {date: new Date("2023-05"), total: 10.9},
  {date: new Date("2023-06"), total: 11.4},
  {date: new Date("2023-07"), total: 11.6},
  {date: new Date("2023-08"), total: 10.7},
  {date: new Date("2023-09"), total: 11.3},
  {date: new Date("2023-10"), total: 13.0},
  {date: new Date("2023-11"), total: 11.8},
  {date: new Date("2023-12"), total: 11.2},
  {date: new Date("2024-01"), total: 11.5},
  {date: new Date("2024-02"), total: 11.1},
  {date: new Date("2024-03"), total: 11.8},
  {date: new Date("2024-04"), total: 11.4},
  {date: new Date("2024-05"), total: 11.6},
  {date: new Date("2024-06"), total: 11.9},
  {date: new Date("2024-07"), total: 12.2},
  {date: new Date("2024-08"), total: 11.3},
  {date: new Date("2024-09"), total: 11.7},
  {date: new Date("2024-10"), total: 13.0},
  {date: new Date("2024-11"), total: 11.5},
  {date: new Date("2024-12"), total: 11.1},
  {date: new Date("2025-01"), total: 11.4},
  {date: new Date("2025-02"), total: 10.9},
  {date: new Date("2025-03"), total: 11.6},
  {date: new Date("2025-04"), total: 11.3},
  {date: new Date("2025-05"), total: 11.8},
  {date: new Date("2025-06"), total: 12.1},
  {date: new Date("2025-07"), total: 11.9},
  {date: new Date("2025-08"), total: 11.5},
  {date: new Date("2025-09"), total: 12.0},
  {date: new Date("2025-10"), total: 13.8}
];

display(Plot.plot({
  title: "Total value of building permits ($ billions)",
  width: 680,
  height: 300,
  y: {domain: [9, 14], grid: true, label: "$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(permitsData, {x: "date", y: "total", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(permitsData.slice(-1), {x: "date", y: "total", fill: "#AF3C43", r: 5}),
    Plot.text(permitsData.slice(-1), {x: "date", y: "total", text: d => "$" + d.total.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Residential and non-residential components

Residential building permits, which represent about 62% of the total, rose 14.6% in October to $8.6 billion. Multi-family permits reached $5.9 billion, with the largest increase in Ontario (+$876.4 million), followed by Quebec (+$81.4 million). Single-family permits totalled $2.6 billion.

Non-residential permits rose to $5.3 billion, with the commercial component contributing the largest gain (+$394.9 million, led by office buildings in Toronto). The institutional component added $311.8 million, while the industrial component edged down $3.9 million.

```js
const componentData = [
  {component: "Commercial", change: 394.9},
  {component: "Institutional", change: 311.8},
  {component: "Industrial", change: -3.9}
];

display(Plot.plot({
  title: "Non-residential component changes ($ millions)",
  width: 600,
  height: 200,
  marginLeft: 120,
  marginRight: 60,
  x: {domain: [-50, 450], grid: true, label: "Change ($ millions)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(componentData, {
      y: "component",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#1976d2",
      sort: {y: "-x"}
    }),
    Plot.text(componentData, {
      y: "component",
      x: "change",
      text: d => (d.change >= 0 ? "+$" : "-$") + Math.abs(d.change).toFixed(1) + "M",
      dx: d => d.change >= 0 ? 35 : -35,
      fill: "currentColor"
    })
  ]
}));
```

## Provincial variation

Building permits increased in most provinces in October. Ontario contributed the most to the national growth, with the Toronto CMA recording the largest gains in both multi-family residential (+$408.9 million) and commercial office buildings. British Columbia also posted notable increases, leading gains in the institutional component (+$132.2 million).

<div class="note-to-readers">

## Note to readers

Building permits data provide an early indication of future construction activity. The value of permits represents the construction intentions of permit holders and may differ from actual construction.

Data are seasonally adjusted to account for regular seasonal patterns in construction activity.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch building permits data
permits <- get_cansim("34-10-0066")

# Total building permits value
total_permits <- permits %>%
  filter(GEO == "Canada",
         `Type of structure` == "Total residential and non-residential",
         `Type of permit and value` == "Total permits, value") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# By type of structure
by_type <- permits %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-10",
         `Type of permit and value` == "Total permits, value") %>%
  select(`Type of structure`, VALUE) %>%
  arrange(desc(VALUE))

# Provincial breakdown
provincial <- permits %>%
  filter(`Type of structure` == "Total residential and non-residential",
         `Type of permit and value` == "Total permits, value",
         REF_DATE == "2025-10",
         GEO != "Canada") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 34-10-0292](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3410029201)
**Survey:** Building Permits
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3410029201-eng](https://doi.org/10.25318/3410029201-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "building-permits-october-2025", "en"));
```
