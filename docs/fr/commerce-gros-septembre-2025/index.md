---
title: Les ventes en gros en hausse de 0,6 % en septembre 2025
toc: false
---

# Les ventes en gros en hausse de 0,6 % en septembre 2025

<p class="release-date">Diffusion : 14 novembre 2025</p>

<div class="highlights">

- Les ventes en gros ont augmenté de 0,6 % pour atteindre 86,0 milliards de dollars en septembre 2025
- Il s'agissait de la quatrième hausse en cinq mois
- D'une année à l'autre, les ventes en gros ont progressé de 4,1 %

</div>

Les ventes en gros ont augmenté de 0,6 % pour atteindre 86,0 milliards de dollars en septembre 2025, marquant la quatrième hausse en cinq mois. D'une année à l'autre, les ventes en gros ont progressé de 4,1 % par rapport à septembre 2024.

Les ventes ont augmenté dans quatre des sept sous-secteurs en septembre, les grossistes de véhicules automobiles et de pièces ainsi que les grossistes de produits agricoles figurant parmi ceux ayant affiché des hausses.

## Tendance du commerce de gros

Les ventes en gros ont généralement suivi une tendance à la hausse en 2025, passant de 85,2 milliards de dollars en janvier à 86,0 milliards de dollars en septembre.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 20-10-0003 de Statistique Canada
const salesData = [
  {date: new Date("2023-10"), value: 82.3},
  {date: new Date("2023-11"), value: 83.1},
  {date: new Date("2023-12"), value: 83.1},
  {date: new Date("2024-01"), value: 82.6},
  {date: new Date("2024-02"), value: 82.4},
  {date: new Date("2024-03"), value: 81.5},
  {date: new Date("2024-04"), value: 84.1},
  {date: new Date("2024-05"), value: 83.2},
  {date: new Date("2024-06"), value: 82.2},
  {date: new Date("2024-07"), value: 82.5},
  {date: new Date("2024-08"), value: 81.9},
  {date: new Date("2024-09"), value: 82.6},
  {date: new Date("2024-10"), value: 83.9},
  {date: new Date("2024-11"), value: 83.6},
  {date: new Date("2024-12"), value: 84.1},
  {date: new Date("2025-01"), value: 85.2},
  {date: new Date("2025-02"), value: 85.7},
  {date: new Date("2025-03"), value: 86.1},
  {date: new Date("2025-04"), value: 84.0},
  {date: new Date("2025-05"), value: 83.8},
  {date: new Date("2025-06"), value: 84.9},
  {date: new Date("2025-07"), value: 86.3},
  {date: new Date("2025-08"), value: 85.5},
  {date: new Date("2025-09"), value: 86.0}
];

display(Plot.plot({
  title: "Ventes en gros (milliards de dollars)",
  width: 680,
  height: 300,
  y: {domain: [78, 90], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

Les ventes en gros ont fluctué d'un mois à l'autre en 2025, les hausses de la plupart des mois ayant été contrebalancées par des baisses en avril et en mai.

```js
const momData = [
  {month: "Jan.", change: 1.3},
  {month: "Fév.", change: 0.6},
  {month: "Mars", change: 0.5},
  {month: "Avr.", change: -2.4},
  {month: "Mai", change: -0.2},
  {month: "Juin", change: 1.3},
  {month: "Juil.", change: 1.6},
  {month: "Août", change: -0.9},
  {month: "Sept.", change: 0.6}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes en gros, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept."]
  },
  y: {grid: true, label: "Variation en pourcentage", domain: [-3, 2]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.2 : d.change - 0.2,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Ventes en gros (milliards $) | 86,0 | +0,6 % | +4,1 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les données sur le commerce de gros sont désaisonnalisées et exprimées en dollars courants. Les données portent sur les ventes des établissements dont l'activité principale est le commerce de gros de marchandises et la prestation de services connexes de logistique, de marketing et de soutien.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0003](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010000301)
**Enquête :** Enquête mensuelle sur le commerce de gros
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/2010000301-fra](https://doi.org/10.25318/2010000301-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-gros-septembre-2025", "fr"));
```
