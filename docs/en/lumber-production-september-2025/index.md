---
title: Lumber production down 2.7% year over year in September 2025
verification_json: output/data_16_10_0047_enhanced.json
toc: false
---
# Lumber production down 2.7% year over year in September 2025

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Lumber production totalled 3,845 thousand cubic metres in September 2025, down 2.7% from September 2024
- Shipments rose 2.2% year over year to 4,016 thousand cubic metres, while stocks fell 14.8%
- Quebec led provincial production at 1,190 thousand cubic metres, up 15.8% from a year earlier
- British Columbia interior production declined 23.3% year over year to 883 thousand cubic metres
- Softwood accounted for 98.1% of total production, with spruce, pine, and fir comprising 90.9% of softwood

</div>

Canadian sawmills produced 3,845 thousand cubic metres of lumber in September 2025, up 2.3% from August but down 2.7% compared with the same month a year earlier. For the first nine months of 2025, production totalled 35,737 thousand cubic metres, down 3.9% from the same period in 2024.

Shipments exceeded production in September, reaching 4,016 thousand cubic metres, up 14.4% from August and 2.2% from September 2024. The higher level of shipments relative to production contributed to a decline in stocks, which fell 2.8% from August to 6,436 thousand cubic metres and were down 14.8% year over year.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 16-10-0017
const productionData = [
  {date: new Date("2023-10"), value: 4485},
  {date: new Date("2023-11"), value: 4486},
  {date: new Date("2023-12"), value: 3413},
  {date: new Date("2024-01"), value: 3996},
  {date: new Date("2024-02"), value: 4352},
  {date: new Date("2024-03"), value: 4397},
  {date: new Date("2024-04"), value: 4557},
  {date: new Date("2024-05"), value: 4475},
  {date: new Date("2024-06"), value: 3988},
  {date: new Date("2024-07"), value: 3682},
  {date: new Date("2024-08"), value: 3773},
  {date: new Date("2024-09"), value: 3951},
  {date: new Date("2024-10"), value: 4251},
  {date: new Date("2024-11"), value: 3997},
  {date: new Date("2024-12"), value: 3333},
  {date: new Date("2025-01"), value: 3872},
  {date: new Date("2025-02"), value: 3687},
  {date: new Date("2025-03"), value: 4326},
  {date: new Date("2025-04"), value: 4278},
  {date: new Date("2025-05"), value: 4144},
  {date: new Date("2025-06"), value: 3996},
  {date: new Date("2025-07"), value: 3832},
  {date: new Date("2025-08"), value: 3758},
  {date: new Date("2025-09"), value: 3845}
];

