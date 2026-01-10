---
title: Les prix des logements neufs en baisse de 0,4 % en octobre 2025
verification_json: output/nhpi.json
toc: false
---

# Les prix des logements neufs en baisse de 0,4 % en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des logements neufs a diminué de 0,4 % pour s'établir à 122,2 en octobre 2025
- Il s'agit du septième mois consécutif de baisse depuis avril
- L'indice a reculé de 1,9 % depuis son sommet de 2025 de 124,5 en mars
- Les prix des logements neufs ont diminué régulièrement tout au long de 2025

</div>

L'Indice des prix des logements neufs (IPLN) a diminué de 0,4 % pour s'établir à 122,2 en octobre 2025, poursuivant une tendance à la baisse des prix des logements neufs qui a débuté en avril.

La baisse d'octobre marque le septième mois consécutif de diminution des prix, l'indice étant passé de 124,0 en avril à 122,2 en octobre — une baisse cumulative de 1,5 %.

```js
import * as Plot from "npm:@observablehq/plot";

const nhpiData = [
  {date: new Date("2024-11"), value: 124.6},
  {date: new Date("2024-12"), value: 124.5},
  {date: new Date("2025-01"), value: 124.4},
  {date: new Date("2025-02"), value: 124.5},
  {date: new Date("2025-03"), value: 124.5},
  {date: new Date("2025-04"), value: 124.0},
  {date: new Date("2025-05"), value: 123.7},
  {date: new Date("2025-06"), value: 123.4},
  {date: new Date("2025-07"), value: 123.3},
  {date: new Date("2025-08"), value: 122.9},
  {date: new Date("2025-09"), value: 122.7},
  {date: new Date("2025-10"), value: 122.2}
];

display(Plot.plot({
  title: "Indice des prix des logements neufs, novembre 2024 à octobre 2025 (2016=100)",
  width: 680,
  height: 300,
  y: {domain: [120, 126], grid: true, label: "Indice (2016=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(nhpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(nhpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(nhpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle des prix en 2025

Les prix des logements neufs ont diminué au cours de sept des dix premiers mois de 2025. Après de modestes hausses en janvier et février, les prix ont commencé à baisser en mars et ont continué de diminuer jusqu'en octobre.

```js
const monthlyData = [
  {month: "Jan.", value: 124.4, change: -0.1},
  {month: "Fév.", value: 124.5, change: 0.1},
  {month: "Mars", value: 124.5, change: 0.0},
  {month: "Avr.", value: 124.0, change: -0.4},
  {month: "Mai", value: 123.7, change: -0.2},
  {month: "Juin", value: 123.4, change: -0.2},
  {month: "Juil.", value: 123.3, change: -0.1},
  {month: "Août", value: 122.9, change: -0.3},
  {month: "Sept.", value: 122.7, change: -0.2},
  {month: "Oct.", value: 122.2, change: -0.4}
];

display(Plot.plot({
  title: "Variation mensuelle de l'IPLN, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept.", "Oct."]},
  y: {grid: true, label: "Variation en pourcentage", domain: [-0.6, 0.3]},
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

L'Indice des prix des logements neufs mesure les variations dans le temps des prix de vente des entrepreneurs pour les maisons résidentielles neuves. L'indice utilise 2016 comme période de base (2016=100).

Cet article est une reconstitution fondée sur des données de séries chronologiques vérifiées. Les comparaisons d'une année à l'autre ne sont pas incluses car les séries chronologiques disponibles ne s'étendent pas jusqu'à octobre 2024.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0205](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810020501)
**Enquête :** Indice des prix des logements neufs
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1810020501-fra](https://doi.org/10.25318/1810020501-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "indice-prix-logements-neufs-octobre-2025", "fr"));
```
