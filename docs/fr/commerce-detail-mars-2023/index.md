---
title: Les ventes au détail reculent de 0,5 % en mars, l'Île-du-Prince-Édouard en tête à 5,8 %
toc: false
---

# Les ventes au détail reculent de 0,5 % en mars, l'Île-du-Prince-Édouard en tête à 5,8 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 0,5 % en mars 2023 pour s'établir à 65,3 milliards de dollars, reculant par rapport à février
- D'une année à l'autre, les ventes étaient en hausse de 1,9 %, maintenant une croissance annuelle positive
- L'Île-du-Prince-Édouard a mené les gains provinciaux à 5,8 %, suivie de l'Alberta à 5,6 %
- Seulement deux provinces ont enregistré des baisses d'une année à l'autre : le Nouveau-Brunswick et l'Ontario

</div>

Les ventes au détail au Canada ont diminué de 0,5 % en mars 2023 pour s'établir à 65,3 milliards de dollars, reculant par rapport au niveau de février. Malgré la baisse mensuelle, les ventes d'une année à l'autre étaient en hausse de 1,9 % par rapport à mars 2022.

Mars 2023 a affiché une vigueur généralisée dans la plupart des provinces, seuls le Nouveau-Brunswick et l'Ontario ayant enregistré des baisses d'une année à l'autre. L'Île-du-Prince-Édouard du Canada atlantique a mené toutes les provinces, tandis que le Québec et l'Alberta ont également affiché de solides gains supérieurs à 5 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2022-04-01"), value: 64.09},
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
  {date: new Date("2023-03-01"), value: 65.35}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, avril 2022 à mars 2023 (milliards de $)",
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

## L'Île-du-Prince-Édouard affiche les gains les plus marqués

L'Île-du-Prince-Édouard a mené toutes les provinces avec une croissance de 5,8 % d'une année à l'autre. L'Alberta a suivi à 5,6 %, avec le Québec à 5,4 %. Le Manitoba a affiché des gains de 2,3 %, tandis que la Nouvelle-Écosse et le Yukon ont chacun progressé d'environ 2 %.

Seulement deux provinces ont enregistré des baisses d'une année à l'autre. Le Nouveau-Brunswick a reculé de 0,4 % et l'Ontario a chuté de 1,0 %, le seul frein significatif à la performance nationale.

```js
const provincialData = [
  {province: "Île-du-Prince-Édouard", value: 5.8},
  {province: "Alberta", value: 5.6},
  {province: "Québec", value: 5.4},
  {province: "Manitoba", value: 2.3},
  {province: "Nouvelle-Écosse", value: 2.0},
  {province: "Yukon", value: 1.9},
  {province: "Colombie-Britannique", value: 1.6},
  {province: "Saskatchewan", value: 1.5},
  {province: "Terre-Neuve-et-Labrador", value: 0.8},
  {province: "Nouveau-Brunswick", value: -0.4},
  {province: "Ontario", value: -1.0}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mars 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-3, 8]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 1.9, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Île-du-Prince-Édouard",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mars, avec des ventes de 16,8 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,9 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mars 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,8 G$ |
| Détaillants en alimentation et en boissons | 11,9 G$ |
| Détaillants de marchandises diverses | 8,3 G$ |
| Stations-service et vendeurs de carburant | 5,9 G$ |
| Détaillants de produits de santé et de soins personnels | 5,0 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,5 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mars 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mars-2023", "fr"));
```