display(Plot.plot({
  title: "Total lumber production, October 2023 to September 2025",
  width: 680,
  height: 300,
  y: {domain: [3000, 4800], grid: true, label: "Thousand cubic metres"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(productionData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(productionData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(productionData.slice(-1), {x: "date", y: "value", text: d => d.value.toLocaleString(), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Provincial production

Quebec was the largest lumber-producing province in September 2025, with production of 1,190 thousand cubic metres, up 15.8% from September 2024. Alberta followed at 759 thousand cubic metres, up 2.5% year over year.

British Columbia interior production fell 23.3% year over year to 883 thousand cubic metres. Within British Columbia, the northern interior declined 24.4% to 425 thousand cubic metres, while the southern interior fell 22.2% to 458 thousand cubic metres.

```js
const provincialData = [
  {name: "Quebec", value: 1190, yoy: 15.8},
  {name: "BC Interior", value: 883, yoy: -23.3},
  {name: "Alberta", value: 759, yoy: 2.5},
  {name: "Southern Interior, BC", value: 458, yoy: -22.2},
  {name: "Northern Interior, BC", value: 425, yoy: -24.4},
  {name: "Ontario", value: 401, yoy: null},
  {name: "Nova Scotia", value: 82, yoy: -1.6},
  {name: "Saskatchewan", value: 74, yoy: null}
];

display(Plot.plot({
  title: "Lumber production by region, September 2025 (thousand cubic metres)",
  width: 680,
  height: 340,
  marginLeft: 160,
  marginRight: 60,
  x: {grid: true, label: "Thousand cubic metres"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provincialData, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(provincialData, {
      y: "name",
      x: 1250,
      text: d => d.value.toLocaleString(),
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Species composition

Softwood dominated lumber production in September 2025, accounting for 3,773 thousand cubic metres, or 98.1% of the total. Hardwood production totalled 72 thousand cubic metres.

Within softwood, spruce, pine, and fir (SPF) accounted for 3,428 thousand cubic metres, representing 90.9% of softwood production. Douglas fir and western larch production totalled 140 thousand cubic metres, while western red cedar production reached 52 thousand cubic metres.

```js
// 20x5 grid (100 cells) matching standard 640px width
const cols = 20;
const shares = [
  {source: "Spruce, pine, fir (89%)", pct: 89, color: "#AF3C43"},
  {source: "Other softwood (9%)", pct: 9, color: "#E57373"},
  {source: "Hardwood (2%)", pct: 2, color: "#FFAB91"}
];

let waffle = [];
let idx = 0;
for (const s of shares) {
  for (let i = 0; i < s.pct; i++) {
    waffle.push({x: idx % cols, y: Math.floor(idx / cols), source: s.source});
    idx++;
  }
}

display(Plot.plot({
  title: "Lumber production by species group, September 2025",
  width: 640,
  height: 180,
  axis: null,
  color: {
    domain: shares.map(d => d.source),
    range: shares.map(d => d.color),
    legend: true
  },
  marks: [
    Plot.cell(waffle, {x: "x", y: "y", fill: "source", inset: 1, rx: 3})
  ]
}));
```

## Production, shipments, and stocks

Shipments of 4,016 thousand cubic metres exceeded production of 3,845 thousand cubic metres in September 2025, drawing down inventory levels. Stocks fell to 6,436 thousand cubic metres at the end of September, their lowest level in 13 months.

```js
const indicatorData = [
  {date: new Date("2024-09"), production: 3951, shipments: 3929, stocks: 7556},
  {date: new Date("2024-10"), production: 4251, shipments: 4442, stocks: 7337},
  {date: new Date("2024-11"), production: 3997, shipments: 4054, stocks: 6981},
  {date: new Date("2024-12"), production: 3333, shipments: 3184, stocks: 7166},
  {date: new Date("2025-01"), production: 3872, shipments: 3801, stocks: 7079},
  {date: new Date("2025-02"), production: 3687, shipments: 3429, stocks: 7349},
  {date: new Date("2025-03"), production: 4326, shipments: 4201, stocks: 7048},
  {date: new Date("2025-04"), production: 4278, shipments: 3956, stocks: 7425},
  {date: new Date("2025-05"), production: 4144, shipments: 4356, stocks: 7198},
  {date: new Date("2025-06"), production: 3996, shipments: 4240, stocks: 6814},
  {date: new Date("2025-07"), production: 3832, shipments: 4056, stocks: 6500},
  {date: new Date("2025-08"), production: 3758, shipments: 3509, stocks: 6620},
  {date: new Date("2025-09"), production: 3845, shipments: 4016, stocks: 6436}
];

display(Plot.plot({
  title: "Production vs. shipments, September 2024 to September 2025",
  width: 680,
  height: 300,
  y: {domain: [3000, 4600], grid: true, label: "Thousand cubic metres"},
  x: {type: "utc", label: null},
  color: {legend: true},
  marks: [
    Plot.lineY(indicatorData, {x: "date", y: "production", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(indicatorData, {x: "date", y: "shipments", stroke: "#2e7d32", strokeWidth: 2, strokeDasharray: "4,2"}),
    Plot.dot(indicatorData.slice(-1), {x: "date", y: "production", fill: "#AF3C43", r: 4}),
    Plot.dot(indicatorData.slice(-1), {x: "date", y: "shipments", fill: "#2e7d32", r: 4}),
    Plot.text([{x: new Date("2025-04"), y: 4400, text: "Production"}], {x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 11}),
    Plot.text([{x: new Date("2025-04"), y: 4200, text: "Shipments"}], {x: "x", y: "y", text: "text", fill: "#2e7d32", fontSize: 11})
  ]
}));
```

| Indicator | September 2025 | August 2025 | MoM change | September 2024 | YoY change |
|-----------|---------------:|------------:|-----------:|---------------:|-----------:|
| Production | 3,845 | 3,758 | +2.3% | 3,951 | -2.7% |
| Shipments | 4,016 | 3,509 | +14.4% | 3,929 | +2.2% |
| Stocks | 6,436 | 6,620 | -2.8% | 7,556 | -14.8% |

<div class="note-to-readers">

## Note to readers

Lumber production, shipments, and stocks data are collected from sawmills producing 50 thousand board feet or more per year. Data are reported in cubic metres. Softwood species include spruce, pine, fir, Douglas fir, western larch, hemlock, and western red cedar. Hardwood includes all other lumber species.

British Columbia data are disaggregated into coastal and interior regions, with the interior further broken down into northern and southern subregions. Some provincial data are suppressed to meet confidentiality requirements.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch lumber production data
lumber <- get_cansim("16-10-0017")

# Total softwood lumber production
total_lumber <- lumber %>%
  filter(GEO == "Canada",
         `Type of wood` == "Total softwood") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 16-10-0017](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1610001701)
**Survey:** Monthly Survey of Sawmills
**Reference period:** September 2025
**DOI:** [https://doi.org/10.25318/1610001701-eng](https://doi.org/10.25318/1610001701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "lumber-production-september-2025", "en"));
```
