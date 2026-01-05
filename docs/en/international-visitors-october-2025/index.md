---
title: International visitors up 4.9% year over year in October 2025
toc: false
---

# International visitors up 4.9% year over year in October 2025

<p class="release-date">Released: 2025-12-29 <span class="article-type-tag release">New Release</span></p>

<div class="metric-box">
  <div class="value">2.4 million</div>
  <div class="label">Non-resident visitors entering Canada, October 2025</div>
</div>

Canada welcomed 2,363,398 non-resident visitors in October 2025, up 4.9% from 2,252,283 in October 2024. This marked a continued recovery in international tourism, with visitors from countries other than the United States increasing 11.7% year over year.

<div class="highlights">

**Highlights**

- Non-resident visitors to Canada increased 4.9% year over year in October 2025
- Visitors from countries other than the United States rose 11.7%, compared with 3.0% growth from the U.S.
- South Korea recorded the largest year-over-year increase among major source countries at 48.2%
- Nova Scotia saw visitors rise 69.5% year over year, the strongest gain among provinces

</div>

## Monthly visitor trend

October visitor volumes were 17.8% below September, reflecting the typical seasonal pattern as travel declines following the summer peak. July 2025 recorded the highest monthly total at 4.3 million visitors.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 24-10-0050
const visitorData = [
  {date: new Date("2023-11"), value: 1520059},
  {date: new Date("2023-12"), value: 1993965},
  {date: new Date("2024-01"), value: 1189366},
  {date: new Date("2024-02"), value: 1459708},
  {date: new Date("2024-03"), value: 1682944},
  {date: new Date("2024-04"), value: 1886774},
  {date: new Date("2024-05"), value: 2687964},
  {date: new Date("2024-06"), value: 3643749},
  {date: new Date("2024-07"), value: 4260020},
  {date: new Date("2024-08"), value: 4007080},
  {date: new Date("2024-09"), value: 2882158},
  {date: new Date("2024-10"), value: 2252283},
  {date: new Date("2024-11"), value: 1734045},
  {date: new Date("2024-12"), value: 2132061},
  {date: new Date("2025-01"), value: 1414635},
  {date: new Date("2025-02"), value: 1391190},
  {date: new Date("2025-03"), value: 1587932},
  {date: new Date("2025-04"), value: 1824703},
  {date: new Date("2025-05"), value: 2595836},
  {date: new Date("2025-06"), value: 3571205},
  {date: new Date("2025-07"), value: 4250749},
  {date: new Date("2025-08"), value: 4037165},
  {date: new Date("2025-09"), value: 2876327},
  {date: new Date("2025-10"), value: 2363398}
];

