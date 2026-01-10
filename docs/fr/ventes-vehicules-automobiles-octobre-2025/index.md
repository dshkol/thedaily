---
title: Les ventes de véhicules automobiles neufs en baisse de 3,1 % en octobre 2025
verification_json: output/data_20_10_0085_enhanced.json
toc: false
---

# Les ventes de véhicules automobiles neufs en baisse de 3,1 % en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes de véhicules automobiles neufs ont totalisé 163 490 unités en octobre 2025
- Les ventes ont diminué de 3,1 % par rapport à septembre et de 0,7 % par rapport à octobre 2024
- Les ventes de camions ont augmenté de 1,1 % sur 12 mois pour atteindre 145 811 unités
- Les ventes de voitures particulières ont diminué de 13,4 % par rapport à octobre 2024

</div>

Les ventes de véhicules automobiles neufs ont totalisé 163 490 unités en octobre 2025, en baisse de 3,1 % par rapport à septembre et de 0,7 % par rapport à octobre 2024. Le recul est attribuable à une forte diminution des ventes de voitures particulières, tandis que les ventes de camions ont légèrement augmenté.

Les camions ont représenté 89,2 % de l'ensemble des ventes de véhicules automobiles neufs en octobre. Les ventes de camions ont atteint 145 811 unités, en hausse de 1,1 % par rapport à octobre 2024. Les ventes de voitures particulières ont diminué à 17 679 unités, soit une baisse de 13,4 % par rapport au même mois un an plus tôt.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 20-10-0085
const salesData = [
  {date: new Date("2023-01"), units: 103355},
  {date: new Date("2023-02"), units: 109580},
  {date: new Date("2023-03"), units: 152546},
  {date: new Date("2023-04"), units: 150339},
  {date: new Date("2023-05"), units: 170834},
  {date: new Date("2023-06"), units: 168850},
  {date: new Date("2023-07"), units: 147618},
  {date: new Date("2023-08"), units: 159668},
  {date: new Date("2023-09"), units: 164168},
  {date: new Date("2023-10"), units: 151978},
  {date: new Date("2023-11"), units: 144634},
  {date: new Date("2023-12"), units: 128827},
  {date: new Date("2024-01"), units: 118094},
  {date: new Date("2024-02"), units: 136410},
  {date: new Date("2024-03"), units: 173465},
  {date: new Date("2024-04"), units: 175815},
  {date: new Date("2024-05"), units: 185178},
  {date: new Date("2024-06"), units: 166941},
  {date: new Date("2024-07"), units: 168310},
  {date: new Date("2024-08"), units: 166153},
  {date: new Date("2024-09"), units: 166757},
  {date: new Date("2024-10"), units: 164692},
  {date: new Date("2024-11"), units: 161535},
  {date: new Date("2024-12"), units: 135511},
  {date: new Date("2025-01"), units: 121258},
  {date: new Date("2025-02"), units: 125402},
  {date: new Date("2025-03"), units: 189046},
  {date: new Date("2025-04"), units: 195659},
  {date: new Date("2025-05"), units: 194524},
  {date: new Date("2025-06"), units: 177219},
  {date: new Date("2025-07"), units: 179801},
  {date: new Date("2025-08"), units: 166524},
  {date: new Date("2025-09"), units: 168731},
  {date: new Date("2025-10"), units: 163490}
];

display(Plot.plot({
  title: "Ventes de véhicules automobiles neufs, janvier 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [80000, 220000], grid: true, label: "Unités"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(salesData, {x: "date", y: "units", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(salesData.slice(-1), {x: "date", y: "units", fill: "#AF3C43", r: 5}),
    Plot.text(salesData.slice(-1), {x: "date", y: "units", text: d => (d.units/1000).toFixed(0) + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Ventes selon le type de véhicule

Les ventes de camions ont continué de dominer le marché canadien des véhicules. En octobre 2025, les camions représentaient 145 811 unités vendues, comparativement à 17 679 voitures particulières.

Sur une base annuelle, les ventes de camions ont augmenté de 1,1 %, tandis que les ventes de voitures particulières ont diminué de 13,4 %. Cette tendance reflète le virage à long terme des consommateurs des voitures particulières vers les camions, y compris les véhicules utilitaires sport et les camionnettes.

```js
// Variation en pourcentage d'une année à l'autre selon le type de véhicule
const yoyData = [
  {type: "Camions", yoy: 1.1},
  {type: "Voitures particulières", yoy: -13.4}
];

display(Plot.plot({
  title: "Variation sur 12 mois selon le type de véhicule, octobre 2025",
  width: 500,
  height: 200,
  marginLeft: 150,
  marginRight: 60,
  x: {domain: [-20, 10], grid: true, label: "Variation sur 12 mois (%)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "type",
      x: "yoy",
      fill: "#AF3C43"
    }),
    Plot.text(yoyData, {
      y: "type",
      x: d => d.yoy >= 0 ? 10 : -20,
      text: d => (d.yoy >= 0 ? "+" : "") + d.yoy.toFixed(1).replace(".", ",") + " %",
      textAnchor: d => d.yoy >= 0 ? "end" : "start",
      fill: "currentColor",
      fontWeight: 600
    })
  ]
}));
```

## Sommaire

| Indicateur | Octobre 2025 | Septembre 2025 | Octobre 2024 | Variation mensuelle | Variation annuelle |
|-----------|--------------|----------------|--------------|---------------------|-------------------|
| Total des véhicules neufs | 163 490 | 168 731 | 164 692 | -3,1 % | -0,7 % |
| Camions | 145 811 | — | 144 273 | — | +1,1 % |
| Voitures particulières | 17 679 | — | 20 419 | — | -13,4 % |

<div class="note-to-readers">

## Note aux lecteurs

Les ventes de véhicules automobiles neufs représentent le nombre de véhicules automobiles neufs vendus par les concessionnaires aux consommateurs et aux entreprises. Les données ne sont pas désaisonnalisées. Les comparaisons d'un mois à l'autre doivent être interprétées avec prudence en raison des tendances saisonnières dans les achats de véhicules.

Les données reflètent les ventes de véhicules chez les concessionnaires de véhicules automobiles neufs et excluent les ventes de véhicules d'occasion. Les camions comprennent les véhicules utilitaires sport, les multisegments, les fourgonnettes, les camionnettes, les autobus et les camionnettes.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0085](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010008501)
**Enquête :** Enquête sur les ventes de véhicules automobiles neufs
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2010008501-fra](https://doi.org/10.25318/2010008501-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "ventes-vehicules-automobiles-octobre-2025", "fr"));
```
