---
title: Cattle prices up more than 25% year over year in October 2025
verification_json: output/data_32_10_0107_enhanced.json
toc: false
---
# Cattle prices up more than 25% year over year in October 2025

<p class="release-date">Released: December 29, 2025 <span class="article-type-tag release">New Release</span></p>

<div class="highlights">

**Highlights**

- Cattle prices in the Prairie provinces rose more than 25% year over year, with Alberta cattle for slaughter reaching $293 per hundredweight
- Wheat prices across the Prairies fell 7.5% to 8.6% compared with October 2024, amid ample global supplies
- Canola prices edged up 0.6% to 2.0% year over year in the Prairie provinces
- Hog prices increased 12.6% to 19.7% across Manitoba, Saskatchewan and Alberta

</div>

Farm product prices showed divergent trends in October 2025, with livestock prices rising substantially while key grain prices continued to decline. Cattle prices led the gains, up more than 25% year over year across the Prairie provinces, while wheat prices fell 7.5% to 8.6% compared with a year earlier.

The strong cattle price gains reflect continued tight North American cattle supplies following herd contraction in recent years. In contrast, wheat prices remained under pressure from ample global supplies following favourable harvests.

```js
import * as Plot from "npm:@observablehq/plot";

// Real data from Statistics Canada Table 32-10-0077
const cattleData = [
  {date: new Date("2023-11"), ab: 231.88, sk: 219.03, mb: 228.54},
  {date: new Date("2023-12"), ab: 228.70, sk: 213.69, mb: 224.62},
  {date: new Date("2024-01"), ab: 225.24, sk: 215.95, mb: 222.02},
  {date: new Date("2024-02"), ab: 233.40, sk: 223.19, mb: 230.06},
  {date: new Date("2024-03"), ab: 233.85, sk: 222.09, mb: 233.55},
  {date: new Date("2024-04"), ab: 235.34, sk: 222.57, mb: 232.31},
  {date: new Date("2024-05"), ab: 239.53, sk: 227.87, mb: 236.73},
  {date: new Date("2024-06"), ab: 234.65, sk: 225.84, mb: 233.29},
  {date: new Date("2024-07"), ab: 236.25, sk: 225.66, mb: 234.78},
  {date: new Date("2024-08"), ab: 237.37, sk: 221.25, mb: 231.13},
  {date: new Date("2024-09"), ab: 225.69, sk: 209.98, mb: 222.58},
  {date: new Date("2024-10"), ab: 233.46, sk: 208.61, mb: 218.89},
  {date: new Date("2024-11"), ab: 228.89, sk: 216.45, mb: 225.00},
  {date: new Date("2024-12"), ab: 231.13, sk: 218.42, mb: 227.71},
  {date: new Date("2025-01"), ab: 244.22, sk: 232.37, mb: 241.16},
  {date: new Date("2025-02"), ab: 258.06, sk: 244.63, mb: 252.91},
  {date: new Date("2025-03"), ab: 254.62, sk: 244.10, mb: 249.78},
  {date: new Date("2025-04"), ab: 268.35, sk: 254.82, mb: 264.06},
  {date: new Date("2025-05"), ab: 277.64, sk: 263.18, mb: 271.84},
  {date: new Date("2025-06"), ab: 290.55, sk: 277.00, mb: 286.78},
  {date: new Date("2025-07"), ab: 296.37, sk: 280.25, mb: 289.56},
  {date: new Date("2025-08"), ab: 296.32, sk: 275.38, mb: 285.22},
  {date: new Date("2025-09"), ab: 297.20, sk: 271.20, mb: 280.70},
  {date: new Date("2025-10"), ab: 292.79, sk: 264.32, mb: 277.76}
];

// Reshape for plotting
const cattleLong = cattleData.flatMap(d => [
  {date: d.date, province: "Alberta", value: d.ab},
  {date: d.date, province: "Saskatchewan", value: d.sk},
  {date: d.date, province: "Manitoba", value: d.mb}
]);

display(Plot.plot({
  title: "Cattle for slaughter prices by province, November 2023 to October 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Dollars per hundredweight", domain: [200, 320]},
  x: {type: "utc", label: null},
  color: {
    domain: ["Alberta", "Saskatchewan", "Manitoba"],
    range: ["#AF3C43", "#E57373", "#FFAB91"],
    legend: true
  },
  marks: [
    Plot.lineY(cattleLong, {x: "date", y: "value", stroke: "province", strokeWidth: 2}),
    Plot.dot(cattleLong.filter(d => d.date.getTime() === new Date("2025-10").getTime()), {x: "date", y: "value", fill: "province", r: 5}),
    Plot.text([{date: new Date("2025-10"), value: 292.79, province: "AB"}], {x: "date", y: "value", text: d => "$292.79", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Livestock prices

Cattle prices rose substantially across all provinces in October 2025. In Alberta, cattle for slaughter averaged $292.79 per hundredweight, up 25.4% from $233.46 in October 2024. Saskatchewan cattle prices rose 26.7% year over year to $264.32 per hundredweight, while Manitoba prices increased 26.9% to $277.76.

Hog prices also increased, though more modestly. Alberta hog prices reached $126.09 per hundredweight in October 2025, up 19.7% from a year earlier. Saskatchewan hog prices rose 17.8% to $121.18, while Manitoba hogs increased 12.6% to $120.39.

```js
const livestockYoY = [
  {product: "Cattle (AB)", oct2024: 233.46, oct2025: 292.79, yoyPct: 25.4},
  {product: "Cattle (SK)", oct2024: 208.61, oct2025: 264.32, yoyPct: 26.7},
  {product: "Cattle (MB)", oct2024: 218.89, oct2025: 277.76, yoyPct: 26.9},
  {product: "Hogs (AB)", oct2024: 105.32, oct2025: 126.09, yoyPct: 19.7},
  {product: "Hogs (SK)", oct2024: 102.86, oct2025: 121.18, yoyPct: 17.8},
  {product: "Hogs (MB)", oct2024: 106.89, oct2025: 120.39, yoyPct: 12.6}
];

