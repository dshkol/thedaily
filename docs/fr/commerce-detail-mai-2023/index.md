---
title: Les ventes au détail stables en mai alors que la croissance annuelle devient légèrement négative
toc: false
---

# Les ventes au détail stables en mai alors que la croissance annuelle devient légèrement négative

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail sont demeurées essentiellement stables en mai 2023 à 65,7 milliards de dollars, se maintenant au niveau d'avril
- D'une année à l'autre, les ventes ont légèrement diminué de 0,3 %, un léger recul par rapport à mai 2022
- Le Yukon a mené les gains provinciaux à 6,2 %, suivi de Terre-Neuve-et-Labrador à 5,4 %
- L'Ontario a enregistré le recul le plus marqué d'une année à l'autre à 2,7 %

</div>

Les ventes au détail au Canada sont demeurées essentiellement stables en mai 2023, se maintenant à 65,7 milliards de dollars par rapport au niveau d'avril. D'une année à l'autre, les ventes étaient en baisse de 0,3 % par rapport à mai 2022.

Mai 2023 a affiché un environnement de vente au détail relativement stable, avec des gains modestes dans les petites provinces compensant la faiblesse en Ontario, le plus grand marché de détail du Canada. Les provinces de l'Atlantique et les territoires ont continué de surpasser les autres régions.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.90},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67},
  {date: new Date("2023-03-01"), value: 65.35},
  {date: new Date("2023-04-01"), value: 65.63},
  {date: new Date("2023-05-01"), value: 65.66}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, juin 2022 à mai 2023 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [63, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les petites provinces surpassent tandis que l'Ontario accuse un retard

Le Yukon a mené toutes les provinces avec une croissance de 6,2 % d'une année à l'autre. Terre-Neuve-et-Labrador a suivi à 5,4 %, avec l'Alberta affichant des gains de 4,7 % et l'Île-du-Prince-Édouard à 4,0 %.

L'Ontario a enregistré le recul provincial le plus marqué à 2,7 %, tirant le chiffre national vers le bas. Le Québec a reculé de 0,6 % et le Nouveau-Brunswick a diminué de 0,2 %, tandis que la Saskatchewan était également en territoire négatif.

```js
const provincialData = [
  {province: "Yukon", value: 6.2},
  {province: "Terre-Neuve-et-Labrador", value: 5.4},
  {province: "Alberta", value: 4.7},
  {province: "Île-du-Prince-Édouard", value: 4.0},
  {province: "Nouvelle-Écosse", value: 2.9},
  {province: "Manitoba", value: 2.0},
  {province: "Colombie-Britannique", value: 1.0},
  {province: "Nouveau-Brunswick", value: -0.2},
  {province: "Québec", value: -0.6},
  {province: "Saskatchewan", value: -3.9},
  {province: "Ontario", value: -2.7}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mai 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-0.3], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 8,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: -0.3, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mai, avec des ventes de 17,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,9 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mai 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,0 G$ |
| Détaillants en alimentation et en boissons | 11,9 G$ |
| Détaillants de marchandises diverses | 8,3 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,0 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,8 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mai 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mai-2023", "fr"));
```
