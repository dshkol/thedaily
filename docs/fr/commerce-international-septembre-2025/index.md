---
title: Les exportations de marchandises en hausse de 6,3 % en septembre 2025
toc: false
---

# Les exportations de marchandises en hausse de 6,3 % en septembre 2025

<p class="release-date">Diffusion : 13 novembre 2025</p>

<div class="highlights">

- Les exportations de marchandises ont augmenté de 6,3 % pour atteindre 64,2 milliards de dollars en septembre 2025
- Les importations ont diminué de 4,1 % pour s'établir à 64,1 milliards de dollars
- Le Canada a affiché un excédent commercial de 153 millions de dollars

</div>

Les exportations de marchandises ont progressé de 6,3 % pour atteindre 64,2 milliards de dollars en septembre 2025, rebondissant après un recul de 3,2 % en août. Parallèlement, les importations ont diminué de 4,1 % pour s'établir à 64,1 milliards de dollars, ce qui a donné lieu à un excédent commercial de 153 millions de dollars.

D'une année à l'autre, les exportations ont augmenté de 0,3 % par rapport à septembre 2024, tandis que les importations ont diminué de 1,9 %.

## Tendance du commerce

Les exportations et les importations ont été volatiles tout au long de 2025, les exportations ayant rebondi en septembre après plusieurs mois de baisses.

```js
import * as Plot from "npm:@observablehq/plot";

const tradeData = [
  {date: new Date("2024-01-01"), exports: 61.59, imports: 62.12},
  {date: new Date("2024-02-01"), exports: 65.86, imports: 64.89},
  {date: new Date("2024-03-01"), exports: 63.52, imports: 64.31},
  {date: new Date("2024-04-01"), exports: 65.01, imports: 65.44},
  {date: new Date("2024-05-01"), exports: 62.82, imports: 64.60},
  {date: new Date("2024-06-01"), exports: 65.62, imports: 66.21},
  {date: new Date("2024-07-01"), exports: 64.99, imports: 65.31},
  {date: new Date("2024-08-01"), exports: 64.11, imports: 65.80},
  {date: new Date("2024-09-01"), exports: 64.06, imports: 65.33},
  {date: new Date("2024-10-01"), exports: 65.07, imports: 65.56},
  {date: new Date("2024-11-01"), exports: 66.42, imports: 67.03},
  {date: new Date("2024-12-01"), exports: 69.92, imports: 69.15},
  {date: new Date("2025-01-01"), exports: 72.86, imports: 69.22},
  {date: new Date("2025-02-01"), exports: 68.81, imports: 69.89},
  {date: new Date("2025-03-01"), exports: 67.45, imports: 69.38},
  {date: new Date("2025-04-01"), exports: 60.04, imports: 67.32},
  {date: new Date("2025-05-01"), exports: 61.03, imports: 66.78},
  {date: new Date("2025-06-01"), exports: 61.48, imports: 67.05},
  {date: new Date("2025-07-01"), exports: 62.37, imports: 66.19},
  {date: new Date("2025-08-01"), exports: 60.40, imports: 66.83},
  {date: new Date("2025-09-01"), exports: 64.23, imports: 64.08}
];

display(Plot.plot({
  title: "Commerce de marchandises, Canada (milliards de dollars)",
  width: 700,
  height: 400,
  y: {
    domain: [55, 75],
    grid: true,
    label: "Milliards ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(tradeData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "exports",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.dot(tradeData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "imports",
      fill: "#1f77b4",
      r: 5
    }),
    Plot.text([{x: new Date("2025-05-01"), y: 73, text: "Exportations"}], {
      x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 12
    }),
    Plot.text([{x: new Date("2025-05-01"), y: 70, text: "Importations"}], {
      x: "x", y: "y", text: "text", fill: "#1f77b4", fontSize: 12
    })
  ]
}));
```

## Balance commerciale

Le Canada a affiché un excédent commercial de 153 millions de dollars en septembre, inversant plusieurs mois de déficits commerciaux.

```js
const balanceData = [
  {month: "Jan.", balance: 3.64},
  {month: "Fév.", balance: -1.08},
  {month: "Mars", balance: -1.93},
  {month: "Avr.", balance: -7.28},
  {month: "Mai", balance: -5.75},
  {month: "Juin", balance: -5.57},
  {month: "Juil.", balance: -3.82},
  {month: "Août", balance: -6.43},
  {month: "Sept.", balance: 0.15}
];

display(Plot.plot({
  title: "Balance commerciale, 2025 (milliards de dollars)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept."]
  },
  y: {
    grid: true,
    label: "Milliards ($)",
    domain: [-10, 5]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(balanceData, {
      x: "month",
      y: "balance",
      fill: d => d.balance >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(balanceData, {
      x: "month",
      y: d => d.balance >= 0 ? d.balance + 0.4 : d.balance - 0.4,
      text: d => (d.balance >= 0 ? "+" : "") + d.balance.toFixed(1).replace(".", ","),
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Exportations (milliards $) | 64,2 | +6,3 % | +0,3 % |
| Importations (milliards $) | 64,1 | -4,1 % | -1,9 % |
| Balance commerciale (millions $) | +153 | — | — |

<div class="note-to-readers">

**Note aux lecteurs**

Les données sur le commerce international de marchandises sont exprimées en dollars courants et sont désaisonnalisées. Les données portent sur le commerce de biens entre le Canada et ses partenaires commerciaux.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1210001101)
**Enquête :** Commerce international canadien de marchandises
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/1210001101-fra](https://doi.org/10.25318/1210001101-fra)

</div>
