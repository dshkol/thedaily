---
title: Les prix de l'essence en baisse de 4,9 % en octobre 2025
toc: false
---

# Les prix de l'essence en baisse de 4,9 % en octobre 2025

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Le prix moyen de l'essence a diminué de 4,9 % pour s'établir à 137,2 cents le litre en octobre 2025
- D'une année à l'autre, les prix de l'essence ont baissé de 9,5 % par rapport à octobre 2024
- Il s'agit du prix le plus bas depuis avril 2025 (139,2 cents)
- Les prix étaient inférieurs aux niveaux de l'année précédente pour le septième mois consécutif

</div>

Le prix national moyen de l'essence ordinaire sans plomb aux stations libre-service a diminué de 4,9 % pour s'établir à 137,2 cents le litre en octobre 2025, après une hausse de 1,8 % en septembre. D'une année à l'autre, les prix de l'essence ont baissé de 9,5 % par rapport à octobre 2024.

Cette baisse a ramené les prix à leur niveau le plus bas depuis avril 2025, reflétant la faiblesse des prix mondiaux du pétrole brut et une capacité de raffinage abondante.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 18-10-0001 de Statistique Canada
// Essence ordinaire sans plomb aux stations libre-service (cents/litre)
const gasData = [
  {date: new Date("2023-10"), value: 157.4},
  {date: new Date("2023-11"), value: 152.2},
  {date: new Date("2023-12"), value: 145.4},
  {date: new Date("2024-01"), value: 144.1},
  {date: new Date("2024-02"), value: 149.9},
  {date: new Date("2024-03"), value: 157.3},
  {date: new Date("2024-04"), value: 169.8},
  {date: new Date("2024-05"), value: 167.6},
  {date: new Date("2024-06"), value: 162.4},
  {date: new Date("2024-07"), value: 166.5},
  {date: new Date("2024-08"), value: 162.1},
  {date: new Date("2024-09"), value: 150.3},
  {date: new Date("2024-10"), value: 151.6},
  {date: new Date("2024-11"), value: 151.4},
  {date: new Date("2024-12"), value: 150.5},
  {date: new Date("2025-01"), value: 156.7},
  {date: new Date("2025-02"), value: 157.7},
  {date: new Date("2025-03"), value: 154.8},
  {date: new Date("2025-04"), value: 139.2},
  {date: new Date("2025-05"), value: 141.7},
  {date: new Date("2025-06"), value: 140.7},
  {date: new Date("2025-07"), value: 139.6},
  {date: new Date("2025-08"), value: 141.6},
  {date: new Date("2025-09"), value: 144.2},
  {date: new Date("2025-10"), value: 137.2}
];

display(Plot.plot({
  title: "Prix de l'essence ordinaire sans plomb, octobre 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [120, 180], grid: true, label: "Cents le litre"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gasData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gasData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gasData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " ¢", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Variation mensuelle des prix

Les prix de l'essence ont affiché une volatilité importante tout au long de 2025, avec une forte baisse en avril qui a ramené les prix sous les 140 cents le litre pour la première fois depuis le début de 2022.

La baisse d'octobre a suivi une légère hausse en septembre, ramenant les prix près du creux d'avril.

```js
const monthlyData = [
  {month: "Jan.", value: 156.7, change: 4.1},
  {month: "Fév.", value: 157.7, change: 0.6},
  {month: "Mars", value: 154.8, change: -1.8},
  {month: "Avr.", value: 139.2, change: -10.1},
  {month: "Mai", value: 141.7, change: 1.8},
  {month: "Juin", value: 140.7, change: -0.7},
  {month: "Juil.", value: 139.6, change: -0.8},
  {month: "Août", value: 141.6, change: 1.4},
  {month: "Sept.", value: 144.2, change: 1.8},
  {month: "Oct.", value: 137.2, change: -4.9}
];

display(Plot.plot({
  title: "Variation mensuelle des prix en 2025 (%)",
  width: 640,
  height: 260,
  x: {label: null, padding: 0.3, domain: ["Jan.", "Fév.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept.", "Oct."]},
  y: {grid: true, label: "Variation en pourcentage", domain: [-12, 6]},
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

## Comparaison d'une année à l'autre

Les prix d'octobre 2025 étaient inférieurs de 9,5 % à ceux d'octobre 2024, alors que les prix s'élevaient en moyenne à 151,6 cents le litre. Il s'agit du septième mois consécutif où les prix sont inférieurs aux niveaux de l'année précédente.

Les baisses soutenues d'une année à l'autre reflètent la faiblesse des prix mondiaux du pétrole brut par rapport aux niveaux élevés observés en 2024.

<div class="note-to-readers">

## Note aux lecteurs

Les prix de détail de l'essence sont recueillis pour 14 centres urbains à travers le Canada. Les prix représentent les moyennes mensuelles de l'essence ordinaire sans plomb aux stations libre-service.

Les prix de l'essence sont influencés par les prix mondiaux du pétrole brut, les opérations des raffineries, la demande saisonnière, les taxes et les conditions du marché local.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0001](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810000101)
**Enquête :** Prix de détail moyens mensuels de l'essence et du mazout
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1810000101-fra](https://doi.org/10.25318/1810000101-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "prix-essence-octobre-2025", "fr"));
```
