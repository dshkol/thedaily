---
title: Electric power generation down 4.8% in August 2025
toc: false
---

# Electric power generation down 4.8% in August 2025

<p class="release-date">Released: November 25, 2025</p>

<div class="highlights">

**Highlights**

- Electric power generation fell 4.8% to 47.6 TWh in August 2025
- Generation declined from July's peak of 50.0 TWh
- Hydroelectric power accounted for the majority of generation
- Year-over-year, generation was down an estimated 3.0%

</div>

Electric power generation in Canada totalled 47.6 terawatt hours (TWh) in August 2025, down 4.8% from July's 50.0 TWh. The decline reflects the typical late-summer pattern as temperatures moderate and electricity demand for cooling decreases.

## Monthly generation trend

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 25-10-0015
const generationData = [
  {date: new Date("2024-08"), value: 49.1},
  {date: new Date("2024-09"), value: 45.5},
  {date: new Date("2024-10"), value: 47.3},
  {date: new Date("2024-11"), value: 50.3},
  {date: new Date("2024-12"), value: 61.6},
  {date: new Date("2025-01"), value: 66.8},
  {date: new Date("2025-02"), value: 59.2},
  {date: new Date("2025-03"), value: 56.6},
  {date: new Date("2025-04"), value: 48.8},
  {date: new Date("2025-05"), value: 46.5},
  {date: new Date("2025-06"), value: 46.0},
  {date: new Date("2025-07"), value: 50.0},
  {date: new Date("2025-08"), value: 47.6}
];

display(Plot.plot({
  title: "Electric power generation, August 2024 to August 2025",
  width: 680,
  height: 300,
  y: {domain: [40, 70], grid: true, label: "Terawatt hours (TWh)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(generationData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(generationData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(generationData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1) + " TWh", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Monthly change in 2025

Electric power generation peaked in January 2025 at 66.8 TWh during the winter heating season, then declined through the spring months before a modest summer uptick in July.

```js
const momData = [
  {month: "Jan", change: 8.4},
  {month: "Feb", change: -11.4},
  {month: "Mar", change: -4.4},
  {month: "Apr", change: -13.8},
  {month: "May", change: -4.7},
  {month: "Jun", change: -1.1},
  {month: "Jul", change: 8.7},
  {month: "Aug", change: -4.8}
];

display(Plot.plot({
  title: "Month-over-month change in electric power generation, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"]
  },
  y: {grid: true, label: "Percent change", domain: [-16, 12]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.8 : d.change - 0.8,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      fontSize: 10
    })
  ]
}));
```

## Summary table

| Indicator | August 2025 | Change from July | Change from August 2024 |
|-----------|------------:|------------------:|------------------------:|
| Total generation (TWh) | 47.6 | -4.8% | -3.0% |

<div class="note-to-readers">

## Note to readers

Electric power generation data includes electricity produced by electric utilities, industrial establishments that generate electricity for their own use, and other electricity producers. One terawatt hour equals 1,000 gigawatt hours or 1,000,000 megawatt hours.

This backfill article covers August 2025 data as part of The D-AI-LY historical coverage initiative.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch electricity generation data
elec <- get_cansim("25-10-0015")

# Total generation
total_gen <- elec %>%
  filter(GEO == "Canada",
         `Type of electricity generation` == "Total all types of electricity generation") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 25-10-0015](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2510001501)
**Survey:** Monthly Survey of Electric Power Generation, Receipts, Deliveries and Firm Peak Load
**Reference period:** August 2025
**DOI:** [https://doi.org/10.25318/2510001501-eng](https://doi.org/10.25318/2510001501-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "electricity-generation-august-2025", "en"));
```
