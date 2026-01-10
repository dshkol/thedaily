---
title: Les ventes au détail en baisse de 0,9 % en septembre 2025
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail en baisse de 0,9 % en septembre 2025

<p class="release-date">Diffusion : 22 novembre 2025</p>

<div class="highlights">

- Les ventes au détail ont diminué de 0,9 % pour s'établir à 69,6 milliards de dollars en septembre 2025
- Ce recul fait suite à une baisse de 0,6 % en août
- D'une année à l'autre, les ventes au détail ont augmenté de 3,1 %

</div>

Les ventes au détail ont reculé de 0,9 % pour atteindre 69,6 milliards de dollars en septembre 2025, après une baisse de 0,6 % en août. D'une année à l'autre, le commerce de détail a progressé de 3,1 % par rapport à septembre 2024, alors que les ventes s'établissaient à 67,5 milliards de dollars.

Le recul de septembre marque la deuxième baisse mensuelle consécutive, bien que les ventes au détail demeurent bien au-dessus des niveaux de l'année précédente.

## Tendance des ventes

Les ventes au détail ont fluctué au cours de 2025, atteignant un sommet de 70,2 milliards de dollars en août avant de diminuer les mois suivants.

```js
import * as Plot from "npm:@observablehq/plot";

const salesData = [
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51},
  {date: new Date("2024-10-01"), value: 68.04},
  {date: new Date("2024-11-01"), value: 68.30},
  {date: new Date("2024-12-01"), value: 70.03},
  {date: new Date("2025-01-01"), value: 69.65},
  {date: new Date("2025-02-01"), value: 69.19},
  {date: new Date("2025-03-01"), value: 69.80},
  {date: new Date("2025-04-01"), value: 70.02},
  {date: new Date("2025-05-01"), value: 69.16},
  {date: new Date("2025-06-01"), value: 70.14},
  {date: new Date("2025-07-01"), value: 69.53},
  {date: new Date("2025-08-01"), value: 70.22},
  {date: new Date("2025-09-01"), value: 69.60}
];

display(Plot.plot({
  title: "Ventes au détail, Canada (milliards de dollars, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [64, 72],
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

Les ventes au détail ont été volatiles en 2025, le recul de septembre faisant suite à une période de résultats mitigés.

```js
const monthlyChanges = [
  {month: "Jan.", change: -0.5},
  {month: "Fév.", change: -0.7},
  {month: "Mars", change: 0.9},
  {month: "Avr.", change: 0.3},
  {month: "Mai", change: -1.2},
  {month: "Juin", change: 1.4},
  {month: "Juil.", change: -0.9},
  {month: "Août", change: 1.0},
  {month: "Sept.", change: -0.9}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes au détail, 2025 (%)",
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
    domain: [-2, 2]
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
      y: d => d.change >= 0 ? d.change + 0.15 : d.change - 0.15,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Ventes au détail (milliards $) | 69,6 | -0,9 % | +3,1 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les estimations du commerce de détail sont exprimées en dollars courants et sont désaisonnalisées. L'Enquête mensuelle sur le commerce de détail couvre les entreprises de commerce de détail à travers le Canada.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-septembre-2025", "fr"));
```
