---
title: Les ventes en gros en baisse de 0,9 % en août 2025
verification_json: output/data_20_10_0085_enhanced.json
toc: false
---

# Les ventes en gros en baisse de 0,9 % en août 2025

<p class="release-date">Diffusion : 14 octobre 2025</p>

<div class="highlights">

- Les ventes en gros ont diminué de 0,9 % pour s'établir à 85,5 milliards de dollars en août 2025
- Cette baisse fait suite à une hausse de 1,6 % en juillet
- D'une année à l'autre, les ventes en gros ont augmenté de 4,4 %

</div>

Les ventes en gros ont diminué de 0,9 % pour s'établir à 85,5 milliards de dollars en août 2025, annulant partiellement la hausse de 1,6 % enregistrée en juillet. D'une année à l'autre, les ventes en gros ont augmenté de 4,4 % par rapport à août 2024.

Les ventes ont diminué dans quatre des sept sous-secteurs en août, les grossistes-marchands de machines, de matériel et de fournitures figurant parmi ceux ayant enregistré des baisses.

## Tendance du commerce de gros

Les ventes en gros ont généralement suivi une tendance à la hausse tout au long de 2025, bien qu'août ait marqué un recul par rapport au sommet de juillet.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 20-10-0003 de Statistique Canada
const salesData = [
  {date: new Date("2023-08"), value: 81.4},
  {date: new Date("2023-09"), value: 82.1},
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
  {date: new Date("2025-08"), value: 85.5}
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

Les ventes en gros ont fluctué d'un mois à l'autre en 2025, les hausses enregistrées durant la plupart des mois ayant été compensées par des baisses en avril, mai et août.

```js
const momData = [
  {month: "Jan.", change: 1.3},
  {month: "Fév.", change: 0.6},
  {month: "Mars", change: 0.5},
  {month: "Avr.", change: -2.4},
  {month: "Mai", change: -0.2},
  {month: "Juin", change: 1.3},
  {month: "Juil.", change: 1.6},
  {month: "Août", change: -0.9}
];

display(Plot.plot({
  title: "Variation mensuelle des ventes en gros, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
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

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Ventes en gros (milliards $) | 85,5 | -0,9 % | +4,4 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les données sur le commerce de gros sont désaisonnalisées et exprimées en dollars courants. Les données couvrent les ventes des établissements dont l'activité principale est la vente en gros de marchandises et la prestation de services de logistique, de marketing et de soutien connexes.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0003](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010000301)
**Enquête :** Enquête mensuelle sur le commerce de gros
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/2010000301-fra](https://doi.org/10.25318/2010000301-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-gros-aout-2025", "fr"));
```
