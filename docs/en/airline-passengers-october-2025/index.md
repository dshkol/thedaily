---
title: Airline passengers up 2.2% in October 2025
toc: false
---

# Airline passengers up 2.2% in October 2025

<p class="release-date">Released: December 23, 2025</p>

<div class="highlights">

**Highlights**

- Major Canadian airlines carried 7.1 million passengers in October 2025, up 2.2% year over year
- Load factor rose to 83.3%, the first year-over-year increase since December 2024
- Transborder (Canada-US) passenger traffic declined 13.4%, the ninth consecutive monthly decline
- Other international traffic increased 8.0% year over year

</div>

Major Canadian airlines carried 7.1 million passengers on scheduled and charter services in October 2025, up 2.2% compared with October 2024. The passenger load factor increased to 83.3% from 83.1% a year earlier, marking the first year-over-year improvement since December 2024.

Passenger-kilometres rose 4.6% year over year to 19.6 billion, while capacity increased 4.3% to 23.5 billion available seat-kilometres. The average trip length was 2,743 kilometres, up 2.3% from October 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Data from Statistics Canada Table 23-10-0079
// Passengers carried by major Canadian airlines (thousands)
const passengerData = [
  {date: new Date("2023-01"), value: 6106},
  {date: new Date("2023-02"), value: 5766},
  {date: new Date("2023-03"), value: 6761},
  {date: new Date("2023-04"), value: 6369},
  {date: new Date("2023-05"), value: 6437},
  {date: new Date("2023-06"), value: 6911},
  {date: new Date("2023-07"), value: 7607},
  {date: new Date("2023-08"), value: 7722},
  {date: new Date("2023-09"), value: 6706},
  {date: new Date("2023-10"), value: 6524},
  {date: new Date("2023-11"), value: 5972},
  {date: new Date("2023-12"), value: 6757},
  {date: new Date("2024-01"), value: 6774},
  {date: new Date("2024-02"), value: 6696},
  {date: new Date("2024-03"), value: 7584},
  {date: new Date("2024-04"), value: 7001},
  {date: new Date("2024-05"), value: 7265},
  {date: new Date("2024-06"), value: 7491},
  {date: new Date("2024-07"), value: 8316},
  {date: new Date("2024-08"), value: 8457},
  {date: new Date("2024-09"), value: 7060},
  {date: new Date("2024-10"), value: 6991},
  {date: new Date("2024-11"), value: 6493},
  {date: new Date("2024-12"), value: 7319},
  {date: new Date("2025-01"), value: 6904},
  {date: new Date("2025-02"), value: 6486},
  {date: new Date("2025-03"), value: 7453},
  {date: new Date("2025-04"), value: 7001},
  {date: new Date("2025-05"), value: 7137},
  {date: new Date("2025-06"), value: 7546},
  {date: new Date("2025-07"), value: 8295},
  {date: new Date("2025-08"), value: 8136},
  {date: new Date("2025-09"), value: 7219},
  {date: new Date("2025-10"), value: 7147}
];

display(Plot.plot({
  title: "Passengers carried by major Canadian airlines (thousands)",
  width: 680,
  height: 300,
  y: {domain: [5000, 9000], grid: true, label: "Passengers (thousands)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => (d.value / 1000).toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Diverging trends in international travel

While overall passenger traffic increased, transborder traffic between Canada and the United States continued to decline. Passengers on scheduled transborder flights fell 13.4% year over year in October, the ninth consecutive monthly decrease.

Capacity on transborder routes also declined, with available seat-kilometres down 10.7% from October 2024. The load factor on these flights fell to 78.5% from 82.3% a year earlier.

In contrast, traffic to other international destinations grew 8.0% year over year, the largest increase since August 2024.

```js
const trafficData = [
  {segment: "Total passengers", yoyChange: 2.2},
  {segment: "Other international", yoyChange: 8.0},
  {segment: "Domestic itinerant", yoyChange: 1.1},
  {segment: "Transborder (US)", yoyChange: -13.4}
];

display(Plot.plot({
  title: "Year-over-year change by traffic segment, October 2025 (%)",
  width: 550,
  height: 200,
  marginLeft: 150,
  marginRight: 60,
  x: {domain: [-15, 12], grid: true, label: "Percent change"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(trafficData, {
      y: "segment",
      x: "yoyChange",
      fill: d => d.yoyChange >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(trafficData, {
      y: "segment",
      x: 12,
      text: d => (d.yoyChange >= 0 ? "+" : "") + d.yoyChange.toFixed(1) + "%",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Aircraft movements

Total aircraft movements at Canada's major and select small airports reached 514,143 in October, down 0.6% from October 2024. Local movements declined 3.8%, while itinerant movements increased 0.9%.

Domestic itinerant movements rose 1.1%, with British Columbia and Quebec showing the strongest regional gains. Transborder movements between Canada and the United States fell 2.9%, while movements to other international destinations increased 8.0%.

| Metric | October 2025 | Year-over-year change |
|--------|--------------|----------------------|
| Total passengers | 7.1 million | +2.2% |
| Passenger-kilometres | 19.6 billion | +4.6% |
| Available seat-kilometres | 23.5 billion | +4.3% |
| Load factor | 83.3% | +0.2 pp |
| Total aircraft movements | 514,143 | -0.6% |
| Flight hours | 183,000 | +4.6% |
| Operating revenue | $2.4 billion | +1.1% |

<div class="note-to-readers">

## Note to readers

Level I air carriers are Canadian air carriers that have been issued a Domestic licence and/or an International licence by the Canadian Transportation Agency and that carried 2 million or more passengers in the previous year.

Data in this release are not seasonally adjusted. Monthly variations reflect typical seasonal patterns in air travel, with summer months generally recording the highest passenger volumes.

</div>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0079](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310007901)
**Survey:** Monthly Civil Aviation Statistics
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2310007901-eng](https://doi.org/10.25318/2310007901-eng)

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)
library(tidyr)

# Fetch airline operating statistics
airline <- get_cansim("23-10-0079")

# Passenger time series
passengers <- airline %>%
  filter(`Operational and financial statistics` == "Passengers") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Multiple metrics for latest month
metrics <- airline %>%
  filter(`Operational and financial statistics` %in% c(
    "Passengers", "Passenger-kilometres", "Available seat-kilometres",
    "Load factor", "Hours flown"
  )) %>%
  filter(REF_DATE == "2025-10") %>%
  select(`Operational and financial statistics`, VALUE)

# Calculate year-over-year change
oct2025 <- passengers %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
oct2024 <- passengers %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
yoy_change <- (oct2025 - oct2024) / oct2024 * 100
```

</details>