display(Plot.plot({
  title: "Year-over-year change in Prairie livestock prices, October 2025 (%)",
  width: 640,
  height: 280,
  marginLeft: 120,
  marginRight: 70,
  x: {grid: true, label: "Percent change", domain: [0, 32]},
  y: {label: null},
  marks: [
    Plot.barX(livestockYoY, {
      y: "product",
      x: "yoyPct",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(livestockYoY, {
      y: "product",
      x: 32,
      dx: 5,
      text: d => "+" + d.yoyPct.toFixed(1) + "%",
      textAnchor: "start",
      fontSize: 11
    })
  ]
}));
```

<div class="data-table">

| Province | Cattle for slaughter ($/cwt) | YoY change | Hogs ($/cwt) | YoY change |
|----------|-----------------------------:|:----------:|-------------:|:----------:|
| Alberta | 292.79 | +25.4% | 126.09 | +19.7% |
| Saskatchewan | 264.32 | +26.7% | 121.18 | +17.8% |
| Manitoba | 277.76 | +26.9% | 120.39 | +12.6% |

</div>

## Crop prices

Wheat prices declined across all Prairie provinces in October 2025. Saskatchewan wheat (excluding durum) fell to $255.29 per metric tonne, down 8.6% from $279.19 a year earlier. Alberta wheat declined 8.6% to $266.95 per tonne, while Manitoba wheat decreased 7.5% to $267.58.

Canola prices showed modest year-over-year gains despite declining month over month. Saskatchewan canola averaged $617.11 per metric tonne, up 2.0% from October 2024. Alberta canola rose 1.6% to $609.38, while Manitoba canola edged up 0.6% to $613.25.

```js
// Real data from Statistics Canada Table 32-10-0077
const wheatData = [
  {date: new Date("2023-11"), ab: 362.88, sk: 348.33, mb: 351.37},
  {date: new Date("2023-12"), ab: 352.93, sk: 342.06, mb: 346.36},
  {date: new Date("2024-01"), ab: 342.00, sk: 331.86, mb: 329.66},
  {date: new Date("2024-02"), ab: 332.66, sk: 320.86, mb: 320.96},
  {date: new Date("2024-03"), ab: 323.38, sk: 313.19, mb: 314.55},
  {date: new Date("2024-04"), ab: 323.17, sk: 312.83, mb: 317.17},
  {date: new Date("2024-05"), ab: 335.69, sk: 326.42, mb: 331.29},
  {date: new Date("2024-06"), ab: 339.50, sk: 327.00, mb: 328.89},
  {date: new Date("2024-07"), ab: 311.88, sk: 301.65, mb: 305.30},
  {date: new Date("2024-08"), ab: 290.87, sk: 277.75, mb: 289.08},
  {date: new Date("2024-09"), ab: 289.10, sk: 272.75, mb: 283.37},
  {date: new Date("2024-10"), ab: 291.95, sk: 279.19, mb: 289.29},
  {date: new Date("2024-11"), ab: 291.29, sk: 279.80, mb: 293.56},
  {date: new Date("2024-12"), ab: 298.29, sk: 283.80, mb: 294.21},
  {date: new Date("2025-01"), ab: 301.35, sk: 285.66, mb: 294.66},
  {date: new Date("2025-02"), ab: 306.31, sk: 289.77, mb: 296.91},
  {date: new Date("2025-03"), ab: 307.65, sk: 290.87, mb: 298.17},
  {date: new Date("2025-04"), ab: 308.89, sk: 293.65, mb: 299.47},
  {date: new Date("2025-05"), ab: 312.54, sk: 298.64, mb: 302.03},
  {date: new Date("2025-06"), ab: 316.74, sk: 302.00, mb: 304.09},
  {date: new Date("2025-07"), ab: 310.78, sk: 299.19, mb: 302.03},
  {date: new Date("2025-08"), ab: 288.27, sk: 273.50, mb: 281.67},
  {date: new Date("2025-09"), ab: 269.01, sk: 253.72, mb: 269.72},
  {date: new Date("2025-10"), ab: 266.95, sk: 255.29, mb: 267.58}
];

// Reshape for plotting
const wheatLong = wheatData.flatMap(d => [
  {date: d.date, province: "Alberta", value: d.ab},
  {date: d.date, province: "Saskatchewan", value: d.sk},
  {date: d.date, province: "Manitoba", value: d.mb}
]);

display(Plot.plot({
  title: "Wheat prices by province, November 2023 to October 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Dollars per metric tonne", domain: [240, 380]},
  x: {type: "utc", label: null},
  color: {
    domain: ["Alberta", "Saskatchewan", "Manitoba"],
    range: ["#AF3C43", "#E57373", "#FFAB91"],
    legend: true
  },
  marks: [
    Plot.lineY(wheatLong, {x: "date", y: "value", stroke: "province", strokeWidth: 2}),
    Plot.dot(wheatLong.filter(d => d.date.getTime() === new Date("2025-10").getTime()), {x: "date", y: "value", fill: "province", r: 5})
  ]
}));
```

```js
const cropYoY = [
  {product: "Barley (MB)", yoyPct: 2.4},
  {product: "Canola (SK)", yoyPct: 2.0},
  {product: "Canola (AB)", yoyPct: 1.6},
  {product: "Oats (AB)", yoyPct: 1.0},
  {product: "Canola (MB)", yoyPct: 0.6},
  {product: "Barley (AB)", yoyPct: -0.7},
  {product: "Barley (SK)", yoyPct: -3.7},
  {product: "Oats (MB)", yoyPct: -4.6},
  {product: "Wheat (MB)", yoyPct: -7.5},
  {product: "Wheat (AB)", yoyPct: -8.6},
  {product: "Wheat (SK)", yoyPct: -8.6},
  {product: "Oats (SK)", yoyPct: -10.3}
];

display(Plot.plot({
  title: "Year-over-year change in Prairie crop prices, October 2025 (%)",
  width: 640,
  height: 360,
  marginLeft: 120,
  marginRight: 70,
  x: {grid: true, label: "Percent change", domain: [-12, 5]},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(cropYoY, {
      y: "product",
      x: "yoyPct",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(cropYoY, {
      y: "product",
      x: 5,  // Fixed at domain max for [-12, 5]
      text: d => (d.yoyPct >= 0 ? "+" : "") + d.yoyPct.toFixed(1) + "%",
      textAnchor: "end",
      fontSize: 11
    })
  ]
}));
```

<div class="data-table">

| Crop | Province | Oct 2024 ($/tonne) | Oct 2025 ($/tonne) | YoY change |
|------|----------|-------------------:|-------------------:|:----------:|
| Wheat | Saskatchewan | 279.19 | 255.29 | -8.6% |
| Wheat | Alberta | 291.95 | 266.95 | -8.6% |
| Wheat | Manitoba | 289.29 | 267.58 | -7.5% |
| Canola | Saskatchewan | 605.21 | 617.11 | +2.0% |
| Canola | Alberta | 599.57 | 609.38 | +1.6% |
| Canola | Manitoba | 609.46 | 613.25 | +0.6% |
| Barley | Manitoba | 243.06 | 248.82 | +2.4% |
| Barley | Saskatchewan | 246.05 | 236.94 | -3.7% |
| Oats | Saskatchewan | 282.07 | 253.07 | -10.3% |

</div>

## Provincial comparison

Cattle prices showed considerable variation across provinces in October 2025. Alberta recorded the highest prices at $292.79 per hundredweight, while Quebec recorded the lowest at $199.02. The $93.77 per hundredweight spread between the highest and lowest provincial prices reflected regional differences in market conditions and processing infrastructure.

```js
const provincialCattle = [
  {province: "Alberta", value: 292.79},
  {province: "Ontario", value: 291.21},
  {province: "Manitoba", value: 277.76},
  {province: "Saskatchewan", value: 264.32},
  {province: "British Columbia", value: 262.72},
  {province: "Newfoundland and Labrador", value: 243.49},
  {province: "Prince Edward Island", value: 241.59},
  {province: "New Brunswick", value: 229.37},
  {province: "Nova Scotia", value: 226.05},
  {province: "Quebec", value: 199.02}
];

display(Plot.plot({
  title: "Cattle for slaughter prices by province, October 2025 ($/hundredweight)",
  width: 680,
  height: 340,
  marginLeft: 180,
  marginRight: 70,
  x: {grid: true, label: "Dollars per hundredweight", domain: [180, 320]},
  y: {label: null},
  marks: [
    Plot.barX(provincialCattle, {
      y: "province",
      x1: 180,
      x2: "value",
      fill: "#AF3C43",
      sort: {y: "-x2"}
    }),
    Plot.text(provincialCattle, {
      y: "province",
      x: "value",
      dx: 5,
      text: d => "$" + d.value.toFixed(2),
      textAnchor: "start",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note to readers

Farm product prices reflect prices paid to farmers for agricultural commodities at the point of first sale. Prices are collected from a variety of sources including marketing boards, commodity exchanges, and direct surveys.

Crop prices are reported in dollars per metric tonne, while livestock prices are reported in dollars per hundredweight (approximately 45.4 kilograms). Regional price differences may reflect transportation costs, local supply and demand conditions, and proximity to processing facilities.

The data are not seasonally adjusted. Farm product prices typically show seasonal patterns related to harvest timing and marketing cycles.

</div>

<details>
<summary>Reproducibility: R code for data extraction</summary>

```r
library(cansim)
library(dplyr)

# Fetch farm product prices
farm <- get_cansim("32-10-0077")

# Prices by product
prices <- farm %>%
  filter(REF_DATE == "2025-10") %>%
  select(`Farm products`, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source:** Statistics Canada, [Table 32-10-0077](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210007701)
**Survey:** Farm Product Prices
**Reference period:** October 2025
**DOI:** [https://doi.org/10.25318/3210007701-eng](https://doi.org/10.25318/3210007701-eng)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "farm-prices-october-2025", "en"));
```
