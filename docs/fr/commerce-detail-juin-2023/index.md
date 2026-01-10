---
title: Les ventes au détail progressent de 0,5 % en juin alors que la croissance annuelle devient négative pour la première fois
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail progressent de 0,5 % en juin alors que la croissance annuelle devient négative pour la première fois

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,5 % en juin 2023 pour s'établir à 66,0 milliards de dollars, un rebond par rapport au rythme plus lent de mai
- D'une année à l'autre, les ventes ont diminué de 1,2 %, soit le premier recul annuel après des mois de croissance positive
- Le Nouveau-Brunswick a mené les gains provinciaux à 5,0 %, tandis que l'Ontario et la Colombie-Britannique ont chuté de plus de 4 %
- Quatre provinces ont enregistré des baisses d'une année à l'autre : le Manitoba, la Saskatchewan, l'Ontario et la Colombie-Britannique

</div>

Les ventes au détail au Canada ont augmenté de 0,5 % en juin 2023 pour s'établir à 66,0 milliards de dollars, un rebond par rapport au rythme plus lent du mois précédent. Cependant, d'une année à l'autre, les ventes étaient en baisse de 1,2 % par rapport à juin 2022—le premier recul annuel après une période prolongée de croissance.

Juin 2023 a marqué un point tournant pour la performance du commerce de détail, la comparaison d'une année à l'autre devenant négative alors que la base solide de 2022 a rattrapé les niveaux de ventes actuels. Le Canada atlantique a continué de surpasser les autres régions, tandis que le centre et l'ouest du Canada ont affiché une faiblesse.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2023-05-01"), value: 65.66},
  {date: new Date("2023-06-01"), value: 66.00}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, juillet 2022 à juin 2023 (milliards de $)",
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

## Le Canada atlantique en tête tandis que le centre du Canada peine

Le Nouveau-Brunswick a mené toutes les provinces avec une croissance de 5,0 % d'une année à l'autre. L'Île-du-Prince-Édouard a suivi à 3,4 %, avec l'Alberta affichant des gains de 3,3 %.

Quatre provinces ont enregistré des baisses d'une année à l'autre. L'Ontario a reculé de 4,0 % et la Colombie-Britannique a chuté de 4,1 %, toutes deux nettement inférieures au taux national. Le Manitoba et la Saskatchewan ont chacun diminué de 2,5 %.

```js
const provincialData = [
  {province: "Nouveau-Brunswick", value: 5.0},
  {province: "Île-du-Prince-Édouard", value: 3.4},
  {province: "Alberta", value: 3.3},
  {province: "Nouvelle-Écosse", value: 2.2},
  {province: "Québec", value: 2.2},
  {province: "Terre-Neuve-et-Labrador", value: 1.6},
  {province: "Yukon", value: 0.7},
  {province: "Manitoba", value: -2.5},
  {province: "Saskatchewan", value: -2.5},
  {province: "Ontario", value: -4.0},
  {province: "Colombie-Britannique", value: -4.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juin 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([-1.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: -1.2, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Nouveau-Brunswick",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juin, avec des ventes de 17,1 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,0 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juin 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,1 G$ |
| Détaillants en alimentation et en boissons | 12,0 G$ |
| Détaillants de marchandises diverses | 8,3 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
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
**Période de référence :** Juin 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juin-2023", "fr"));
```
