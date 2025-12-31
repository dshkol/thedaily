---
title: Les ventes au détail bondissent de 15,6 % d'une année à l'autre en mai, l'Ontario affiche un gain exceptionnel de 27,8 %
toc: false
---

# Les ventes au détail bondissent de 15,6 % d'une année à l'autre en mai, l'Ontario affiche un gain exceptionnel de 27,8 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont augmenté de 2,7 % en mai 2022 pour atteindre 65,8 milliards de dollars
- D'une année à l'autre, les ventes étaient en hausse de 15,6 %, reflétant l'élan continu de la réouverture
- L'Ontario a mené toutes les provinces avec une croissance exceptionnelle de 27,8 % d'une année à l'autre
- Toutes les provinces et tous les territoires sauf le Nunavut ont enregistré des gains positifs d'une année à l'autre

</div>

Les ventes au détail au Canada ont augmenté de 2,7 % en mai 2022 pour atteindre 65,8 milliards de dollars. La croissance d'une année à l'autre était exceptionnellement forte à 15,6 %, reflétant l'élan continu de la réouverture post-pandémique et la demande refoulée des consommateurs.

Mai 2022 a été remarquable pour la divergence de la performance provinciale. L'Ontario a affiché un gain remarquable de 27,8 % d'une année à l'autre, dépassant de loin toutes les autres provinces. La Nouvelle-Écosse a suivi avec une forte hausse de 23,3 %. Toutes les provinces et tous les territoires sauf le Nunavut ont enregistré une croissance positive par rapport à mai 2021.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-06-01"), value: 59.65},
  {date: new Date("2021-07-01"), value: 60.15},
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, juin 2021 à mai 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [58, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## L'Ontario en tête d'une croissance provinciale exceptionnelle

L'Ontario a mené toutes les provinces avec une croissance exceptionnelle de 27,8 % d'une année à l'autre, soit près du double de la moyenne nationale. Cela reflète les restrictions pandémiques prolongées de la province jusqu'au début de 2022, qui ont déprimé la base de comparaison de mai 2021. La Nouvelle-Écosse a suivi avec un solide gain de 23,3 %.

Toutes les provinces et tous les territoires sauf le Nunavut ont enregistré une croissance positive d'une année à l'autre, dont sept au-dessus de 10 %.

```js
const provincialData = [
  {province: "Ontario", value: 27.8},
  {province: "Nouvelle-Écosse", value: 23.3},
  {province: "Île-du-Prince-Édouard", value: 13.1},
  {province: "Manitoba", value: 11.4},
  {province: "Alberta", value: 10.9},
  {province: "Québec", value: 10.9},
  {province: "Nouveau-Brunswick", value: 10.7},
  {province: "Territoires du Nord-Ouest", value: 7.5},
  {province: "Terre-Neuve-et-Labrador", value: 6.8},
  {province: "Yukon", value: 6.3},
  {province: "Saskatchewan", value: 5.0},
  {province: "Colombie-Britannique", value: 3.0},
  {province: "Nunavut", value: -1.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, mai 2022 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 30]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([15.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 30,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 15.6, label: "Moyenne canadienne"}], {
      x: "x",
      text: "label",
      y: "Ontario",
      dy: -15,
      fontSize: 10,
      fill: "#333"
    })
  ]
}));
```

## Les concessionnaires de véhicules automobiles en tête des sous-secteurs

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en mai, avec des ventes de 16,5 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,2 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (mai 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,5 G$ |
| Détaillants en alimentation et en boissons | 11,2 G$ |
| Détaillants de marchandises diverses | 7,9 G$ |
| Stations-service et vendeurs de carburant | 6,1 G$ |
| Détaillants de produits de santé et de soins personnels | 4,7 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,6 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Mai 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-mai-2022", "fr"));
```
