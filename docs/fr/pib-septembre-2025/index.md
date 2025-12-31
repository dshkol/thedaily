---
title: Le PIB réel en hausse de 0,2 % en septembre 2025
toc: false
---

# Le PIB réel en hausse de 0,2 % en septembre 2025

<p class="release-date">Diffusion : 29 novembre 2025</p>

<div class="highlights">

- Le produit intérieur brut réel a augmenté de 0,2 % en septembre 2025
- D'une année à l'autre, le PIB réel a progressé de 1,1 % par rapport à septembre 2024
- Le secteur des services a été le principal moteur de la croissance

</div>

Le produit intérieur brut (PIB) réel a augmenté de 0,2 % en septembre 2025, après une baisse de 0,1 % en août. D'une année à l'autre, le PIB réel a progressé de 1,1 % par rapport à septembre 2024.

La hausse mensuelle a été attribuable à la croissance des industries productrices de services, tandis que les industries productrices de biens sont demeurées relativement stables.

## Tendance du PIB

Le PIB réel a affiché une croissance modeste tout au long de 2025, l'économie passant de 2 317 milliards de dollars en octobre 2024 à 2 334 milliards de dollars en septembre 2025.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du tableau 36-10-0434 de Statistique Canada (milliards de dollars enchaînés de 2017)
const gdpData = [
  {date: new Date("2023-10"), value: 2253.5},
  {date: new Date("2023-11"), value: 2259.5},
  {date: new Date("2023-12"), value: 2256.7},
  {date: new Date("2024-01"), value: 2262.8},
  {date: new Date("2024-02"), value: 2276.5},
  {date: new Date("2024-03"), value: 2277.5},
  {date: new Date("2024-04"), value: 2285.6},
  {date: new Date("2024-05"), value: 2289.0},
  {date: new Date("2024-06"), value: 2294.1},
  {date: new Date("2024-07"), value: 2298.6},
  {date: new Date("2024-08"), value: 2301.3},
  {date: new Date("2024-09"), value: 2307.5},
  {date: new Date("2024-10"), value: 2317.1},
  {date: new Date("2024-11"), value: 2312.3},
  {date: new Date("2024-12"), value: 2317.0},
  {date: new Date("2025-01"), value: 2327.2},
  {date: new Date("2025-02"), value: 2322.4},
  {date: new Date("2025-03"), value: 2324.4},
  {date: new Date("2025-04"), value: 2320.9},
  {date: new Date("2025-05"), value: 2317.7},
  {date: new Date("2025-06"), value: 2317.1},
  {date: new Date("2025-07"), value: 2329.4},
  {date: new Date("2025-08"), value: 2328.1},
  {date: new Date("2025-09"), value: 2333.7}
];

display(Plot.plot({
  title: "PIB réel, octobre 2023 à septembre 2025 (milliards de dollars enchaînés de 2017)",
  width: 680,
  height: 300,
  y: {domain: [2240, 2350], grid: true, label: "Milliards $ (enchaînés de 2017)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gdpData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gdpData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gdpData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(0).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

La croissance du PIB en 2025 a été inégale, les hausses de certains mois ayant été contrebalancées par des baisses dans d'autres.

```js
const momData = [
  {month: "Jan.", change: 0.4},
  {month: "Fév.", change: -0.2},
  {month: "Mars", change: 0.1},
  {month: "Avr.", change: -0.2},
  {month: "Mai", change: -0.1},
  {month: "Juin", change: 0.0},
  {month: "Juil.", change: 0.5},
  {month: "Août", change: -0.1},
  {month: "Sept.", change: 0.2}
];

display(Plot.plot({
  title: "Variation mensuelle du PIB réel, 2025 (%)",
  width: 600,
  height: 280,
  x: {
    label: null,
    padding: 0.3,
    domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept."]
  },
  y: {grid: true, label: "Variation en pourcentage", domain: [-0.5, 0.7]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(momData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(momData, {
      x: "month",
      y: d => d.change >= 0 ? d.change + 0.05 : d.change - 0.05,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      fontSize: 10
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| PIB réel (milliards $) | 2 333,7 | +0,2 % | +1,1 % |

<div class="note-to-readers">

**Note aux lecteurs**

Le PIB réel par industrie est mesuré aux prix de base en dollars enchaînés de 2017. Les estimations sont désaisonnalisées.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 36-10-0434](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3610043401)
**Enquête :** Produit intérieur brut mensuel par industrie
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/3610043401-fra](https://doi.org/10.25318/3610043401-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "pib-septembre-2025", "fr"));
```
