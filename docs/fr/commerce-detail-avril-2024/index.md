---
title: Les ventes au détail augmentent de 0,9 % en avril, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 0,9 % en avril, Terre-Neuve-et-Labrador en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,9 % en avril 2024 pour s'établir à 66,8 milliards de dollars, après un gain de 0,9 % en mars
- D'une année à l'autre, les ventes étaient en hausse de 1,7 %, Terre-Neuve-et-Labrador en tête des gains à 9,3 %
- Deux provinces ont affiché des baisses d'une année à l'autre : l'Ontario à -0,7 % et la Nouvelle-Écosse à -1,1 %
- Le Yukon a enregistré une forte croissance de 8,5 %, en contraste avec les baisses observées les mois suivants

</div>

Les ventes au détail au Canada ont augmenté de 0,9 % en avril 2024 pour s'établir à 66,8 milliards de dollars, égalant le gain de 0,9 % de mars. D'une année à l'autre, les ventes étaient supérieures de 1,7 % à celles d'avril 2023.

Avril 2024 a marqué un point relativement fort pour le commerce de détail, avec seulement deux provinces enregistrant des baisses d'une année à l'autre. Cela contraste avec mai et juin 2024, où le nombre de provinces en déclin passerait à quatre puis à cinq respectivement.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-05-01"), value: 65.70},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.90},
  {date: new Date("2023-08-01"), value: 65.90},
  {date: new Date("2023-09-01"), value: 66.60},
  {date: new Date("2023-10-01"), value: 66.50},
  {date: new Date("2023-11-01"), value: 66.60},
  {date: new Date("2023-12-01"), value: 66.30},
  {date: new Date("2024-01-01"), value: 66.10},
  {date: new Date("2024-02-01"), value: 66.20},
  {date: new Date("2024-03-01"), value: 66.20},
  {date: new Date("2024-04-01"), value: 66.78}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, mai 2023 à avril 2024 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [64, 70], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les provinces de l'Atlantique en tête des gains, l'Ontario et la Nouvelle-Écosse en baisse

Terre-Neuve-et-Labrador a mené toutes les provinces avec une croissance de 9,3 % d'une année à l'autre, suivi de l'Île-du-Prince-Édouard à 8,9 %. Le Yukon a enregistré une croissance de 8,5 %, une performance notamment forte comparée aux baisses que le territoire connaîtrait les mois suivants.

Deux provinces ont enregistré des baisses d'une année à l'autre. La Nouvelle-Écosse a reculé de 1,1 %, tandis que l'Ontario a légèrement baissé de 0,7 %. Ce sont les seules provinces avec une croissance négative d'une année à l'autre en avril.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 9.3},
  {province: "Île-du-Prince-Édouard", value: 8.9},
  {province: "Yukon", value: 8.5},
  {province: "Nouveau-Brunswick", value: 7.5},
  {province: "Saskatchewan", value: 5.4},
  {province: "Manitoba", value: 3.2},
  {province: "Alberta", value: 3.2},
  {province: "Colombie-Britannique", value: 2.9},
  {province: "Québec", value: 2.7},
  {province: "Ontario", value: -0.7},
  {province: "Nouvelle-Écosse", value: -1.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, avril 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.7], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 12,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.7, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Terre-Neuve-et-Labrador",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en avril, avec des ventes de 17,8 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,4 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (avril 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,8 G$ |
| Détaillants en alimentation et en boissons | 12,4 G$ |
| Détaillants de marchandises diverses | 8,7 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,3 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 4,0 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Avril 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-avril-2024", "fr"));
```
