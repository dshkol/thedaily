---
title: Les ventes au détail reculent de 0,2 % en juillet, le Yukon poursuit sa croissance exceptionnelle à 15,2 %
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 0,2 % en juillet, le Yukon poursuit sa croissance exceptionnelle à 15,2 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont légèrement reculé de 0,2 % en juillet 2023 pour s'établir à 65,9 milliards de dollars, un léger repli par rapport à juin
- D'une année à l'autre, les ventes étaient en hausse de 1,5 %, le Yukon poursuivant sa croissance exceptionnelle à 15,2 %
- Quatre provinces ont enregistré des baisses d'une année à l'autre : la Saskatchewan, l'Alberta, le Manitoba et la Nouvelle-Écosse
- Le Nouveau-Brunswick et le Québec ont également affiché de solides gains supérieurs à la moyenne nationale

</div>

Les ventes au détail au Canada ont légèrement reculé de 0,2 % en juillet 2023 pour s'établir à 65,9 milliards de dollars, un léger repli par rapport au niveau de juin. D'une année à l'autre, les ventes étaient supérieures de 1,5 % à celles de juillet 2022.

Juillet 2023 a vu le Yukon poursuivre sa performance exceptionnelle avec une croissance de 15,2 % d'une année à l'autre, le deuxième mois consécutif de gains à deux chiffres. Quatre provinces ont enregistré des baisses, avec une faiblesse concentrée dans l'Ouest canadien et en Nouvelle-Écosse.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2023-06-01"), value: 66.00},
  {date: new Date("2023-07-01"), value: 65.89}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, août 2022 à juillet 2023 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [63, 70], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Le Yukon poursuit sa croissance exceptionnelle

Le Yukon a mené toutes les provinces pour le deuxième mois consécutif avec une croissance exceptionnelle de 15,2 % d'une année à l'autre. Le Nouveau-Brunswick a suivi à 5,1 %, avec le Québec à 4,7 % et Terre-Neuve-et-Labrador à 4,4 %.

Quatre provinces ont enregistré des baisses d'une année à l'autre. La Saskatchewan a reculé de 0,4 % et l'Alberta a chuté de 0,5 %, tandis que le Manitoba a diminué de 2,0 % et la Nouvelle-Écosse a reculé de 2,1 %—le recul provincial le plus marqué.

```js
const provincialData = [
  {province: "Yukon", value: 15.2},
  {province: "Nouveau-Brunswick", value: 5.1},
  {province: "Québec", value: 4.7},
  {province: "Terre-Neuve-et-Labrador", value: 4.4},
  {province: "Île-du-Prince-Édouard", value: 2.1},
  {province: "Ontario", value: 1.2},
  {province: "Colombie-Britannique", value: 0.2},
  {province: "Saskatchewan", value: -0.4},
  {province: "Alberta", value: -0.5},
  {province: "Manitoba", value: -2.0},
  {province: "Nouvelle-Écosse", value: -2.1}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juillet 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-5, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 18,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 1.5, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juillet, avec des ventes de 17,3 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,1 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juillet 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,3 G$ |
| Détaillants en alimentation et en boissons | 12,1 G$ |
| Détaillants de marchandises diverses | 8,4 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 5,1 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,8 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Juillet 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juillet-2023", "fr"));
```
