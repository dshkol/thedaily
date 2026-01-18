---
title: Screened passenger traffic unchanged year over year in November 2025
verification_json: output/screened_passengers.json
toc: false
---
# Screened passenger traffic unchanged year over year in November 2025

<p class="release-date">Released: January 17, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Screened passenger traffic at Canada's eight largest airports totalled 4.4 million in November 2025, virtually unchanged (+0.1%) from November 2024
- Monthly traffic fell 12.3% from October as the post-summer travel slowdown continued
- Toronto Pearson handled 1.6 million passengers, representing 37% of all screened traffic
- Domestic travel accounted for 45% of passengers, while international travel made up 31%

</div>

Screened passenger traffic at Canada's eight largest airports totalled 4,419,632 in November 2025, virtually unchanged from the 4,413,567 passengers screened in November 2024. Traffic declined 12.3% from October's 5,036,979 passengers as seasonal patterns moderated travel volumes following the busy summer period.

November marked the fourth consecutive month of monthly declines from the July peak of 5.9 million passengers.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 23-10-0312
const passengerData = [
  {date: new Date("2023-12-01"), value: 4533764},
  {date: new Date("2024-01-01"), value: 4323045},
  {date: new Date("2024-02-01"), value: 4219440},
  {date: new Date("2024-03-01"), value: 4554090},
  {date: new Date("2024-04-01"), value: 4364918},
  {date: new Date("2024-05-01"), value: 4714460},
  {date: new Date("2024-06-01"), value: 5049935},
  {date: new Date("2024-07-01"), value: 5729343},
  {date: new Date("2024-08-01"), value: 5881612},
  {date: new Date("2024-09-01"), value: 4903309},
  {date: new Date("2024-10-01"), value: 4820063},
  {date: new Date("2024-11-01"), value: 4413567},
  {date: new Date("2024-12-01"), value: 4901887},
  {date: new Date("2025-01-01"), value: 4392911},
  {date: new Date("2025-02-01"), value: 4248782},
  {date: new Date("2025-03-01"), value: 4625367},
  {date: new Date("2025-04-01"), value: 4526474},
  {date: new Date("2025-05-01"), value: 4810219},
  {date: new Date("2025-06-01"), value: 5222346},
  {date: new Date("2025-07-01"), value: 5935640},
  {date: new Date("2025-08-01"), value: 5870107},
  {date: new Date("2025-09-01"), value: 5086336},
  {date: new Date("2025-10-01"), value: 5036979},
  {date: new Date("2025-11-01"), value: 4419632}
];

display(Plot.plot({
  title: "Screened passenger traffic at major Canadian airports, December 2023 to November 2025",
  width: 680,
  height: 300,
  y: {domain: [4000000, 6200000], grid: true, label: "Number of passengers"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000000).toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Toronto Pearson handles largest share

Toronto Pearson International Airport screened 1.6 million passengers in November 2025, accounting for 37% of all traffic at Canada's major airports. Vancouver International followed with 829,000 passengers (19%), while Montréal-Trudeau handled 686,000 passengers (16%).

| Airport | Passengers | Share |
|---|---:|---:|
| Toronto Pearson | 1,620,401 | 36.7% |
| Vancouver | 828,753 | 18.8% |
| Montréal-Trudeau | 685,828 | 15.5% |
| Calgary | 528,966 | 12.0% |
| Edmonton | 280,989 | 6.4% |
| Ottawa | 178,892 | 4.0% |
| Winnipeg | 161,826 | 3.7% |
| Halifax | 133,977 | 3.0% |

## Domestic travel leads passenger sectors

Domestic passengers accounted for 1,966,046 or 45% of total passenger traffic in November 2025. International travel to destinations outside the United States totalled 1,361,775 passengers (31%), while transborder travel to the United States reached 1,024,866 passengers (24%).

```js
const sectorData = [
  {sector: "Domestic", value: 1966046},
  {sector: "Other International", value: 1361775},
  {sector: "Transborder (US)", value: 1024866}
];

display(Plot.plot({
  title: "Passenger traffic by sector, November 2025",
  width: 640,
  height: 200,
  marginLeft: 140,
  x: {grid: true, label: "Number of passengers"},
  y: {label: null},
  marks: [
    Plot.barX(sectorData, {x: "value", y: "sector", fill: "#AF3C43", sort: {y: "-x"}}),
    Plot.text(sectorData, {x: "value", y: "sector", text: d => (d.value/1000000).toFixed(1) + "M", dx: 35, fill: "currentColor"})
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Screened passenger data include all individuals who pass through Canadian Air Transport Security Authority (CATSA) screening checkpoints at the eight largest Canadian airports. The data include both passengers and non-passengers (such as airport and airline employees).

The eight airports covered are Toronto Pearson, Vancouver, Montréal-Trudeau, Calgary, Edmonton, Ottawa, Winnipeg, and Halifax.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch screened passenger data
passengers <- get_cansim("23-10-0312")

# Total screened traffic
total <- passengers %>%
  filter(GEO == "Total of eight largest airports, Canada",
         `Screened traffic` == "Total screened traffic") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate changes
current <- total %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
previous <- total %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
year_ago <- total %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100
yoy_change <- (current - year_ago) / year_ago * 100

# By airport
by_airport <- passengers %>%
  filter(GEO != "Total of eight largest airports, Canada",
         `Screened traffic` == "Total screened traffic",
         REF_DATE == "2025-11") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0312](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310031201)
**Survey:** Air Carrier Traffic at Canadian Airports
**Reference period:** November 2025
**DOI:** [https://doi.org/10.25318/2310031201-eng](https://doi.org/10.25318/2310031201-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "screened-passengers-november-2025", "en"));
```
