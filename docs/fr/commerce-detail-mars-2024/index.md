---
title: Les ventes au détail reculent de 0,1 % en mars, le Yukon en tête des gains d'une année à l'autre
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 0,1 % en mars, le Yukon en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont reculé de 0,1 % en mars 2024 pour s'établir à 66,2 milliards de dollars, après un léger recul en février
- D'une année à l'autre, les ventes étaient en hausse de 1,2 %, le Yukon en tête des gains à 11,4 %—la plus forte croissance provinciale de la série
- Trois provinces de l'Ouest ont affiché des baisses d'une année à l'autre : la Saskatchewan, la Colombie-Britannique et l'Alberta
- Les provinces de l'Atlantique ont affiché une croissance uniformément forte, avec le Nouveau-Brunswick à 8,4 %

</div>

Les ventes au détail au Canada ont reculé de 0,1 % en mars 2024 pour s'établir à 66,2 milliards de dollars, après un léger recul en février. D'une année à l'autre, les ventes étaient supérieures de 1,2 % à celles de mars 2023.

Mars 2024 a été marqué par une divergence notable entre l'Est et l'Ouest canadien. Toutes les provinces de l'Atlantique ont affiché une forte croissance d'une année à l'autre, tandis que les trois provinces les plus à l'Ouest—la Saskatchewan, la Colombie-Britannique et l'Alberta—ont toutes enregistré des baisses.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-04-01"), value: 65.60},
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
  {date: new Date("2024-03-01"), value: 66.16}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, avril 2023 à mars 2024 (milliards de $)",
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

## Le Yukon en tête des gains, les provinces de l'Ouest à la traîne

Le Yukon a mené toutes les provinces avec une croissance de 11,4 % d'une année à l'autre—la meilleure performance provinciale enregistrée dans la série du commerce de détail. Le Nouveau-Brunswick a suivi à 8,4 %, avec l'Île-du-Prince-Édouard à 6,5 %.

Trois provinces de l'Ouest ont enregistré des baisses d'une année à l'autre. La Saskatchewan et la Colombie-Britannique ont toutes deux reculé de 0,6 %, tandis que l'Alberta a diminué de 0,8 %. Ce sont les seules provinces ayant affiché une croissance négative d'une année à l'autre en mars.

```js
const provincialData = [
  {province: "Yukon", value: 11.4},
  {province: "Nouveau-Brunswick", value: 8.4},
  {province: "Île-du-Prince-Édouard", value: 6.5},
  {province: "Nouvelle-Écosse", value: 5.1},
  {province: "Terre-Neuve-et-Labrador", value: 5.0},
  {province: "Ontario", value: 2.2},
  {province: "Québec", value: 0.8},
  {province: "Manitoba", value: 0.6},
  {province: "Saskatchewan", value: -0.6},
  {province: "Colombie-Britannique", value: -0.6},
  {province: "Alberta", value: -0.8}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mars 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 14]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 14,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.2, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Yukon",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mars, avec des ventes de 17,6 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,4 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mars 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,6 G$ |
| Détaillants en alimentation et en boissons | 12,4 G$ |
| Détaillants de marchandises diverses | 8,6 G$ |
| Stations-service et vendeurs de carburant | 5,7 G$ |
| Détaillants de produits de santé et de soins personnels | 5,3 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,8 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mars 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mars-2024", "fr"));
```
