---
title: Les ventes au détail reculent de 1,1 % en décembre, clôturant une année solide avec une croissance annuelle de 5,5 %
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail reculent de 1,1 % en décembre, clôturant une année solide avec une croissance annuelle de 5,5 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 1,1 % en décembre 2022 pour s'établir à 64,7 milliards de dollars, un ajustement typique après les Fêtes
- D'une année à l'autre, les ventes étaient en hausse de 5,5 %, reflétant les dépenses vigoureuses des consommateurs tout au long de 2022
- Terre-Neuve-et-Labrador a mené la croissance provinciale à 9,8 % d'une année à l'autre
- Seuls les Territoires du Nord-Ouest ont enregistré un recul d'une année à l'autre (-4,2 %)

</div>

Les ventes au détail au Canada ont diminué de 1,1 % en décembre 2022 pour s'établir à 64,7 milliards de dollars, un ajustement saisonnier typique après les dépenses élevées des Fêtes. Malgré le recul mensuel, la croissance d'une année à l'autre est demeurée robuste à 5,5 %, clôturant une année solide pour le secteur du commerce de détail.

Les résultats de décembre reflétaient une croissance annuelle généralisée dans presque toutes les provinces et tous les territoires, seuls les Territoires du Nord-Ouest ayant affiché un recul d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-01-01"), value: 62.94},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.90},
  {date: new Date("2022-08-01"), value: 65.16},
  {date: new Date("2022-09-01"), value: 64.85},
  {date: new Date("2022-10-01"), value: 65.40},
  {date: new Date("2022-11-01"), value: 65.41},
  {date: new Date("2022-12-01"), value: 64.68}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, janvier à décembre 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [61, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les provinces de l'Atlantique en tête de la croissance annuelle

Terre-Neuve-et-Labrador a mené toutes les provinces avec une croissance exceptionnelle de 9,8 % d'une année à l'autre, suivie de près par le Manitoba à 9,5 % et l'Île-du-Prince-Édouard à 9,2 %. L'Alberta a poursuivi sa solide performance avec une croissance annuelle de 8,1 %.

Presque toutes les provinces ont enregistré une croissance positive d'une année à l'autre, seuls les Territoires du Nord-Ouest ayant affiché un recul de -4,2 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 9.8},
  {province: "Manitoba", value: 9.5},
  {province: "Île-du-Prince-Édouard", value: 9.2},
  {province: "Alberta", value: 8.1},
  {province: "Québec", value: 7.6},
  {province: "Nouvelle-Écosse", value: 6.7},
  {province: "Saskatchewan", value: 5.2},
  {province: "Nouveau-Brunswick", value: 4.8},
  {province: "Ontario", value: 4.2},
  {province: "Yukon", value: 3.2},
  {province: "Colombie-Britannique", value: 1.7},
  {province: "Territoires du Nord-Ouest", value: -4.2}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, décembre 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-6, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.5], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 5.5, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en décembre, avec des ventes de 16,8 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,6 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (décembre 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,8 G$ |
| Détaillants en alimentation et en boissons | 11,6 G$ |
| Détaillants de marchandises diverses | 8,2 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 4,9 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,3 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Décembre 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-decembre-2022", "fr"));
```
