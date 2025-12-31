---
title: Les ventes au détail reculent de 2,9 % en juillet, mais la croissance annuelle demeure forte à 7,9 %
toc: false
---

# Les ventes au détail reculent de 2,9 % en juillet, mais la croissance annuelle demeure forte à 7,9 %

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 2,9 % en juillet 2022 pour s'établir à 64,9 milliards de dollars, un repli notable par rapport au sommet de juin
- D'une année à l'autre, les ventes étaient en hausse de 7,9 %, maintenant une forte croissance annuelle
- L'Île-du-Prince-Édouard a mené toutes les provinces avec une croissance exceptionnelle de 16,7 % d'une année à l'autre
- Sept provinces ont affiché des gains à deux chiffres d'une année à l'autre

</div>

Les ventes au détail au Canada ont diminué de 2,9 % en juillet 2022 pour s'établir à 64,9 milliards de dollars, un repli notable par rapport au sommet record de 66,8 milliards de dollars en juin. Malgré le recul mensuel, la croissance d'une année à l'autre est demeurée exceptionnellement forte à 7,9 %.

Juillet 2022 a été remarquable pour sa performance régionale, sept provinces ayant affiché des gains à deux chiffres d'une année à l'autre. L'Île-du-Prince-Édouard a mené avec une croissance exceptionnelle de 16,7 %, suivie du Yukon à 13,2 % et du Nouveau-Brunswick à 12,0 %.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
  {date: new Date("2021-08-01"), value: 61.11},
  {date: new Date("2021-09-01"), value: 60.84},
  {date: new Date("2021-10-01"), value: 61.64},
  {date: new Date("2021-11-01"), value: 62.43},
  {date: new Date("2021-12-01"), value: 61.33},
  {date: new Date("2022-01-01"), value: 62.88},
  {date: new Date("2022-02-01"), value: 63.40},
  {date: new Date("2022-03-01"), value: 64.11},
  {date: new Date("2022-04-01"), value: 64.09},
  {date: new Date("2022-05-01"), value: 65.84},
  {date: new Date("2022-06-01"), value: 66.82},
  {date: new Date("2022-07-01"), value: 64.89}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, août 2021 à juillet 2022 (milliards de $)",
  width: 680,
  height: 300,
  y: {domain: [59, 68], grid: true, label: "Milliards ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(retailData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(retailData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(retailData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## L'Île-du-Prince-Édouard en tête d'une croissance provinciale exceptionnelle

L'Île-du-Prince-Édouard a mené toutes les provinces avec une croissance exceptionnelle de 16,7 % d'une année à l'autre—la plus forte lecture provinciale des derniers mois. Le Yukon a suivi à 13,2 %, le Nouveau-Brunswick, le Manitoba, l'Alberta, Terre-Neuve-et-Labrador et la Nouvelle-Écosse ayant tous affiché des gains à deux chiffres.

Seuls les Territoires du Nord-Ouest ont enregistré un recul d'une année à l'autre, et de seulement 1,7 %.

```js
const provincialData = [
  {province: "Île-du-Prince-Édouard", value: 16.7},
  {province: "Yukon", value: 13.2},
  {province: "Nouveau-Brunswick", value: 12.0},
  {province: "Manitoba", value: 11.3},
  {province: "Alberta", value: 11.3},
  {province: "Terre-Neuve-et-Labrador", value: 11.1},
  {province: "Nouvelle-Écosse", value: 10.8},
  {province: "Québec", value: 8.7},
  {province: "Saskatchewan", value: 7.6},
  {province: "Ontario", value: 7.0},
  {province: "Colombie-Britannique", value: 3.8},
  {province: "Territoires du Nord-Ouest", value: -1.7}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, juillet 2022 (%)",
  width: 680,
  height: 360,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 20]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([7.9], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 20,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 7.9, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en juillet, avec des ventes de 16,4 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,4 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (juillet 2022) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,4 G$ |
| Détaillants en alimentation et en boissons | 11,4 G$ |
| Détaillants de marchandises diverses | 7,8 G$ |
| Stations-service et vendeurs de carburant | 6,1 G$ |
| Détaillants de produits de santé et de soins personnels | 4,8 G$ |
| Marchands de matériaux de construction et d'équipement de jardin | 3,5 G$ |

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce de détail sont recueillies auprès d'un échantillon d'établissements de vente au détail à travers le Canada. Les chiffres de ventes sont désaisonnalisés pour tenir compte des tendances régulières telles que les achats des Fêtes.

L'Enquête mensuelle sur le commerce de détail fournit des estimations mensuelles des ventes selon le type de magasin de détail et la région géographique. Les données des mois les plus récents sont préliminaires et sujettes à révision.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 20-10-0056](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2010005601)
**Enquête :** Enquête mensuelle sur le commerce de détail
**Période de référence :** Juillet 2022
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-juillet-2022", "fr"));
```
