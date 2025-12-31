---
title: Les ventes au détail reculent de 0,9 % en février mais progressent de 3,6 % d'une année à l'autre
toc: false
---

# Les ventes au détail reculent de 0,9 % en février mais progressent de 3,6 % d'une année à l'autre

<p class="release-date">Diffusion : 29 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- Les ventes au détail ont diminué de 0,9 % en février 2023 pour s'établir à 65,7 milliards de dollars, reculant par rapport à janvier
- D'une année à l'autre, les ventes étaient en hausse de 3,6 %, un rythme de croissance annuelle solide
- L'Île-du-Prince-Édouard et le Nouveau-Brunswick ont tous deux affiché des gains exceptionnels supérieurs à 11 % d'une année à l'autre
- Seulement deux provinces ont enregistré des baisses d'une année à l'autre : la Saskatchewan et la Colombie-Britannique

</div>

Les ventes au détail au Canada ont diminué de 0,9 % en février 2023 pour s'établir à 65,7 milliards de dollars, reculant par rapport au niveau solide de janvier. Malgré la baisse mensuelle, les ventes d'une année à l'autre étaient en hausse de 3,6 % par rapport à février 2022—un taux de croissance annuelle robuste.

Février 2023 a affiché une performance régionale exceptionnellement forte à travers le Canada atlantique, avec l'Île-du-Prince-Édouard et le Nouveau-Brunswick affichant tous deux des gains à deux chiffres. Seules la Saskatchewan et la Colombie-Britannique ont vu des baisses d'une année à l'autre.

```js
import * as Plot from "npm:@observablehq/plot";

const retailData = [
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
  {date: new Date("2023-01-01"), value: 66.27},
  {date: new Date("2023-02-01"), value: 65.67}
];

display(Plot.plot({
  title: "Ventes au détail, Canada, mars 2022 à février 2023 (milliards de $)",
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

## Le Canada atlantique affiche des gains exceptionnels

L'Île-du-Prince-Édouard a mené toutes les provinces avec une croissance exceptionnelle de 12,1 % d'une année à l'autre, suivie du Nouveau-Brunswick à 11,2 %. L'Alberta a également affiché une forte croissance à deux chiffres à 10,0 %.

Seulement deux provinces ont enregistré des baisses d'une année à l'autre. La Saskatchewan a reculé de 0,8 % et la Colombie-Britannique a chuté de 1,9 %, les seules régions sous-performantes.

```js
const provincialData = [
  {province: "Île-du-Prince-Édouard", value: 12.1},
  {province: "Nouveau-Brunswick", value: 11.2},
  {province: "Alberta", value: 10.0},
  {province: "Terre-Neuve-et-Labrador", value: 7.0},
  {province: "Yukon", value: 7.0},
  {province: "Québec", value: 5.2},
  {province: "Nouvelle-Écosse", value: 3.7},
  {province: "Manitoba", value: 3.2},
  {province: "Ontario", value: 2.2},
  {province: "Saskatchewan", value: -0.8},
  {province: "Colombie-Britannique", value: -1.9}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre des ventes au détail selon la province, février 2023 (%)",
  width: 680,
  height: 340,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-4, 15]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.ruleX([3.6], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15,
      y: "province",
      text: d => (d.value > 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    }),
    Plot.text([{x: 3.6, label: "Moyenne canadienne"}], {
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

Les concessionnaires de véhicules automobiles et de pièces sont demeurés le plus important sous-secteur du commerce de détail en février, avec des ventes de 16,9 milliards de dollars. Les détaillants en alimentation et en boissons ont enregistré des ventes de 11,8 milliards de dollars.

| Sous-secteur du commerce de détail | Ventes (février 2023) |
|---|---:|
| Concessionnaires de véhicules automobiles et de pièces | 16,9 G$ |
| Détaillants en alimentation et en boissons | 11,8 G$ |
| Détaillants de marchandises diverses | 8,2 G$ |
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
**Période de référence :** Février 2023
**DOI :** [https://doi.org/10.25318/2010005601-fra](https://doi.org/10.25318/2010005601-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-detail-fevrier-2023", "fr"));
```
