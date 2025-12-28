---
title: Les ventes du secteur manufacturier en baisse de 1,1 % en août 2025
toc: false
---

# Les ventes du secteur manufacturier en baisse de 1,1 % en août 2025

<p class="release-date">Diffusion : 15 octobre 2025</p>

<div class="highlights">

- Les ventes du secteur manufacturier ont diminué de 1,1 % pour s'établir à 69,8 milliards de dollars en août 2025
- Cette baisse fait suite à une hausse de 2,3 % en juillet
- D'une année à l'autre, les ventes ont diminué de 0,8 %

</div>

Les ventes du secteur manufacturier ont diminué de 1,1 % pour s'établir à 69,8 milliards de dollars en août 2025, effaçant en partie la hausse de 2,3 % enregistrée en juillet. D'une année à l'autre, les ventes du secteur manufacturier ont diminué de 0,8 % par rapport à août 2024, alors que les ventes totalisaient 70,3 milliards de dollars.

Le recul d'août a poursuivi la volatilité qui a caractérisé le secteur manufacturier tout au long de 2025.

## Tendance des ventes

Les ventes du secteur manufacturier ont fluctué tout au long de 2025, avec des baisses au printemps suivies d'une reprise en été, bien qu'août ait affiché un recul par rapport aux gains de juillet.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
  {date: new Date("2023-08-01"), value: 68.45},
  {date: new Date("2023-09-01"), value: 69.12},
  {date: new Date("2023-10-01"), value: 69.85},
  {date: new Date("2023-11-01"), value: 70.22},
  {date: new Date("2023-12-01"), value: 69.98},
  {date: new Date("2024-01-01"), value: 70.18},
  {date: new Date("2024-02-01"), value: 71.66},
  {date: new Date("2024-03-01"), value: 70.57},
  {date: new Date("2024-04-01"), value: 71.50},
  {date: new Date("2024-05-01"), value: 71.71},
  {date: new Date("2024-06-01"), value: 70.35},
  {date: new Date("2024-07-01"), value: 71.55},
  {date: new Date("2024-08-01"), value: 70.30},
  {date: new Date("2024-09-01"), value: 70.15},
  {date: new Date("2024-10-01"), value: 71.04},
  {date: new Date("2024-11-01"), value: 71.54},
  {date: new Date("2024-12-01"), value: 71.80},
  {date: new Date("2025-01-01"), value: 72.79},
  {date: new Date("2025-02-01"), value: 72.42},
  {date: new Date("2025-03-01"), value: 71.28},
  {date: new Date("2025-04-01"), value: 69.34},
  {date: new Date("2025-05-01"), value: 68.29},
  {date: new Date("2025-06-01"), value: 68.93},
  {date: new Date("2025-07-01"), value: 70.51},
  {date: new Date("2025-08-01"), value: 69.75}
];

display(Plot.plot({
  title: "Ventes du secteur manufacturier, Canada (milliards de dollars, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [66, 74],
    grid: true,
    label: "Milliards ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(salesData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.text(salesData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + " G$",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Variation mensuelle en 2025

Les ventes ont été volatiles en 2025, le recul d'août faisant suite à un mois de juillet solide.

```js
const monthlyChanges = [
  {month: "Jan.", change: 1.4},
  {month: "Fév.", change: -0.5},
  {month: "Mars", change: -1.6},
  {month: "Avr.", change: -2.7},
  {month: "Mai", change: -1.5},
  {month: "Juin", change: 0.9},
  {month: "Juil.", change: 2.3},
  {month: "Août", change: -1.1}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes manufacturières, 2025 (%)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
  },
  y: {
    grid: true,
    label: "Variation en pourcentage",
    domain: [-4, 4]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyChanges, {
      x: "month",
      y: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(monthlyChanges, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.25 : d.change - 0.25,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Ventes manufacturières (milliards $) | 69,8 | -1,1 % | -0,8 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les ventes du secteur manufacturier sont exprimées en dollars courants et sont désaisonnalisées. L'Enquête mensuelle sur les industries manufacturières couvre toutes les industries manufacturières au Canada.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 16-10-0047](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1610004701)
**Enquête :** Enquête mensuelle sur les industries manufacturières
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/1610004701-fra](https://doi.org/10.25318/1610004701-fra)

</div>
