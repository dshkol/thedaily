---
title: Les prix à la consommation en hausse de 2.2 % d'une année à l'autre en octobre 2025
---

# Les prix à la consommation en hausse de 2.2 % d'une année à l'autre en octobre 2025

<p class="release-date">Released: 2025-12-25</p>

<div class="metric-box">
  <div class="value">+2.2%</div>
  <div class="label">Variation d'une année à l'autre de l'Indice des prix à la consommation, octobre 2025</div>
</div>

L'Indice des prix à la consommation (IPC) a augmenté de 2.2 % en octobre 2025 par rapport au même mois un an plus tôt. L'indice s'établissait à 165.3, en hausse par rapport à 161.8 en novembre 2024. Sur une base mensuelle, les prix ont augmenté de 0.2 % par rapport à octobre 2025.

<div class="highlights">

**Faits saillants**

- L'Indice des prix à la consommation a augmenté de 2.2 % d'une année à l'autre en octobre 2025
- Les coûts du food ont augmenté de 4.2 %, la plus forte hausse
- Les prix des household operations, furnishings and equipment ont augmenté de 3.3 % par rapport à octobre l'an dernier
- Manitoba a enregistré la hausse la plus élevée à 3.3 %

</div>

## Tendance de l'inflation d'une année à l'autre

```js
import * as Plot from "npm:@observablehq/plot";

const inflationData = [
  {date: new Date("2025-05"), rate: 1.7},
  {date: new Date("2025-06"), rate: 1.9},
  {date: new Date("2025-07"), rate: 1.7},
  {date: new Date("2025-08"), rate: 1.9},
  {date: new Date("2025-09"), rate: 2.4},
  {date: new Date("2025-10"), rate: 2.2}
];

display(Plot.plot({
  title: "Taux d'inflation d'une année à l'autre (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData, {x: "date", y: "rate", fill: "#AF3C43", r: 4})
  ]
}));
```

## Prix selon les principales composantes

Parmi les huit principales composantes de l'IPC, les prix du food ont affiché la plus forte hausse annuelle, soit 4.2 %. Les coûts hypothécaires et les loyers ont continué d'exercer une pression à la hausse sur cette catégorie.

Les prix des food ont augmenté de 4.2 %.

```js
const components = [
  {name: "Food", change: 4.2},
  {name: "Household operations, furnishings and equipment", change: 3.3},
  {name: "Health and personal care", change: 3.0},
  {name: "Shelter", change: 2.3},
  {name: "Alcoholic beverages, tobacco products and recreational cannabis", change: 1.4},
  {name: "Clothing and footwear", change: 0.8},
  {name: "Transportation", change: 0.7},
  {name: "Recreation, education and reading", change: 0.4}
];

display(Plot.plot({
  title: "Variation annuelle selon la composante (%)",
  width: 640,
  height: 320,
  marginLeft: 140,
  x: {domain: [-1, 5], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(components, {
      y: "name",
      x: "change",
      text: d => d.change.toFixed(1) + "%",
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

Les hausses de prix ont varié d'une province à l'autre. Manitoba a enregistré la hausse annuelle la plus élevée, soit 3.3 %, en raison de la hausse des coûts du logement et du transport. Prince Edward Island a affiché la plus faible hausse, soit 1.4 %.

| Province | Variation annuelle |
|----------|----------------------|
| Manitoba | +3.3% |
| Quebec | +3.0% |
| New Brunswick | +2.7% |
| Nova Scotia | +2.4% |
| Newfoundland and Labrador | +2.2% |
| Saskatchewan | +2.1% |
| British Columbia | +2.0% |
| Ontario | +1.9% |
| Alberta | +1.9% |
| Prince Edward Island | +1.4% |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix à la consommation mesure le taux de variation des prix que subissent les consommateurs canadiens. Il est calculé en comparant le coût d'un panier fixe de biens et de services achetés par les consommateurs au fil du temps.

L'IPC n'est pas désaisonnalisé. Les variations d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances de prix sous-jacentes.

</div>

<div class="source-info">

**Source:** Statistics Canada, Table 18-10-0004
**Enquête:** Indice des prix à la consommation
**Période de référence:** octobre 2025

</div>
