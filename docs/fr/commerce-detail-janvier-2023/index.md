---
title: Les ventes au détail bondissent de 2,5 % en janvier, toutes les provinces affichent des gains annuels
toc: false
---

# Les ventes au détail bondissent de 2,5 % en janvier, toutes les provinces affichent des gains annuels

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 2,5 % en janvier 2023 pour s'établir à 66,3 milliards de dollars, un début d'année solide
- D'une année à l'autre, les ventes étaient en hausse de 5,4 %, le taux de croissance annuelle le plus fort des derniers mois
- L'Alberta a mené toutes les provinces avec une croissance exceptionnelle de 14,9 % d'une année à l'autre
- Toutes les provinces ont enregistré des gains positifs d'une année à l'autre—la première performance universelle de ce type

</div>

Les ventes au détail au Canada ont augmenté de 2,5 % en janvier 2023 pour s'établir à 66,3 milliards de dollars, marquant un début d'année solide. D'une année à l'autre, les ventes étaient en hausse de 5,4 % par rapport à janvier 2022—un rythme de croissance annuelle robuste.

Janvier 2023 a été remarquable pour sa performance régionale universellement positive, chaque province ayant affiché des gains d'une année à l'autre. L'Alberta a mené avec une croissance exceptionnelle à deux chiffres, tandis que les provinces des Prairies ont largement surpassé les autres régions.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2022-12-01"), value: 64.68},
  {date: new Date("2023-01-01"), value: 66.27}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, février 2022 à janvier 2023 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [62, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Toutes les provinces enregistrent des gains, l'Alberta en tête

L'Alberta a mené toutes les provinces avec une croissance exceptionnelle de 14,9 % d'une année à l'autre, loin devant toutes les autres provinces. La Nouvelle-Écosse a suivi à 12,6 %, avec le Manitoba à 11,0 % et l'Île-du-Prince-Édouard à 9,4 %.

Pour la première fois depuis longtemps, chaque province a enregistré une croissance positive d'une année à l'autre. Même le moins performant, l'Ontario, a tout de même affiché des gains de 2,6 %.

```js
const provincialData = [
  {province: "Alberta", value: 14.9},
  {province: "Nouvelle-Écosse", value: 12.6},
  {province: "Manitoba", value: 11.0},
  {province: "Île-du-Prince-Édouard", value: 9.4},
  {province: "Yukon", value: 8.4},
  {province: "Saskatchewan", value: 8.1},
  {province: "Terre-Neuve-et-Labrador", value: 6.9},
  {province: "Nouveau-Brunswick", value: 4.2},
  {province: "Québec", value: 4.2},
  {province: "Colombie-Britannique", value: 3.2},
  {province: "Ontario", value: 2.6}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, janvier 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [0, 18]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([5.4], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => "+" + d.value.toFixed(1).replace(".", ",") + " %",
      dx: 4,
      textAnchor: "start",
      fontSize: 10
    }),
    Plot.text([{x: 5.4, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Alberta",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en janvier, avec des ventes de 17,2 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,8 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (janvier 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 17,2 G$ |
| Détaillants en alimentation et en boissons | 11,8 G$ |
| Détaillants de marchandises diverses | 8,3 G$ |
| Stations-service et vendeurs de carburant | 6,0 G$ |
| Détaillants de produits de santé et de soins personnels | 5,0 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,4 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Janvier 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-janvier-2023", "fr"));
```
