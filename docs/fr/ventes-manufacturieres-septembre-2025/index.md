---
title: Les ventes du secteur manufacturier en hausse de 3,6 % en septembre 2025
toc: false
---

# Les ventes du secteur manufacturier en hausse de 3,6 % en septembre 2025

<p class="release-date">Diffusion : 15 novembre 2025</p>

<div class="highlights">

- Les ventes du secteur manufacturier ont augmenté de 3,6 % pour atteindre 72,2 milliards de dollars en septembre 2025
- Il s'agit de la plus forte hausse mensuelle depuis janvier 2025
- D'une année à l'autre, les ventes ont progressé de 3,0 %

</div>

Les ventes du secteur manufacturier ont augmenté de 3,6 % pour s'établir à 72,2 milliards de dollars en septembre 2025, après avoir reculé de 1,1 % en août. Il s'agit de la plus forte hausse mensuelle depuis janvier, alors que les ventes avaient progressé de 1,4 %.

D'une année à l'autre, les ventes du secteur manufacturier ont augmenté de 3,0 % par rapport à septembre 2024, lorsqu'elles s'établissaient à 70,2 milliards de dollars.

## Tendance des ventes

Les ventes du secteur manufacturier ont fluctué tout au long de 2025, avec des baisses au printemps suivies d'une reprise durant les mois d'été. La hausse de septembre a ramené les ventes près des niveaux observés au début de l'année.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
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
  {date: new Date("2025-08-01"), value: 69.75},
  {date: new Date("2025-09-01"), value: 72.23}
];

display(Plot.plot({
  title: "Ventes du secteur manufacturier, Canada (milliards de dollars, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [67, 74],
    grid: true,
    label: "Milliards ($)"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(salesData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    })
  ]
}));
```

## Variations mensuelles en 2025

Les ventes ont été volatiles en 2025, la hausse de septembre faisant suite aux baisses enregistrées de mars à mai.

```js
const monthlyChanges = [
  {month: "Jan.", change: 1.38},
  {month: "Fév.", change: -0.52},
  {month: "Mars", change: -1.57},
  {month: "Avr.", change: -2.73},
  {month: "Mai", change: -1.51},
  {month: "Juin", change: 0.94},
  {month: "Juil.", change: 2.28},
  {month: "Août", change: -1.07},
  {month: "Sept.", change: 3.56}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes du secteur manufacturier, 2025 (%)",
  width: 700,
  height: 350,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept."]
  },
  y: {
    grid: true,
    label: "Variation en pourcentage",
    domain: [-4, 5]
  },
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyChanges, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyChanges, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.3 : d.change - 0.3,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Ventes manufacturières (milliards $) | 72,2 | +3,6 % | +3,0 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les ventes manufacturières sont exprimées en dollars courants et sont désaisonnalisées. L'Enquête mensuelle sur les industries manufacturières couvre l'ensemble des industries manufacturières au Canada.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 16-10-0047](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1610004701)
**Enquête :** Enquête mensuelle sur les industries manufacturières
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/1610004701-fra](https://doi.org/10.25318/1610004701-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "ventes-manufacturieres-septembre-2025", "fr"));
```
