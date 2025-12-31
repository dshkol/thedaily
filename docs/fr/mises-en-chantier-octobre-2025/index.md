---
title: Les mises en chantier ont diminué de 17,4 % pour atteindre 232 000 unités en octobre 2025
toc: false
---

# Les mises en chantier ont diminué de 17,4 % pour atteindre 232 000 unités en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les mises en chantier ont diminué de 17,4 % pour s'établir à un taux annuel désaisonnalisé de 232 000 unités en octobre 2025
- Ce résultat fait suite à un mois de septembre solide à 281 000 unités
- Le mois d'octobre a marqué le niveau le plus bas depuis février 2025 (221 000 unités)
- Cette baisse a inversé les gains observés pendant les mois d'été

</div>

Les mises en chantier ont diminué de 17,4 % pour s'établir à un taux annuel désaisonnalisé de 232 000 unités en octobre 2025, en baisse par rapport aux 281 000 unités de septembre. Il s'agit d'un net renversement après une activité de construction relativement soutenue pendant les mois d'été.

Le niveau d'octobre était le plus bas depuis février 2025, lorsque les mises en chantier avaient atteint 221 000 unités.

```js
import * as Plot from "npm:@observablehq/plot";

const startsData = [
  {date: new Date("2024-11"), value: 267},
  {date: new Date("2024-12"), value: 232},
  {date: new Date("2025-01"), value: 233},
  {date: new Date("2025-02"), value: 221},
  {date: new Date("2025-03"), value: 214},
  {date: new Date("2025-04"), value: 282},
  {date: new Date("2025-05"), value: 282},
  {date: new Date("2025-06"), value: 282},
  {date: new Date("2025-07"), value: 293},
  {date: new Date("2025-08"), value: 244},
  {date: new Date("2025-09"), value: 281},
  {date: new Date("2025-10"), value: 232}
];

display(Plot.plot({
  title: "Mises en chantier, novembre 2024 à octobre 2025 (milliers d'unités, TAD)",
  width: 680,
  height: 300,
  y: {domain: [200, 310], grid: true, label: "Milliers d'unités"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(startsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(startsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(startsData.slice(-1), {x: "date", y: "value", text: d => d.value + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Tendance mensuelle

Les mises en chantier ont affiché une volatilité considérable tout au long de 2025. Après avoir atteint un creux de 214 000 unités en mars, les mises en chantier ont augmenté fortement en avril et sont restées élevées jusqu'en septembre, avant la baisse d'octobre.

```js
const monthlyData = [
  {month: "Jan.", value: 233, change: 0.4},
  {month: "Fév.", value: 221, change: -5.2},
  {month: "Mars", value: 214, change: -3.2},
  {month: "Avr.", value: 282, change: 31.8},
  {month: "Mai", value: 282, change: 0.0},
  {month: "Juin", value: 282, change: 0.0},
  {month: "Juil.", value: 293, change: 3.9},
  {month: "Août", value: 244, change: -16.7},
  {month: "Sept.", value: 281, change: 15.2},
  {month: "Oct.", value: 232, change: -17.4}
];

display(Plot.plot({
  title: "Variation mensuelle des mises en chantier, 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept.", "Oct."]},
  y: {grid: true, label: "Variation en pourcentage", domain: [-25, 40]},
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

Les mises en chantier sont déclarées sous forme de taux annuel désaisonnalisé (TAD), qui représente le nombre d'unités d'habitation qui seraient mises en chantier en un an si le rythme du mois en cours était maintenu.

Cet article est une reconstitution fondée sur des données de séries chronologiques vérifiées. Les comparaisons d'une année à l'autre ne sont pas incluses car les séries chronologiques disponibles ne s'étendent pas jusqu'à octobre 2024.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 34-10-0158](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3410015801)
**Enquête :** Société canadienne d'hypothèques et de logement, Mises en chantier d'habitations
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/3410015801-fra](https://doi.org/10.25318/3410015801-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "mises-en-chantier-octobre-2025", "fr"));
```
