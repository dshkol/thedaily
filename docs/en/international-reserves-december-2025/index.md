---
title: International reserves up 5.1% year over year in December 2025
verification_json: output/international_reserves.json
toc: false
---
# International reserves up 5.1% year over year in December 2025

<p class="release-date">Released: 2026-01-06 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Canada's official international reserves totalled US$127.8 billion in December 2025, up 5.1% from December 2024
- Reserves were essentially unchanged from November 2025
- Non-U.S. dollar foreign currencies rose 12.9% year over year, the largest gain among reserve components
- U.S. dollar foreign currencies accounted for 54% of total reserves

</div>

Canada's official international reserves stood at US$127.8 billion at the end of December 2025, up 5.1% compared with December 2024, when reserves totalled US$121.6 billion. On a monthly basis, reserves were essentially unchanged from November 2025.

The Bank of Canada holds international reserves to support the government's foreign exchange and fiscal policies, and to provide liquidity in times of financial stress.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 10-10-0127
// Canada's official international reserves (US$ billions)
const reservesData = [
  {date: new Date("2024-01"), value: 116.3},
  {date: new Date("2024-02"), value: 116.3},
  {date: new Date("2024-03"), value: 117.9},
  {date: new Date("2024-04"), value: 121.0},
  {date: new Date("2024-05"), value: 122.8},
  {date: new Date("2024-06"), value: 122.9},
  {date: new Date("2024-07"), value: 124.2},
  {date: new Date("2024-08"), value: 125.8},
  {date: new Date("2024-09"), value: 128.1},
  {date: new Date("2024-10"), value: 123.1},
  {date: new Date("2024-11"), value: 122.6},
  {date: new Date("2024-12"), value: 121.6},
  {date: new Date("2025-01"), value: 117.9},
  {date: new Date("2025-02"), value: 119.6},
  {date: new Date("2025-03"), value: 126.0},
  {date: new Date("2025-04"), value: 124.7},
  {date: new Date("2025-05"), value: 125.0},
  {date: new Date("2025-06"), value: 127.9},
  {date: new Date("2025-07"), value: 127.7},
  {date: new Date("2025-08"), value: 127.3},
  {date: new Date("2025-09"), value: 128.7},
  {date: new Date("2025-10"), value: 128.8},
  {date: new Date("2025-11"), value: 127.8},
  {date: new Date("2025-12"), value: 127.8}
];

display(Plot.plot({
  title: "Canada's official international reserves (US$ billions)",
  width: 680,
  height: 300,
  y: {domain: [110, 135], grid: true, label: "US$ billions"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(reservesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(reservesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(reservesData.slice(-1), {x: "date", y: "value", text: d => "$" + d.value.toFixed(1) + "B", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Reserve composition

U.S. dollar-denominated foreign currencies remained the largest component of Canada's international reserves, totalling US$68.8 billion or 54% of total reserves. Other convertible foreign currencies totalled US$29.6 billion (23%), followed by Special Drawing Rights at US$23.3 billion (18%).

On a year-over-year basis, other convertible foreign currencies recorded the largest percentage increase (+12.9%), followed by other reserve assets (+17.3%). U.S. dollar foreign currencies increased 1.7%.

Canada does not hold gold as part of its official reserves, having sold its remaining gold holdings in 2016.

```js
const componentData = [
  {component: "U.S. dollar foreign currencies", value: 68.8, share: 54},
  {component: "Other foreign currencies", value: 29.6, share: 23},
  {component: "Special drawing rights", value: 23.3, share: 18},
  {component: "IMF reserve position", value: 3.9, share: 3},
  {component: "Other reserve assets", value: 2.2, share: 2}
];

display(Plot.plot({
  title: "International reserves by component, December 2025 (US$ billions)",
  width: 640,
  height: 260,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [0, 80], grid: true, label: "US$ billions"},
  y: {label: null},
  marks: [
    Plot.barX(componentData, {
      y: "component",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(componentData, {
      y: "component",
      x: "value",
      text: d => "$" + d.value.toFixed(1) + "B (" + d.share + "%)",
      dx: 45,
      fill: "currentColor"
    })
  ]
}));
```

## Year-over-year changes by component

```js
const yoyData = [
  {component: "Other reserve assets", yoy: 17.3},
  {component: "Other foreign currencies", yoy: 12.9},
  {component: "IMF reserve position", yoy: 6.1},
  {component: "Total reserves", yoy: 5.1},
  {component: "Special drawing rights", yoy: 5.0},
  {component: "U.S. dollar foreign currencies", yoy: 1.7}
];

display(Plot.plot({
  title: "Year-over-year change by component (%)",
  width: 640,
  height: 260,
  marginLeft: 200,
  marginRight: 60,
  x: {domain: [0, 20], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "component",
      x: "yoy",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "component",
      x: 19,
      text: d => "+" + d.yoy.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Official international reserves are external assets controlled by the federal government and the Bank of Canada. They are held in the Exchange Fund Account and are used to promote orderly conditions in the foreign exchange market and provide foreign currency liquidity if needed.

The data are expressed in millions of U.S. dollars at month-end market values.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch international reserves data
df <- get_cansim("10-10-0127")

# Total reserves time series
total_reserves <- df %>%
  filter(GEO == "Canada",
         `Type of reserve` == "Total, Canada's official international reserves") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate year-over-year change
current <- total_reserves %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
year_ago <- total_reserves %>% filter(REF_DATE == "2024-12") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Component breakdown for December 2025
components <- df %>%
  filter(GEO == "Canada",
         REF_DATE == "2025-12") %>%
  select(`Type of reserve`, VALUE) %>%
  arrange(desc(VALUE))

# YoY changes by component
component_yoy <- df %>%
  filter(GEO == "Canada",
         REF_DATE %in% c("2025-12", "2024-12")) %>%
  select(`Type of reserve`, REF_DATE, VALUE) %>%
  tidyr::pivot_wider(names_from = REF_DATE, values_from = VALUE) %>%
  mutate(yoy = (`2025-12` - `2024-12`) / `2024-12` * 100) %>%
  arrange(desc(`2025-12`))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 10-10-0127](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1010012701)
**Survey:** Bank of Canada, Official International Reserves
**Reference period:** December 2025
**DOI:** [https://doi.org/10.25318/1010012701-eng](https://doi.org/10.25318/1010012701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "international-reserves-december-2025", "en"));
```
