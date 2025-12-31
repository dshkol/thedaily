---
title: Les ventes au détail reculent de 0,5 % en septembre, le Manitoba en tête avec une croissance annuelle de 6,6 %
toc: false
---

# Les ventes au détail reculent de 0,5 % en septembre, le Manitoba en tête avec une croissance annuelle de 6,6 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 0,5 % en septembre 2022 pour s'établir à 64,9 milliards de dollars, un léger repli après un été vigoureux
- D'une année à l'autre, les ventes étaient en hausse de 6,6 %, poursuivant une robuste croissance annuelle
- Le Manitoba a mené toutes les provinces avec une croissance de 10,4 % d'une année à l'autre
- Seule la Nouvelle-Écosse a enregistré un recul d'une année à l'autre (-0,2 %)

</div>

Les ventes au détail au Canada ont diminué de 0,5 % en septembre 2022 pour s'établir à 64,9 milliards de dollars, un léger repli après les dépenses estivales élevées. Malgré le recul mensuel, la croissance d'une année à l'autre est demeurée robuste à 6,6 %.

Les provinces des Prairies ont mené la performance régionale, le Manitoba, la Saskatchewan et l'Alberta ayant tous affiché de solides gains annuels. Seule la Nouvelle-Écosse a enregistré un recul d'une année à l'autre, et de seulement 0,2 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, octobre 2021 à septembre 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [60, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les provinces des Prairies en tête de la croissance

Le Manitoba a mené toutes les provinces avec une croissance de 10,4 % d'une année à l'autre, suivi de la Saskatchewan à 8,9 % et du Nouveau-Brunswick à 8,8 %. L'Ontario et l'Alberta ont également affiché de solides gains supérieurs à 7 %.

Presque toutes les provinces ont enregistré une croissance positive d'une année à l'autre. Seule la Nouvelle-Écosse a affiché un recul, et de seulement 0,2 %.

```js
const provincialData = [
  {province: "Manitoba", value: 10.4},
  {province: "Saskatchewan", value: 8.9},
  {province: "Nouveau-Brunswick", value: 8.8},
  {province: "Ontario", value: 8.3},
  {province: "Alberta", value: 7.5},
  {province: "Territoires du Nord-Ouest", value: 7.5},
  {province: "Terre-Neuve-et-Labrador", value: 7.0},
  {province: "Île-du-Prince-Édouard", value: 5.7},
  {province: "Yukon", value: 5.6},
  {province: "Québec", value: 5.1},
  {province: "Colombie-Britannique", value: 3.0},
  {province: "Nouvelle-Écosse", value: -0.2}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, septembre 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-2, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([6.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 6.6, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Manitoba",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en septembre, avec des ventes de 16,6 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,5 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (septembre 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,6 G$ |
| Détaillants en alimentation et en boissons | 11,5 G$ |
| Détaillants de marchandises diverses | 7,9 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 4,8 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,4 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Septembre 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-septembre-2022", "fr"));
```
