---
title: Les livraisons de cereales de l'Ouest canadien en hausse de 14,2 % d'une annee a l'autre en novembre 2025
verification_json: output/data_32_10_0352_enhanced.json
toc: false
---

# Les livraisons de cereales de l'Ouest canadien en hausse de 14,2 % d'une annee a l'autre en novembre 2025

<p class="release-date">Diffusion : 30 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les livraisons de cereales de l'Ouest canadien ont totalise 5,5 millions de tonnes en novembre 2025, en hausse de 14,2 % par rapport a novembre 2024
- D'un mois a l'autre, les livraisons ont diminue de 14,6 % par rapport aux 6,5 millions de tonnes enregistrees en octobre
- Les livraisons de ble ont augmente de 21,1 % d'une annee a l'autre pour atteindre 3,4 millions de tonnes
- L'avoine a enregistre la plus forte baisse d'une annee a l'autre a -27,7 %

</div>

Les producteurs de cereales de l'Ouest canadien ont livre 5,5 millions de tonnes de cereales aux silos primaires et de transformation titulaires de licence ainsi qu'aux negociants en grains en novembre 2025. Ce volume etait de 14,2 % superieur a celui de novembre 2024, mais de 14,6 % inferieur a celui d'octobre 2025.

La hausse d'une annee a l'autre a ete stimulee par les livraisons plus elevees de ble et de canola, tandis que les livraisons d'avoine ont fortement diminue.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, Tableau 32-10-0351
const deliveriesData = [
  {date: new Date("2024-11"), value: 4.83},
  {date: new Date("2024-12"), value: 4.69},
  {date: new Date("2025-01"), value: 6.42},
  {date: new Date("2025-02"), value: 4.61},
  {date: new Date("2025-03"), value: 4.96},
  {date: new Date("2025-04"), value: 5.65},
  {date: new Date("2025-05"), value: 3.63},
  {date: new Date("2025-06"), value: 4.89},
  {date: new Date("2025-07"), value: 3.77},
  {date: new Date("2025-08"), value: 2.91},
  {date: new Date("2025-09"), value: 6.87},
  {date: new Date("2025-10"), value: 6.46},
  {date: new Date("2025-11"), value: 5.51}
];

display(Plot.plot({
  title: "Livraisons de cereales de l'Ouest canadien, novembre 2024 a novembre 2025",
  width: 680,
  height: 300,
  y: {domain: [2, 8], grid: true, label: "Millions de tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(deliveriesData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(deliveriesData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(deliveriesData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Livraisons par type de cereale

Le ble a domine avec 3,4 millions de tonnes livrees en novembre, representant 61 % des livraisons totales. Le canola s'est classe au deuxieme rang avec 1,6 million de tonnes (29 %), suivi du ble dur a 0,7 million de tonnes.

```js
const grainData = [
  {name: "Ble", value: 3.35},
  {name: "Canola", value: 1.61},
  {name: "Ble dur", value: 0.70},
  {name: "Orge", value: 0.34},
  {name: "Avoine", value: 0.18}
];

display(Plot.plot({
  title: "Livraisons de cereales par type, novembre 2025 (millions de tonnes)",
  width: 680,
  height: 280,
  marginLeft: 100,
  marginRight: 80,
  x: {grid: true, label: "Millions de tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(grainData, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(grainData, {
      y: "name",
      x: d => d.value + 0.08,
      text: d => d.value.toFixed(2).replace(".", ",") + " M",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

### Variation d'une annee a l'autre par type de cereale

La graine de lin a enregistre la plus forte hausse d'une annee a l'autre a 33,6 %, bien que les volumes soient restes faibles. Les livraisons de ble ont augmente de 21,1 %, tandis que le canola a progresse de 11,1 %.

Les livraisons d'avoine ont diminue de 27,7 % par rapport a novembre 2024.

```js
const yoyData = [
  {name: "Graine de lin", change: 33.6},
  {name: "Ble", change: 21.1},
  {name: "Seigle", change: 11.2},
  {name: "Canola", change: 11.1},
  {name: "Ble dur", change: 7.9},
  {name: "Orge", change: 1.2},
  {name: "Avoine", change: -27.7}
];

display(Plot.plot({
  title: "Variation d'une annee a l'autre des livraisons de cereales par type, novembre 2025 (%)",
  width: 680,
  height: 300,
  marginLeft: 120,
  marginRight: 80,
  x: {domain: [-35, 40], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(yoyData, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(yoyData, {
      y: "name",
      x: d => d.change >= 0 ? d.change + 1 : d.change - 1,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Repartition provinciale

La Saskatchewan a represente 58 % des livraisons totales de cereales de l'Ouest canadien avec 3,2 millions de tonnes. L'Alberta a contribue 1,5 million de tonnes (28 %), tandis que le Manitoba a livre 0,7 million de tonnes (13 %).

```js
const provincialData = [
  {province: "Saskatchewan", value: 3.22},
  {province: "Alberta", value: 1.53},
  {province: "Manitoba", value: 0.74}
];

display(Plot.plot({
  title: "Livraisons de cereales par province, novembre 2025 (millions de tonnes)",
  width: 500,
  height: 200,
  marginLeft: 120,
  marginRight: 80,
  x: {grid: true, label: "Millions de tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(provincialData, {
      y: "province",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(provincialData, {
      y: "province",
      x: d => d.value + 0.08,
      text: d => d.value.toFixed(2).replace(".", ",") + " M",
      textAnchor: "start",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les livraisons de cereales par les producteurs de l'Ouest canadien mesurent la quantite de cereales livrees par les producteurs aux silos primaires et de transformation titulaires de licence ainsi qu'aux negociants en grains. Les donnees couvrent les principales cereales, notamment le ble, le canola, l'orge, l'avoine, le seigle, la graine de lin et le ble dur.

Les livraisons peuvent varier considerablement d'un mois a l'autre en raison du calendrier des recoltes, de la capacite de transport et des conditions du marche.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 32-10-0351](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3210035101)
**Enquete :** Livraisons de cereales par les producteurs dans l'Ouest canadien
**Periode de reference :** Novembre 2025
**DOI :** [https://doi.org/10.25318/3210035101-fra](https://doi.org/10.25318/3210035101-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "livraisons-cereales-novembre-2025", "fr"));
```