display(Plot.plot({
  title: "Non-resident visitors entering Canada, November 2023 to October 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "Visitors (millions)", tickFormat: d => (d/1000000).toFixed(1)},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(visitorData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(visitorData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(visitorData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000000).toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## United States remains dominant source

American visitors accounted for 76.8% of all non-resident arrivals in October 2025, totalling 1,814,406. While U.S. visitors increased 3.0% year over year, growth from other countries was notably stronger at 11.7%.

```js
// Real data from Statistics Canada Table 24-10-0050
const usOtherData = [
  {date: new Date("2023-11"), us: 1219676, other: 300383},
  {date: new Date("2023-12"), us: 1524595, other: 469370},
  {date: new Date("2024-01"), us: 910621, other: 278745},
  {date: new Date("2024-02"), us: 1127588, other: 332120},
  {date: new Date("2024-03"), us: 1336056, other: 346888},
  {date: new Date("2024-04"), us: 1476081, other: 410693},
  {date: new Date("2024-05"), us: 2072414, other: 615550},
  {date: new Date("2024-06"), us: 2897819, other: 745930},
  {date: new Date("2024-07"), us: 3353349, other: 906671},
  {date: new Date("2024-08"), us: 3195854, other: 811226},
  {date: new Date("2024-09"), us: 2198468, other: 683690},
  {date: new Date("2024-10"), us: 1760987, other: 491296},
  {date: new Date("2024-11"), us: 1448685, other: 285360},
  {date: new Date("2024-12"), us: 1685491, other: 446570},
  {date: new Date("2025-01"), us: 1105027, other: 309608},
  {date: new Date("2025-02"), us: 1076683, other: 314507},
  {date: new Date("2025-03"), us: 1257520, other: 330412},
  {date: new Date("2025-04"), us: 1360708, other: 463995},
  {date: new Date("2025-05"), us: 1969363, other: 626473},
  {date: new Date("2025-06"), us: 2786594, other: 784611},
  {date: new Date("2025-07"), us: 3251100, other: 999649},
  {date: new Date("2025-08"), us: 3151192, other: 885973},
  {date: new Date("2025-09"), us: 2142122, other: 734205},
  {date: new Date("2025-10"), us: 1814406, other: 548992}
];

const stackData = usOtherData.flatMap(d => [
  {date: d.date, source: "United States", value: d.us},
  {date: d.date, source: "Other countries", value: d.other}
]);

display(Plot.plot({
  title: "Visitors by origin, November 2023 to October 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Visitors (millions)", tickFormat: d => (d/1000000).toFixed(1)},
  x: {type: "utc", label: null},
  color: {
    domain: ["United States", "Other countries"],
    range: ["#AF3C43", "#E57373"],
    legend: true
  },
  marks: [
    Plot.areaY(stackData, Plot.stackY({
      x: "date",
      y: "value",
      fill: "source",
      order: ["United States", "Other countries"]
    })),
    Plot.ruleY([0])
  ]
}));
```

## Top source countries

France and the United Kingdom were the top non-U.S. source countries in October 2025, each sending over 65,000 visitors. China ranked third at 38,695 visitors, up 12.6% year over year.

| Country | October 2025 | October 2024 | YoY change |
|---------|-------------|-------------|------------|
| France | 66,180 | 62,116 | +6.5% |
| United Kingdom | 65,241 | 64,550 | +1.1% |
| China | 38,695 | 34,361 | +12.6% |
| Germany | 27,934 | 26,854 | +4.0% |
| India | 27,063 | 24,194 | +11.9% |
| South Korea | 25,463 | 17,182 | +48.2% |
| Mexico | 24,560 | 23,284 | +5.5% |
| Australia | 17,940 | 18,144 | -1.1% |
| Japan | 15,214 | 14,446 | +5.3% |
| Taiwan | 11,268 | 8,161 | +38.1% |

## Fastest growing markets

South Korea recorded the largest year-over-year increase among major source countries at 48.2%, adding over 8,200 additional visitors compared with October 2024. Taiwan followed with 38.1% growth.

```js
// Real data from Statistics Canada Table 24-10-0050
const growthData = [
  {country: "South Korea", change: 48.2},
  {country: "Taiwan", change: 38.1},
  {country: "Nigeria", change: 13.1},
  {country: "China", change: 12.6},
  {country: "India", change: 11.9},
  {country: "Switzerland", change: 10.5},
  {country: "France", change: 6.5},
  {country: "Mexico", change: 5.5},
  {country: "Japan", change: 5.3},
  {country: "Germany", change: 4.0},
  {country: "Hong Kong", change: 2.5},
  {country: "Brazil", change: 1.3},
  {country: "United Kingdom", change: 1.1},
  {country: "Australia", change: -1.1},
  {country: "Philippines", change: -9.9}
];

display(Plot.plot({
  title: "Year-over-year change by source country (%)",
  width: 680,
  height: 380,
  marginLeft: 100,
  marginRight: 60,
  x: {domain: [-15, 55], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(growthData, {
      y: "country",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(growthData, {
      y: "country",
      x: 55,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Regional source patterns

Among world regions, Asia recorded the largest year-over-year increase at 14.9%, followed by Europe at 10.5%. Visitors from Africa increased 29.1%, though from a smaller base of 29,647 visitors.

| Region | October 2025 | October 2024 | YoY change |
|--------|-------------|-------------|------------|
| Europe | 254,266 | 230,060 | +10.5% |
| Asia | 169,317 | 147,345 | +14.9% |
| Americas (excl. U.S.) | 73,653 | 68,478 | +7.6% |
| Africa | 29,647 | 22,962 | +29.1% |
| Oceania | 22,041 | 22,421 | -1.7% |

## Provincial destinations

Ontario received the most non-resident visitors at 1,179,753, accounting for nearly half of all arrivals. British Columbia followed at 518,046 visitors.

Nova Scotia recorded the strongest year-over-year growth at 69.5%, while Prince Edward Island saw visitors decline 68.2%.

| Province | October 2025 | October 2024 | YoY change |
|----------|-------------|-------------|------------|
| Ontario | 1,179,753 | 1,127,482 | +4.6% |
| British Columbia | 518,046 | 493,998 | +4.9% |
| Quebec | 355,145 | 356,431 | -0.4% |
| New Brunswick | 103,671 | 99,692 | +4.0% |
| Alberta | 93,977 | 83,262 | +12.9% |
| Nova Scotia | 55,299 | 32,626 | +69.5% |
| Manitoba | 32,564 | 31,101 | +4.7% |
| Saskatchewan | 11,568 | 10,913 | +6.0% |

## Seasonal context

October 2025 visitor volumes were 55.6% of the July peak, consistent with typical seasonal patterns in Canadian tourism. Visitor numbers typically decline from summer highs through the fall months, with a partial recovery during the December holiday season.

<div class="note-to-readers">

## Note to readers

This release reports the number of non-resident visitors entering Canada by country of residence and province of destination.

Counts include all border crossings and are not seasonally adjusted. Month-to-month changes reflect both seasonal patterns and underlying trends in travel demand.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch international visitors data
visitors <- get_cansim("24-10-0053")

# Total visitors by country of origin
total <- visitors %>%
  filter(`Traveller type` == "Non-resident travellers entering Canada") %>%
  select(REF_DATE, `Country of residence`, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 24-10-0050](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2410005001)
**Survey:** Frontier Counts
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2410005001-eng](https://doi.org/10.25318/2410005001-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "international-visitors-october-2025", "en"));
```
