---
title: Les ventes au détail reculent de 0,3 % en décembre, le Yukon en tête des gains d'une année à l'autre
toc: false
---

# Les ventes au détail reculent de 0,3 % en décembre, le Yukon en tête des gains d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont reculé de 0,3 % en décembre 2023 pour s'établir à 66,3 milliards de dollars, en baisse par rapport au sommet de novembre
- D'une année à l'autre, les ventes étaient en hausse de 2,5 %, le Yukon en tête des gains à 8,3 %
- Seulement trois provinces ont affiché des baisses d'une année à l'autre : la Saskatchewan, l'Île-du-Prince-Édouard et le Manitoba
- La Colombie-Britannique a enregistré une croissance inhabituellement forte à 3,3 %, au troisième rang des provinces

</div>

Les ventes au détail au Canada ont reculé de 0,3 % en décembre 2023 pour s'établir à 66,3 milliards de dollars, en baisse par rapport au sommet des achats des Fêtes de novembre. D'une année à l'autre, les ventes étaient supérieures de 2,5 % à celles de décembre 2022.

Décembre 2023 a affiché une croissance largement positive dans la plupart des régions du pays. Seulement trois provinces—toutes dans les Prairies et l'Atlantique—ont enregistré des baisses d'une année à l'autre, toutes modestes à moins de 1 point de pourcentage.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89},
  {date: new Date("2023-08-01"), value: 65.93},
  {date: new Date("2023-09-01"), value: 66.58},
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier à décembre 2023 (milliards de $)",
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

## Le Yukon en tête des gains, les Prairies à la traîne

Le Yukon a mené toutes les provinces avec une croissance de 8,3 % d'une année à l'autre, poursuivant sa série de fortes performances. Le Nouveau-Brunswick a suivi à 7,2 %, avec la Colombie-Britannique affichant un gain inhabituellement fort de 3,3 %.

Seulement trois provinces ont enregistré des baisses d'une année à l'autre, toutes modestes. La Saskatchewan a reculé de 0,4 %, tandis que l'Île-du-Prince-Édouard et le Manitoba ont chacun diminué de 0,6 %. Ce sont les plus faibles baisses provinciales observées ces derniers mois.

```js
const provincialData = [
  {province: "Yukon", value: 8.3},
  {province: "Nouveau-Brunswick", value: 7.2},
  {province: "Colombie-Britannique", value: 3.3},
  {province: "Ontario", value: 3.1},
  {province: "Nouvelle-Écosse", value: 2.4},
  {province: "Québec", value: 2.0},
  {province: "Alberta", value: 2.0},
  {province: "Terre-Neuve-et-Labrador", value: 1.3},
  {province: "Saskatchewan", value: -0.4},
  {province: "Île-du-Prince-Édouard", value: -0.6},
  {province: "Manitoba", value: -0.6}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, décembre 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 10]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 10,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 2.5, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en décembre, avec des ventes de 17,6 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,3 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (décembre 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,6 G$ |
| Détaillants en alimentation et en boissons | 12,3 G$ |
| Détaillants de marchandises diverses | 8,6 G$ |
| Stations-service et vendeurs de carburant | 5,7 G$ |
| Détaillants de produits de santé et de soins personnels | 5,2 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,5 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Décembre 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "retail-trade-december-2023", "fr"));
```
