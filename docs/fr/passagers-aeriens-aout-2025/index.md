---
title: Le nombre de passagers aériens en baisse de 1,9 % en août 2025 par rapport au sommet estival
verification_json: output/data_23_10_0079_enhanced.json
toc: false
---

# Le nombre de passagers aériens en baisse de 1,9 % en août 2025 par rapport au sommet estival

<p class="release-date">Diffusion : 23 octobre 2025</p>

<div class="highlights">

- Les grands transporteurs aériens canadiens ont transporté 8,1 millions de passagers en août 2025, en baisse de 1,9 % par rapport à juillet
- D'une année à l'autre, le nombre de passagers a augmenté de 3,7 % par rapport à août 2024
- Août a marqué un léger recul par rapport au sommet estival de juillet de 8,3 millions
- Le coefficient d'occupation est demeuré élevé à 84,2 %

</div>

Les grands transporteurs aériens canadiens ont transporté 8,1 millions de passagers en août 2025, en baisse de 1,9 % par rapport au sommet de juillet de 8,3 millions. Malgré le recul mensuel, le nombre de passagers est demeuré élevé durant la haute saison estivale.

Par rapport à août 2024, le nombre de passagers a augmenté de 3,7 %, poursuivant la tendance de reprise d'une année à l'autre observée tout au long de 2025.

## Tendance mensuelle du nombre de passagers

```js
import * as Plot from "npm:@observablehq/plot";

const passengerData = [
  {date: new Date("2023-08"), value: 7.58},
  {date: new Date("2023-09"), value: 6.85},
  {date: new Date("2023-10"), value: 6.72},
  {date: new Date("2023-11"), value: 6.21},
  {date: new Date("2023-12"), value: 7.05},
  {date: new Date("2024-01"), value: 6.65},
  {date: new Date("2024-02"), value: 6.25},
  {date: new Date("2024-03"), value: 7.18},
  {date: new Date("2024-04"), value: 6.75},
  {date: new Date("2024-05"), value: 6.88},
  {date: new Date("2024-06"), value: 7.28},
  {date: new Date("2024-07"), value: 8.02},
  {date: new Date("2024-08"), value: 7.85},
  {date: new Date("2024-09"), value: 7.04},
  {date: new Date("2024-10"), value: 6.99},
  {date: new Date("2024-11"), value: 6.49},
  {date: new Date("2024-12"), value: 7.32},
  {date: new Date("2025-01"), value: 6.90},
  {date: new Date("2025-02"), value: 6.49},
  {date: new Date("2025-03"), value: 7.45},
  {date: new Date("2025-04"), value: 7.00},
  {date: new Date("2025-05"), value: 7.14},
  {date: new Date("2025-06"), value: 7.55},
  {date: new Date("2025-07"), value: 8.30},
  {date: new Date("2025-08"), value: 8.14}
];

display(Plot.plot({
  title: "Passagers aériens, août 2023 à août 2025 (millions)",
  width: 680,
  height: 300,
  y: {domain: [5.5, 9], grid: true, label: "Millions de passagers"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

Le nombre de passagers aériens en 2025 a atteint un sommet en juillet avec 8,3 millions de passagers, août affichant un léger recul alors que les voyages estivaux commençaient à diminuer.

```js
const momData = [
  {month: "Jan.", change: -5.7},
  {month: "Fév.", change: -5.9},
  {month: "Mars", change: 14.8},
  {month: "Avr.", change: -6.0},
  {month: "Mai", change: 2.0},
  {month: "Juin", change: 5.7},
  {month: "Juil.", change: 9.9},
  {month: "Août", change: -1.9}
];

display(Plot.plot({
  title: "Variation mensuelle du nombre de passagers aériens, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
  },
  y: {grid: true, label: "Variation en pourcentage", domain: [-10, 18]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 1.0 : d.change - 1.0,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 9
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Passagers (millions) | 8,14 | -1,9 % | +3,7 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les données couvrent les statistiques d'exploitation et financières des grands transporteurs aériens canadiens. Le nombre de passagers comprend les voyages intérieurs et internationaux effectués par les transporteurs canadiens.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 23-10-0079](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2310007901)
**Enquête :** Enquête mensuelle de l'aviation civile
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/2310007901-fra](https://doi.org/10.25318/2310007901-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "passagers-aeriens-aout-2025", "fr"));
```
