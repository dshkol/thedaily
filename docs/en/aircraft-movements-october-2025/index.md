---
title: Aircraft movements down 6.2% in October 2025 as seasonal patterns take hold
verification_json: output/aircraft_movements.json
toc: false
---
# Aircraft movements down 6.2% in October 2025 as seasonal patterns take hold

<p class="release-date">Released: January 17, 2026 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Total aircraft movements at Canadian airports with NAV CANADA towers reached 514,143 in October 2025, down 6.2% from September
- Year-over-year, movements decreased 0.6% compared with October 2024
- Toronto Pearson led all airports with 33,548 movements, followed by Vancouver at 24,678
- Itinerant movements (flights between airports) totalled 350,032, representing 68% of all activity

</div>

Aircraft movements at Canadian airports with NAV CANADA towers totalled 514,143 in October 2025, down 6.2% from 548,386 in September. This decline reflects typical seasonal patterns as activity decreases from summer peaks.

On a year-over-year basis, movements were down 0.6% compared with October 2024, when 517,437 movements were recorded. Activity in October 2025 remained below the July peak of 614,251 movements.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 23-10-0296
const movementsData = [
  {date: new Date("2023-11-01"), value: 448113},
  {date: new Date("2023-12-01"), value: 352356},
  {date: new Date("2024-01-01"), value: 318005},
  {date: new Date("2024-02-01"), value: 389604},
  {date: new Date("2024-03-01"), value: 444170},
  {date: new Date("2024-04-01"), value: 487753},
  {date: new Date("2024-05-01"), value: 545077},
  {date: new Date("2024-06-01"), value: 520294},
  {date: new Date("2024-07-01"), value: 592979},
  {date: new Date("2024-08-01"), value: 547951},
  {date: new Date("2024-09-01"), value: 522102},
  {date: new Date("2024-10-01"), value: 517437},
  {date: new Date("2024-11-01"), value: 416344},
  {date: new Date("2024-12-01"), value: 351072},
  {date: new Date("2025-01-01"), value: 380590},
  {date: new Date("2025-02-01"), value: 346117},
  {date: new Date("2025-03-01"), value: 457019},
  {date: new Date("2025-04-01"), value: 523796},
  {date: new Date("2025-05-01"), value: 560048},
  {date: new Date("2025-06-01"), value: 563211},
  {date: new Date("2025-07-01"), value: 614251},
  {date: new Date("2025-08-01"), value: 574355},
  {date: new Date("2025-09-01"), value: 548386},
  {date: new Date("2025-10-01"), value: 514143}
];

display(Plot.plot({
  title: "Aircraft movements at Canadian airports, November 2023 to October 2025",
  width: 680,
  height: 300,
  y: {domain: [300000, 650000], grid: true, label: "Number of movements"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(movementsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(movementsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(movementsData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000).toFixed(0) + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Toronto Pearson leads airport activity

Toronto Pearson International Airport recorded the highest number of movements at 33,548 in October 2025, followed by Vancouver International at 24,678. Several smaller airports in British Columbia—Boundary Bay, Abbotsford, and Pitt Meadows—ranked among the top 10, reflecting active general aviation communities in the region.

| Airport | Movements |
|---|---:|
| Toronto/Lester B. Pearson International | 33,548 |
| Vancouver International | 24,678 |
| Boundary Bay | 19,945 |
| Abbotsford | 18,222 |
| Calgary International | 17,864 |
| Montréal/Pierre Elliott Trudeau International | 17,611 |
| Pitt Meadows | 16,227 |
| Kitchener/Waterloo | 14,305 |
| Calgary/Springbank | 13,684 |
| Saskatoon/John G. Diefenbaker International | 13,527 |

## Itinerant movements dominate activity

Itinerant movements—flights between different airports—accounted for 350,032 or 68% of total movements in October 2025. Local movements, which include training flights and other operations that depart and return to the same airport, totalled 164,111.

Civil aviation accounted for nearly all local movements at 163,737, while military local movements numbered just 374.

<div class="note-to-readers">

## Note to readers

Aircraft movements include both takeoffs and landings. An itinerant movement is one where the aircraft proceeds to or arrives from another airport. A local movement involves an aircraft that remains in the vicinity of the airport.

Data cover airports with NAV CANADA control towers or flight service stations. Activity at other airports is not included in these totals.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch aircraft movements data
movements <- get_cansim("23-10-0296")

# Total movements at all airports
total <- movements %>%
  filter(Airports == "Total, all airports",
         `Class of operation` == "Total, itinerant and local movements") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate month-over-month change
current <- total %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous <- total %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Top airports
top_airports <- movements %>%
  filter(Airports != "Total, all airports",
         `Class of operation` == "Total, itinerant and local movements",
         REF_DATE == "2025-10") %>%
  select(Airports, VALUE) %>%
  arrange(desc(VALUE)) %>%
  head(10)
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 23-10-0296](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=2310029601)
**Survey:** Civil Aviation Statistics
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/2310029601-eng](https://doi.org/10.25318/2310029601-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "aircraft-movements-october-2025", "en"));
```
