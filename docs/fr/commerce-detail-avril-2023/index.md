---
title: Les ventes au détail progressent de 0,4 % en avril, la Nouvelle-Écosse en tête avec un gain annuel de 9,0 %
toc: false
---

# Les ventes au détail progressent de 0,4 % en avril, la Nouvelle-Écosse en tête avec un gain annuel de 9,0 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,4 % en avril 2023 pour s'établir à 65,6 milliards de dollars, poursuivant les gains de mars
- D'une année à l'autre, les ventes étaient en hausse de 2,4 %, un rythme de croissance solide par rapport à avril 2022
- La Nouvelle-Écosse a mené toutes les provinces avec une croissance exceptionnelle de 9,0 % d'une année à l'autre
- Trois provinces ont enregistré des baisses : la Saskatchewan, Terre-Neuve-et-Labrador et la Colombie-Britannique

</div>

Les ventes au détail au Canada ont augmenté de 0,4 % en avril 2023 pour s'établir à 65,6 milliards de dollars, poursuivant les gains du mois précédent. D'une année à l'autre, les ventes étaient en hausse de 2,4 % par rapport à avril 2022, un rythme de croissance annuelle solide.

Avril 2023 a vu une grande divergence régionale dans la performance du commerce de détail, avec la Nouvelle-Écosse affichant une croissance exceptionnelle de 9,0 % d'une année à l'autre tandis que la Colombie-Britannique était à la traîne à -1,8 %. Le Canada atlantique a largement surpassé les autres régions, tandis que les provinces de l'Ouest ont affiché des résultats mitigés.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-05-01"), value: 65.84},
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
  {date: new Date("2023-04-01"), value: 65.63}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, mai 2022 à avril 2023 (milliards de $)",
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

## La Nouvelle-Écosse affiche une croissance exceptionnelle

La Nouvelle-Écosse a mené toutes les provinces avec une croissance exceptionnelle de 9,0 % d'une année à l'autre, loin devant toutes les autres provinces. Le Yukon a suivi à 6,2 %, avec le Manitoba à 5,9 % et l'Alberta à 5,6 %.

Trois provinces ont enregistré des baisses d'une année à l'autre. La Saskatchewan a reculé de 0,7 %, Terre-Neuve-et-Labrador a diminué de 1,5 % et la Colombie-Britannique a chuté de 1,8 %.

```js
const provincialData = [
  {province: "Nouvelle-Écosse", value: 9.0},
  {province: "Yukon", value: 6.2},
  {province: "Manitoba", value: 5.9},
  {province: "Alberta", value: 5.6},
  {province: "Québec", value: 5.2},
  {province: "Île-du-Prince-Édouard", value: 3.9},
  {province: "Nouveau-Brunswick", value: 3.7},
  {province: "Ontario", value: 0.9},
  {province: "Saskatchewan", value: -0.7},
  {province: "Terre-Neuve-et-Labrador", value: -1.5},
  {province: "Colombie-Britannique", value: -1.8}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, avril 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([2.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 12,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 2.4, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Nouvelle-Écosse",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en avril, avec des ventes de 17,0 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,9 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (avril 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,0 G$ |
| Détaillants en alimentation et en boissons | 11,9 G$ |
| Détaillants de marchandises diverses | 8,3 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,0 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,6 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Avril 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-avril-2023", "fr"));
```
