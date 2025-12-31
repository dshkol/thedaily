---
title: La production d'électricité en baisse de 4,8 % en août 2025
toc: false
---

# La production d'électricité en baisse de 4,8 % en août 2025

<p class="release-date">Diffusion : 25 novembre 2025</p>

<div class="highlights">

- La production d'électricité a diminué de 4,8 % pour s'établir à 47,6 TWh en août 2025
- La production a diminué par rapport au sommet de juillet de 50,0 TWh
- L'hydroélectricité a représenté la majorité de la production
- D'une année à l'autre, la production a diminué d'environ 3,0 %

</div>

La production d'électricité au Canada a totalisé 47,6 térawattheures (TWh) en août 2025, en baisse de 4,8 % par rapport aux 50,0 TWh de juillet. Cette baisse reflète la tendance typique de la fin de l'été alors que les températures se modèrent et que la demande d'électricité pour la climatisation diminue.

## Tendance mensuelle de la production

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 25-10-0015 de Statistique Canada
const generationData = [
  {date: new Date("2024-08"), value: 49.1},
  {date: new Date("2024-09"), value: 45.5},
  {date: new Date("2024-10"), value: 47.3},
  {date: new Date("2024-11"), value: 50.3},
  {date: new Date("2024-12"), value: 61.6},
  {date: new Date("2025-01"), value: 66.8},
  {date: new Date("2025-02"), value: 59.2},
  {date: new Date("2025-03"), value: 56.6},
  {date: new Date("2025-04"), value: 48.8},
  {date: new Date("2025-05"), value: 46.5},
  {date: new Date("2025-06"), value: 46.0},
  {date: new Date("2025-07"), value: 50.0},
  {date: new Date("2025-08"), value: 47.6}
];

display(Plot.plot({
  title: "Production d'électricité, août 2024 à août 2025",
  width: 680,
  height: 300,
  y: {domain: [40, 70], grid: true, label: "Térawattheures (TWh)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(generationData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(generationData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(generationData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " TWh", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

La production d'électricité a atteint un sommet en janvier 2025 à 66,8 TWh pendant la saison de chauffage hivernale, puis a diminué au printemps avant une légère hausse estivale en juillet.

```js
const momData = [
  {month: "Jan.", change: 8.4},
  {month: "Fév.", change: -11.4},
  {month: "Mars", change: -4.4},
  {month: "Avr.", change: -13.8},
  {month: "Mai", change: -4.7},
  {month: "Juin", change: -1.1},
  {month: "Juil.", change: 8.7},
  {month: "Août", change: -4.8}
];

display(Plot.plot({
  title: "Variation mensuelle de la production d'électricité, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août"]
  },
  y: {grid: true, label: "Variation en pourcentage", domain: [-16, 12]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.8 : d.change - 0.8,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Production totale (TWh) | 47,6 | -4,8 % | -3,0 % |

<div class="note-to-readers">

**Note aux lecteurs**

Les données sur la production d'électricité comprennent l'électricité produite par les services publics d'électricité, les établissements industriels qui produisent de l'électricité pour leur propre usage et les autres producteurs d'électricité. Un térawattheure équivaut à 1 000 gigawattheures ou 1 000 000 mégawattheures.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 25-10-0015](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2510001501)
**Enquête :** Enquête mensuelle sur la production, les livraisons, les achats et les ventes d'électricité
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/2510001501-fra](https://doi.org/10.25318/2510001501-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "production-electricite-aout-2025", "fr"));
```
