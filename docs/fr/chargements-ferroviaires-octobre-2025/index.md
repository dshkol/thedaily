---
title: Le transport ferroviaire de marchandises en baisse de 0,9 % d'une annee a l'autre en octobre 2025
toc: false
---

# Le transport ferroviaire de marchandises en baisse de 0,9 % d'une annee a l'autre en octobre 2025

<p class="release-date">Diffusion : 29 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Le transport ferroviaire total de marchandises a atteint 33,2 millions de tonnes en octobre 2025, en baisse de 0,9 % par rapport a octobre 2024
- D'un mois a l'autre, le trafic a augmente de 5,8 % par rapport a septembre 2025
- La division de l'Ouest a represente 66,6 % du total des chargements, soit 22,1 millions de tonnes
- Les expeditions de ble ont augmente de 18,7 % d'une annee a l'autre, tandis que le canola a diminue de 38,2 %

</div>

Les chemins de fer canadiens ont transporte 33,2 millions de tonnes de marchandises en octobre 2025, en baisse de 0,9 % par rapport au meme mois un an plus tot. Sur une base mensuelle, le trafic a augmente de 5,8 % par rapport aux 31,4 millions de tonnes enregistrees en septembre 2025.

La diminution du trafic d'une annee a l'autre est attribuable a la baisse des expeditions de potasse et de canola, qui a plus que compense les gains enregistres pour le ble et le minerai de fer.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, Tableau 23-10-0216
const carloadingsData = [
  {date: new Date("2024-10"), value: 33.5},
  {date: new Date("2024-11"), value: 31.2},
  {date: new Date("2024-12"), value: 31.4},
  {date: new Date("2025-01"), value: 32.2},
  {date: new Date("2025-02"), value: 26.8},
  {date: new Date("2025-03"), value: 33.4},
  {date: new Date("2025-04"), value: 32.8},
  {date: new Date("2025-05"), value: 33.0},
  {date: new Date("2025-06"), value: 30.0},
  {date: new Date("2025-07"), value: 30.9},
  {date: new Date("2025-08"), value: 30.4},
  {date: new Date("2025-09"), value: 31.4},
  {date: new Date("2025-10"), value: 33.2}
];

display(Plot.plot({
  title: "Transport ferroviaire total de marchandises, octobre 2024 a octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [24, 36], grid: true, label: "Millions de tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(carloadingsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(carloadingsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(carloadingsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Repartition regionale

La division de l'Ouest a transporte 22,1 millions de tonnes en octobre, representant 66,6 % du total du transport ferroviaire de marchandises au Canada. La division de l'Est a traite 11,1 millions de tonnes, soit 33,4 % du total.

```js
const regionalData = [
  {region: "Division de l'Ouest", value: 22.1, share: 66.6},
  {region: "Division de l'Est", value: 11.1, share: 33.4}
];

display(Plot.plot({
  title: "Transport ferroviaire de marchandises par division, octobre 2025 (millions de tonnes)",
  width: 500,
  height: 200,
  marginLeft: 140,
  marginRight: 100,
  x: {grid: true, label: "Millions de tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(regionalData, {
      y: "region",
      x: "value",
      fill: "#AF3C43"
    }),
    Plot.text(regionalData, {
      y: "region",
      x: 24,
      text: d => d.value.toFixed(1).replace(".", ",") + " M (" + d.share.toFixed(1).replace(".", ",") + " %)",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Produits de base

Le minerai de fer et les concentres ont ete en tete de tous les produits de base avec 4,8 millions de tonnes, en hausse de 3,8 % par rapport a octobre 2024. Les expeditions de ble ont totalise 3,2 millions de tonnes, une augmentation de 18,7 % d'une annee a l'autre.

Le transport de charbon a diminue de 4,6 % pour s'etablir a 3,1 millions de tonnes. Les expeditions de potasse ont recule de 10,8 % pour atteindre 1,9 million de tonnes, tandis que le canola a chute de 38,2 % pour s'etablir a 0,8 million de tonnes.

```js
const commodities = [
  {name: "Minerai de fer et concentres", value: 4.8, yoy: 3.8},
  {name: "Ble", value: 3.2, yoy: 18.7},
  {name: "Charbon", value: 3.1, yoy: -4.6},
  {name: "Potasse", value: 1.9, yoy: -10.8},
  {name: "Hydrocarbures gazeux", value: 1.0, yoy: null},
  {name: "Mazouts et petrole brut", value: 0.9, yoy: null},
  {name: "Canola", value: 0.8, yoy: -38.2},
  {name: "Autres cereales", value: 0.8, yoy: null}
];

display(Plot.plot({
  title: "Principaux produits de base par tonnage, octobre 2025 (millions de tonnes)",
  width: 680,
  height: 340,
  marginLeft: 200,
  marginRight: 60,
  x: {grid: true, label: "Millions de tonnes"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(commodities, {
      y: "name",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(commodities, {
      y: "name",
      x: 5.2,
      text: d => d.value.toFixed(1).replace(".", ",") + " M",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

### Variation d'une annee a l'autre par produit de base

```js
const yoyData = [
  {name: "Ble", change: 18.7},
  {name: "Minerai de fer", change: 3.8},
  {name: "Charbon", change: -4.6},
  {name: "Potasse", change: -10.8},
  {name: "Canola", change: -38.2}
];

display(Plot.plot({
  title: "Variation d'une annee a l'autre par produit de base, octobre 2025 (%)",
  width: 680,
  height: 280,
  marginLeft: 120,
  marginRight: 80,
  x: {domain: [-45, 25], grid: true, label: "Variation en pourcentage"},
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
      x: 22,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les statistiques sur les chargements ferroviaires mesurent le tonnage de marchandises transportees par rail au Canada. Les donnees sont recueillies mensuellement aupres des chemins de fer de categorie I exploites au Canada. Les statistiques comprennent a la fois le trafic non intermodal (charge sur des wagons) et le trafic intermodal (conteneurs et remorques).

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 23-10-0216](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2310021601)
**Enquete :** Chargements ferroviaires mensuels
**Periode de reference :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2310021601-fra](https://doi.org/10.25318/2310021601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "chargements-ferroviaires-octobre-2025", "fr"));
```
