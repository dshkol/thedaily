---
title: Freight rail services prices little changed in December 2025
toc: false
---

# Freight rail services prices little changed in December 2025

<p class="release-date">Released: December 27, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- The Freight Rail Services Price Index stood at 131.2 in December 2025, little changed from November
- Metals and minerals recorded the highest index value at 140.2
- Grain and fertilizer had the lowest index value at 127.1, a 10.3% gap from metals
- Price indexes for automotive and coal commodities remain suppressed for confidentiality

</div>

The Freight Rail Services Price Index (FRSPI) stood at 131.2 in December 2025, little changed from 131.3 in November. The index measures changes in prices of shipments of commodities by the freight rail industry.

Among commodity groups, metals and minerals recorded the highest index value at 140.2, while grain and fertilizer had the lowest at 127.1. The 10.3% gap between the highest and lowest commodity indexes reflects variation in pricing pressures across different freight rail markets.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 18-10-0212
// Freight Rail Services Price Index by commodity, December 2025 (2019=100)
const commodityData = [
  {commodity: "Metals and minerals", value: 140.2},
  {commodity: "Forest products", value: 135.5},
  {commodity: "Intermodal", value: 133.0},
  {commodity: "Petroleum and chemicals", value: 131.8},
  {commodity: "Overall index", value: 131.2},
  {commodity: "Grain and fertilizer", value: 127.1}
];

display(Plot.plot({
  title: "Freight Rail Services Price Index by commodity, December 2025",
  width: 700,
  height: 300,
  marginLeft: 180,
  style: {fontSize: "12px"},
  x: {domain: [120, 145], grid: true, label: "Index (2019=100)"},
  y: {label: null},
  marks: [
    Plot.barX(commodityData, {
      y: "commodity",
      x1: 120,
      x2: "value",
      fill: d => d.commodity === "Overall index" ? "#1f77b4" : "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(commodityData, {
      y: "commodity",
      x: "value",
      text: d => d.value.toFixed(1),
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Commodity breakdown

Freight rail prices vary significantly by the type of commodity shipped. In December 2025, metals and minerals had the highest index value at 140.2, indicating prices for shipping these commodities have increased 40.2% since the 2019 base period.

Intermodal shipping, which includes containerized freight, had an index of 133.0. This category represents goods shipped in standardized containers that can be transferred between rail, truck, and ship.

Grain and fertilizer recorded the lowest index at 127.1, which may reflect different contract structures and competitive pressures in agricultural shipping markets.

```js
// Data from Statistics Canada Table 18-10-0212
// Monthly trend, October to December 2025
const trendData = [
  {date: new Date("2025-10"), value: 130.2},
  {date: new Date("2025-11"), value: 131.3},
  {date: new Date("2025-12"), value: 131.2}
];

display(Plot.plot({
  title: "Freight Rail Services Price Index, October to December 2025",
  width: 640,
  height: 280,
  y: {domain: [128, 134], grid: true, label: "Index (2019=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(trendData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(trendData, {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(trendData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Suppressed categories

Price indexes for automotive and coal commodities have been suppressed for confidentiality reasons. This suppression occurs when a small number of respondents account for a large share of a particular commodity group, which would potentially allow identification of individual business information.

| Commodity | Index (Dec 2025) | Change from Nov |
|-----------|------------------|-----------------|
| Metals and minerals | 140.2 | +0.2% |
| Forest products | 135.5 | -0.6% |
| Intermodal | 133.0 | +0.1% |
| Petroleum and chemicals | 131.8 | +0.3% |
| **Overall index** | **131.2** | **-0.1%** |
| Grain and fertilizer | 127.1 | -0.4% |
| Automotive | suppressed | — |
| Coal | suppressed | — |

<div class="note-to-readers">

## Note to readers

The Freight Rail Services Price Index (FRSPI) measures the changes in prices of shipments of commodities by the freight rail industry. The price indexes are quality adjusted for service changes.

The index uses 2019 as its base period (2019=100). An index value of 131.2 means prices are 31.2% higher than the average price in 2019.

Price indexes for automotive and coal commodities have been suppressed for confidentiality reasons due to the small number of respondents in these categories.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 18-10-0212](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810021201)
**Survey:** Freight Rail Services Price Index
**Reference period:** December 2025
**DOI:** [https://doi.org/10.25318/1810021201-eng](https://doi.org/10.25318/1810021201-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch freight rail price data
frspi <- get_cansim("18-10-0212")

# Latest month commodity breakdown
latest <- frspi %>%
  filter(REF_DATE == max(REF_DATE)) %>%
  select(Commodity, VALUE) %>%
  arrange(desc(VALUE))

# Overall index time series
overall <- frspi %>%
  filter(Commodity == "Freight Rail Services Price Index") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Calculate month-over-month change
dec2025 <- overall %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
nov2025 <- overall %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
mom_change <- (dec2025 - nov2025) / nov2025 * 100
```

</details>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "freight-rail-prices-december-2025", "en"));
```
