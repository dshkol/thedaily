---
title: Les ventes au détail augmentent de 0,6 % en septembre, Terre-Neuve-et-Labrador affiche une croissance à deux chiffres
verification_json: output/data_20_10_0056_enhanced.json
toc: false
---

# Les ventes au détail augmentent de 0,6 % en septembre, Terre-Neuve-et-Labrador affiche une croissance à deux chiffres

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 0,6 % en septembre 2024 pour s'établir à 67,5 milliards de dollars, le troisième mois consécutif de croissance
- D'une année à l'autre, les ventes étaient en hausse de 1,4 %, Terre-Neuve-et-Labrador (+10,6 %) affichant une croissance à deux chiffres
- Dix des onze provinces et territoires ont affiché une croissance positive d'une année à l'autre
- Le Manitoba (-0,3 %) était la seule province à enregistrer une baisse

</div>

Les ventes au détail au Canada ont augmenté de 0,6 % en septembre 2024 pour s'établir à 67,5 milliards de dollars, marquant le troisième mois consécutif de croissance. D'une année à l'autre, les ventes étaient supérieures de 1,4 % à celles de septembre 2023.

La hausse de septembre s'est ajoutée aux gains de 0,3 % en août et de 1,5 % en juillet. Dix des onze provinces et territoires ont enregistré une croissance positive d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2023-10-01"), value: 66.51},
  {date: new Date("2023-11-01"), value: 66.56},
  {date: new Date("2023-12-01"), value: 66.32},
  {date: new Date("2024-01-01"), value: 66.08},
  {date: new Date("2024-02-01"), value: 66.24},
  {date: new Date("2024-03-01"), value: 66.16},
  {date: new Date("2024-04-01"), value: 66.78},
  {date: new Date("2024-05-01"), value: 65.96},
  {date: new Date("2024-06-01"), value: 65.89},
  {date: new Date("2024-07-01"), value: 66.89},
  {date: new Date("2024-08-01"), value: 67.10},
  {date: new Date("2024-09-01"), value: 67.51}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, octobre 2023 à septembre 2024 (milliards de $)",
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

## Terre-Neuve-et-Labrador en tête des gains provinciaux

Terre-Neuve-et-Labrador a mené la croissance d'une année à l'autre à 10,6 %, la seule province à afficher une croissance à deux chiffres. L'Alberta a suivi à 4,5 %, avec l'Île-du-Prince-Édouard à 3,1 %.

Le Manitoba a enregistré la seule baisse à -0,3 %, un résultat inhabituel car la province affiche généralement une croissance positive. Toutes les autres administrations ont enregistré des gains, y compris le Yukon à +0,7 %.

```js
const provincialData = [
  {province: "Terre-Neuve-et-Labrador", value: 10.6},
  {province: "Alberta", value: 4.5},
  {province: "Île-du-Prince-Édouard", value: 3.1},
  {province: "Nouveau-Brunswick", value: 2.2},
  {province: "Québec", value: 1.6},
  {province: "Nouvelle-Écosse", value: 1.3},
  {province: "Saskatchewan", value: 0.7},
  {province: "Colombie-Britannique", value: 0.7},
  {province: "Yukon", value: 0.7},
  {province: "Ontario", value: 0.2},
  {province: "Manitoba", value: -0.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, septembre 2024 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-2, 12]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([1.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
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
    Plot.text([{x: 1.4, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en septembre, avec des ventes de 18,1 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 12,8 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (septembre 2024) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 18,1 G$ |
| Détaillants en alimentation et en boissons | 12,8 G$ |
| Détaillants de marchandises diverses | 9,0 G$ |
| Stations-service et vendeurs de carburant | 5,8 G$ |
| Détaillants de produits de santé et de soins personnels | 5,6 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,9 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Septembre 2024
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-septembre-2024", "fr"));
```
