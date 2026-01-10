---
title: L'achalandage du transport en commun en baisse de 3,6 % en octobre 2025 malgre des revenus en hausse
verification_json: output/data_23_10_0253_enhanced.json
toc: false
---

# L'achalandage du transport en commun en baisse de 3,6 % en octobre 2025 malgre des revenus en hausse

<p class="release-date">Diffusion : 30 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les reseaux de transport en commun ont enregistre 142,6 millions de deplacements en octobre 2025, en baisse de 3,6 % par rapport a octobre 2024
- D'un mois a l'autre, l'achalandage a augmente de 3,2 % par rapport a septembre 2025
- Les revenus totaux ont augmente de 2,8 % d'une annee a l'autre pour atteindre 362,7 millions de dollars
- Les Prairies, la Colombie-Britannique et les territoires ont connu la plus forte baisse a -7,5 %

</div>

Les reseaux de transport en commun au Canada ont enregistre 142,6 millions de deplacements de passagers en octobre 2025, une baisse de 3,6 % par rapport a octobre 2024. Sur une base mensuelle, l'achalandage a augmente de 3,2 % par rapport aux 138,2 millions de deplacements en septembre 2025.

Malgre une baisse de l'achalandage, les revenus d'exploitation totaux (a l'exclusion des subventions) ont augmente de 2,8 % d'une annee a l'autre pour atteindre 362,7 millions de dollars, ce qui suggere une hausse des tarifs moyens.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, Tableau 23-10-0251
const tripsData = [
  {date: new Date("2024-10"), value: 148.0},
  {date: new Date("2024-11"), value: 139.9},
  {date: new Date("2024-12"), value: 127.7},
  {date: new Date("2025-01"), value: 132.0},
  {date: new Date("2025-02"), value: 122.0},
  {date: new Date("2025-03"), value: 137.3},
  {date: new Date("2025-04"), value: 134.4},
  {date: new Date("2025-05"), value: 133.6},
  {date: new Date("2025-06"), value: 125.5},
  {date: new Date("2025-07"), value: 124.0},
  {date: new Date("2025-08"), value: 122.2},
  {date: new Date("2025-09"), value: 138.2},
  {date: new Date("2025-10"), value: 142.6}
];

display(Plot.plot({
  title: "Deplacements en transport en commun, octobre 2024 a octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [115, 155], grid: true, label: "Millions de deplacements"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(tripsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(tripsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(tripsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Revenus par rapport a l'achalandage

Alors que les deplacements de passagers ont diminue de 3,6 % d'une annee a l'autre, les revenus d'exploitation ont augmente de 2,8 %, elargissant l'ecart entre la reprise de l'achalandage et la performance des revenus observe depuis la pandemie.

```js
const revenueData = [
  {date: new Date("2024-10"), value: 352.9},
  {date: new Date("2024-11"), value: 349.7},
  {date: new Date("2024-12"), value: 328.2},
  {date: new Date("2025-01"), value: 322.5},
  {date: new Date("2025-02"), value: 305.8},
  {date: new Date("2025-03"), value: 341.0},
  {date: new Date("2025-04"), value: 329.2},
  {date: new Date("2025-05"), value: 334.0},
  {date: new Date("2025-06"), value: 324.0},
  {date: new Date("2025-07"), value: 326.3},
  {date: new Date("2025-08"), value: 331.2},
  {date: new Date("2025-09"), value: 359.9},
  {date: new Date("2025-10"), value: 362.7}
];

display(Plot.plot({
  title: "Revenus d'exploitation du transport en commun, octobre 2024 a octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [290, 380], grid: true, label: "Millions de dollars"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(revenueData, {x: "date", y: "value", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(revenueData.slice(-1), {x: "date", y: "value", fill: "#1f77b4", r: 5}),
    Plot.text(revenueData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(0).replace(".", ",") + " M $", dy: -12, fill: "#1f77b4", fontWeight: 600})
  ]
}));
```

## Repartition regionale

Le Quebec et l'Ontario ont represente 66,8 % de l'achalandage total avec 95,3 millions de deplacements, en baisse de 1,9 % par rapport a octobre 2024. Les Prairies, la Colombie-Britannique et les territoires ont enregistre la plus forte baisse d'une annee a l'autre a 7,5 %, tombant a 44,2 millions de deplacements.

Le Canada atlantique a declare 3,1 millions de deplacements, inchange par rapport a un an plus tot.

```js
const regionalData = [
  {region: "Quebec et Ontario", value: 95.3, yoy: -1.9},
  {region: "Prairies, C.-B. et territoires", value: 44.2, yoy: -7.5},
  {region: "Atlantique", value: 3.1, yoy: 0.0}
];

display(Plot.plot({
  title: "Achalandage du transport en commun par region, octobre 2025 (millions de deplacements)",
  width: 680,
  height: 220,
  marginLeft: 200,
  marginRight: 120,
  x: {grid: true, label: "Millions de deplacements"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(regionalData, {
      y: "region",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(regionalData, {
      y: "region",
      x: d => d.value + 2,
      text: d => d.value.toFixed(1).replace(".", ",") + " M (" + (d.yoy >= 0 ? "+" : "") + d.yoy.toFixed(1).replace(".", ",") + " % A/A)",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

### Variation d'une annee a l'autre par region

```js
const yoyRegional = [
  {region: "Atlantique", change: 0.0},
  {region: "Quebec et Ontario", change: -1.9},
  {region: "Prairies, C.-B. et territoires", change: -7.5}
];

display(Plot.plot({
  title: "Variation d'une annee a l'autre de l'achalandage par region, octobre 2025 (%)",
  width: 680,
  height: 200,
  marginLeft: 200,
  marginRight: 80,
  x: {domain: [-10, 2], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyRegional, {
      y: "region",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(yoyRegional, {
      y: "region",
      x: d => d.change >= 0 ? d.change + 0.3 : d.change - 0.3,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les statistiques sur le transport en commun couvrent les operations de transport par autobus et de transport urbain. Les donnees sont recueillies mensuellement aupres des societes de transport et comprennent le nombre total de deplacements de passagers et les revenus d'exploitation (a l'exclusion des subventions gouvernementales).

Les statistiques representent l'activite des reseaux de transport en commun urbain (SCIAN 485110), qui comprennent les services de transport metropolitain par autobus, metro, train leger sur rail, tramway et train de banlieue.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 23-10-0251](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2310025101)
**Enquete :** Enquete sur le transport par autobus et le transport urbain
**Periode de reference :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2310025101-fra](https://doi.org/10.25318/2310025101-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "transport-urbain-octobre-2025", "fr"));
```
