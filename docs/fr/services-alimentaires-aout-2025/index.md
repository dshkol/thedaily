---
title: Les ventes des services de restauration en hausse de 0,6 % en août 2025
toc: false
---

# Les ventes des services de restauration en hausse de 0,6 % en août 2025

<p class="release-date">Diffusion : 25 octobre 2025</p>

<div class="highlights">

- Les ventes des services de restauration et des débits de boissons ont augmenté de 0,6 % pour atteindre 8,5 milliards de dollars en août 2025
- D'une année à l'autre, les ventes ont augmenté de 5,8 % par rapport à août 2024
- Cette hausse fait suite aux baisses enregistrées en juin et juillet

</div>

Les ventes des services de restauration et des débits de boissons ont augmenté de 0,6 % pour atteindre 8,5 milliards de dollars en août 2025, se remettant d'une baisse de 0,4 % en juillet. Par rapport à août 2024, les ventes ont augmenté de 5,8 %.

L'industrie des services de restauration a affiché une croissance d'une année à l'autre constante tout au long de 2025, reflétant les dépenses soutenues des consommateurs en restauration malgré les fluctuations d'un mois à l'autre.

## Tendance des ventes des services de restauration

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 21-10-0019 de Statistique Canada
const salesData = [
  {date: new Date("2023-08"), value: 7.65},
  {date: new Date("2023-09"), value: 7.70},
  {date: new Date("2023-10"), value: 7.72},
  {date: new Date("2023-11"), value: 7.81},
  {date: new Date("2023-12"), value: 7.85},
  {date: new Date("2024-01"), value: 7.88},
  {date: new Date("2024-02"), value: 7.84},
  {date: new Date("2024-03"), value: 7.96},
  {date: new Date("2024-04"), value: 8.01},
  {date: new Date("2024-05"), value: 8.05},
  {date: new Date("2024-06"), value: 8.02},
  {date: new Date("2024-07"), value: 8.00},
  {date: new Date("2024-08"), value: 8.04},
  {date: new Date("2024-09"), value: 8.08},
  {date: new Date("2024-10"), value: 8.11},
  {date: new Date("2024-11"), value: 8.23},
  {date: new Date("2024-12"), value: 8.24},
  {date: new Date("2025-01"), value: 8.27},
  {date: new Date("2025-02"), value: 8.24},
  {date: new Date("2025-03"), value: 8.40},
  {date: new Date("2025-04"), value: 8.47},
  {date: new Date("2025-05"), value: 8.51},
  {date: new Date("2025-06"), value: 8.49},
  {date: new Date("2025-07"), value: 8.46},
  {date: new Date("2025-08"), value: 8.51}
];

display(Plot.plot({
  title: "Ventes des services de restauration et débits de boissons, août 2023 à août 2025",
  width: 680,
  height: 300,
  y: {domain: [7.5, 8.8], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(2).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

Les ventes des services de restauration ont fluctué modestement tout au long de 2025, les plus fortes hausses enregistrées en mars et mai ayant été compensées par des baisses plus faibles en juin et juillet.

```js
const momData = [
  {month: "Jan.", change: 0.4},
  {month: "Fév.", change: -0.4},
  {month: "Mars", change: 1.9},
  {month: "Avr.", change: 0.8},
  {month: "Mai", change: 0.5},
  {month: "Juin", change: -0.2},
  {month: "Juil.", change: -0.4},
  {month: "Août", change: 0.6}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes des services de restauration, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
  },
  y: {grid: true, label: "Variation en pourcentage", domain: [-1, 2.5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.15 : d.change - 0.15,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Total des ventes de services de restauration (milliards $) | 8,51 | +0,6 % | +5,8 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les ventes des services de restauration et des débits de boissons représentent le total des recettes d'exploitation provenant des ventes d'aliments et de boissons préparés sur place pour consommation immédiate. Les estimations sont désaisonnalisées.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 21-10-0019](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2110001901)
**Enquête :** Enquête mensuelle sur les services de restauration et les débits de boissons
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/2110001901-fra](https://doi.org/10.25318/2110001901-fra)

</div>
