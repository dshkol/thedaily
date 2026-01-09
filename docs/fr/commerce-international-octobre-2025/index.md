---
title: Le Canada affiche un déficit commercial de 583 millions de dollars en octobre 2025
toc: false
---

# Le Canada affiche un déficit commercial de 583 millions de dollars en octobre 2025

<p class="release-date">Diffusion : 8 janvier 2026 <span class="article-type-tag release">Nouvelle diffusion</span></p>

<div class="highlights">

**Faits saillants**

- Les exportations de marchandises ont augmenté de 2,1 % pour atteindre 65,6 milliards de dollars en octobre 2025
- Les importations ont progressé de 3,4 % pour s'établir à 66,2 milliards de dollars
- Le solde commercial du Canada est passé d'un excédent de 243 millions de dollars en septembre à un déficit de 583 millions de dollars en octobre
- L'excédent commercial avec les États-Unis s'est rétréci de 8,4 milliards de dollars à 4,8 milliards de dollars

</div>

Les exportations de marchandises ont augmenté de 2,1 % pour atteindre 65,6 milliards de dollars en octobre 2025, tandis que les importations ont progressé de 3,4 % pour s'établir à 66,2 milliards de dollars. Le solde commercial du Canada avec le monde est passé d'un léger excédent de 243 millions de dollars en septembre à un déficit de 583 millions de dollars en octobre.

Les exportations de métaux et de produits minéraux non métalliques ont augmenté de 27,3 % pour atteindre un niveau record, en raison des exportations d'or brut, d'argent et de métaux du groupe du platine. Excluant ce groupe de produits, les exportations totales ont diminué de 2,5 %.

```js
import * as Plot from "npm:@observablehq/plot";

// Données de Statistique Canada, Tableau 12-10-0011
const tradeData = [
  {date: new Date("2024-10"), exports: 65.1, imports: 65.6},
  {date: new Date("2024-11"), exports: 66.4, imports: 67.0},
  {date: new Date("2024-12"), exports: 69.9, imports: 69.2},
  {date: new Date("2025-01"), exports: 72.9, imports: 69.2},
  {date: new Date("2025-02"), exports: 68.8, imports: 69.9},
  {date: new Date("2025-03"), exports: 67.5, imports: 69.4},
  {date: new Date("2025-04"), exports: 60.0, imports: 67.3},
  {date: new Date("2025-05"), exports: 61.0, imports: 66.8},
  {date: new Date("2025-06"), exports: 61.5, imports: 67.1},
  {date: new Date("2025-07"), exports: 62.4, imports: 66.2},
  {date: new Date("2025-08"), exports: 60.4, imports: 66.8},
  {date: new Date("2025-09"), exports: 64.3, imports: 64.0},
  {date: new Date("2025-10"), exports: 65.6, imports: 66.2}
];

display(Plot.plot({
  title: "Commerce de marchandises, octobre 2024 à octobre 2025 (en milliards $)",
  width: 680,
  height: 320,
  y: {domain: [55, 75], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "exports", fill: "#AF3C43", r: 5}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "imports", fill: "#1f77b4", r: 5}),
    Plot.text([{x: new Date("2025-05"), y: 73, text: "Exportations"}], {x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 12}),
    Plot.text([{x: new Date("2025-05"), y: 70, text: "Importations"}], {x: "x", y: "y", text: "text", fill: "#1f77b4", fontSize: 12})
  ]
}));
```

## Commerce avec les États-Unis

L'excédent commercial du Canada avec les États-Unis s'est rétréci, passant de 8,4 milliards de dollars en septembre à 4,8 milliards de dollars en octobre. Les exportations canadiennes vers les États-Unis ont diminué de 3,4 %, tandis que les importations en provenance des États-Unis ont augmenté de 5,3 %.

Depuis le début de l'année, les exportations vers les États-Unis ont diminué de 4,1 % par rapport à la même période en 2024.

## Commerce avec les autres pays

Les exportations vers les pays autres que les États-Unis ont augmenté de 15,6 % pour atteindre un niveau record en octobre. La hausse des exportations vers le Royaume-Uni (or) et la Chine (pétrole brut) ont contribué le plus à cette croissance.

Le déficit commercial du Canada avec les pays autres que les États-Unis s'est rétréci, passant de 8,1 milliards de dollars en septembre à 5,4 milliards de dollars en octobre — le plus bas déficit depuis janvier 2021.

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce international de marchandises mesurent la valeur des biens qui franchissent les frontières du Canada. Les données sont désaisonnalisées.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1210001101)
**Enquête :** Commerce international canadien de marchandises
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1210001101-fra](https://doi.org/10.25318/1210001101-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-international-octobre-2025", "fr"));
```
