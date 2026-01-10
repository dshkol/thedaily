---
title: Les prix des matières premières en hausse de 5,8 % d'une année à l'autre en octobre 2025
verification_json: output/data_18_10_0268_enhanced.json
toc: false
---

# Les prix des matières premières en hausse de 5,8 % d'une année à l'autre en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des matières premières (IPMP) a augmenté de 1,6 % en octobre 2025
- D'une année à l'autre, les prix des matières premières ont progressé de 5,8 %
- L'indice a atteint 148,4 (2020=100), le niveau le plus élevé depuis avril 2024
- Il s'agit de la deuxième hausse mensuelle consécutive après les baisses d'août

</div>

L'Indice des prix des matières premières (IPMP) a augmenté de 1,6 % en octobre 2025, portant l'indice à 148,4 (2020=100). Ce résultat fait suite à une hausse de 1,7 % en septembre. D'une année à l'autre, les prix des matières premières ont progressé de 5,8 % par rapport à octobre 2024.

La hausse mensuelle reflète le renforcement des prix des produits de base, en particulier dans les minerais métalliques et les matières premières non énergétiques.

```js
import * as Plot from "npm:@observablehq/plot";

const rmpiData = [
  {date: new Date("2023-12"), value: 130.2},
  {date: new Date("2024-01"), value: 131.7},
  {date: new Date("2024-02"), value: 134.4},
  {date: new Date("2024-03"), value: 140.0},
  {date: new Date("2024-04"), value: 147.2},
  {date: new Date("2024-05"), value: 144.9},
  {date: new Date("2024-06"), value: 142.6},
  {date: new Date("2024-07"), value: 143.6},
  {date: new Date("2024-08"), value: 139.4},
  {date: new Date("2024-09"), value: 134.8},
  {date: new Date("2024-10"), value: 140.2},
  {date: new Date("2024-11"), value: 139.8},
  {date: new Date("2024-12"), value: 141.4},
  {date: new Date("2025-01"), value: 146.6},
  {date: new Date("2025-02"), value: 147.3},
  {date: new Date("2025-03"), value: 146.2},
  {date: new Date("2025-04"), value: 141.2},
  {date: new Date("2025-05"), value: 140.2},
  {date: new Date("2025-06"), value: 144.4},
  {date: new Date("2025-07"), value: 144.7},
  {date: new Date("2025-08"), value: 143.6},
  {date: new Date("2025-09"), value: 146.1},
  {date: new Date("2025-10"), value: 148.4}
];

display(Plot.plot({
  title: "Indice des prix des matières premières, décembre 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [125, 155], grid: true, label: "Indice (2020=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(rmpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(rmpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(rmpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle en 2025

Les prix des matières premières ont affiché une volatilité tout au long de 2025. Après avoir diminué au printemps, l'indice a commencé à augmenter en juin et a gagné de l'élan jusqu'en octobre.

```js
const monthlyData = [
  {month: "Jan.", value: 146.6, change: 3.7},
  {month: "Fév.", value: 147.3, change: 0.5},
  {month: "Mars", value: 146.2, change: -0.7},
  {month: "Avr.", value: 141.2, change: -3.4},
  {month: "Mai", value: 140.2, change: -0.7},
  {month: "Juin", value: 144.4, change: 3.0},
  {month: "Juil.", value: 144.7, change: 0.2},
  {month: "Août", value: 143.6, change: -0.8},
  {month: "Sept.", value: 146.1, change: 1.7},
  {month: "Oct.", value: 148.4, change: 1.6}
];

display(Plot.plot({
  title: "Variation mensuelle de l'IPMP, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept.", "Oct."]},
  y: {grid: true, label: "Variation en pourcentage", domain: [-5, 5]},
  marks: [
    Plot.ruleY([0]),
    Plot.barY(monthlyData, {
      x: "month",
      y: "change",
      fill: "#AF3C43"
    }),
    Plot.text(monthlyData, {
      x: "month",
      y: "change",
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      dy: d => d.change >= 0 ? -8 : 8,
      fontSize: 10
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix des matières premières (IPMP) mesure les prix payés par les fabricants canadiens pour les principales matières premières. Il reflète les pressions sur les prix au stade le plus précoce de la chaîne d'approvisionnement manufacturière, avant la transformation en produits finis.

L'IPMP diffère de l'Indice des prix des produits industriels (IPPI), qui mesure les prix que les producteurs reçoivent pour les biens vendus à la sortie de l'usine. Les variations des prix des matières premières peuvent prendre du temps à affecter les prix des produits industriels et, ultimement, les prix à la consommation.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0268](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810026801)
**Enquête :** Indice des prix des matières premières
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1810026801-fra](https://doi.org/10.25318/1810026801-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "prix-matieres-premieres-octobre-2025", "fr"));
```
