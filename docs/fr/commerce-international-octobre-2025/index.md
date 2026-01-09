---
title: Le déficit commercial s'élargit à 2,6 milliards de dollars en octobre 2025
toc: false
---

# Le déficit commercial s'élargit à 2,6 milliards de dollars en octobre 2025

<p class="release-date">Diffusion : 18 décembre 2025 <span class="article-type-tag release">Nouvelle diffusion</span></p>

<div class="highlights">

**Faits saillants**

- Les importations de marchandises ont augmenté de 4,2 % pour atteindre 66,8 milliards de dollars en octobre 2025
- Les exportations sont demeurées essentiellement inchangées à 64,2 milliards de dollars
- Le déficit commercial du Canada s'est élargi à 2,6 milliards de dollars, après un excédent de 0,2 milliard de dollars en septembre
- Les États-Unis sont demeurés le principal partenaire commercial avec 45,8 milliards de dollars en exportations

</div>

Les importations de marchandises ont progressé de 4,2 % pour atteindre 66,8 milliards de dollars en octobre 2025, tandis que les exportations sont demeurées essentiellement inchangées à 64,2 milliards de dollars. Il en a résulté un élargissement du déficit commercial du Canada à 2,6 milliards de dollars, renversant le léger excédent de septembre.

D'une année à l'autre, les exportations ont reculé de 1,3 % par rapport à octobre 2024, tandis que les importations ont augmenté de 1,9 %.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 12-10-0011 de Statistique Canada (valeurs en milliards $)
const tradeData = [
  {date: new Date("2024-10"), exports: 65.07, imports: 65.56},
  {date: new Date("2024-11"), exports: 66.42, imports: 67.03},
  {date: new Date("2024-12"), exports: 69.92, imports: 69.15},
  {date: new Date("2025-01"), exports: 72.86, imports: 69.22},
  {date: new Date("2025-02"), exports: 68.81, imports: 69.89},
  {date: new Date("2025-03"), exports: 67.45, imports: 69.38},
  {date: new Date("2025-04"), exports: 60.04, imports: 67.32},
  {date: new Date("2025-05"), exports: 61.03, imports: 66.78},
  {date: new Date("2025-06"), exports: 61.48, imports: 67.05},
  {date: new Date("2025-07"), exports: 62.37, imports: 66.19},
  {date: new Date("2025-08"), exports: 60.40, imports: 66.83},
  {date: new Date("2025-09"), exports: 64.23, imports: 64.08},
  {date: new Date("2025-10"), exports: 64.20, imports: 66.80}
];

display(Plot.plot({
  title: "Commerce de marchandises, octobre 2024 à octobre 2025 (en milliards $)",
  width: 680,
  height: 320,
  y: {domain: [55, 75], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(tradeData, {x: "date", y: "exports", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.lineY(tradeData, {x: "date", y: "imports", stroke: "#1f77b4", strokeWidth: 2}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "exports", fill: "#AF3C43", r: 5}),
    Plot.dot(tradeData.slice(-1), {x: "date", y: "imports", fill: "#1f77b4", r: 5}),
    Plot.text([{x: new Date("2025-05"), y: 73, text: "Exportations"}], {x: "x", y: "y", text: "text", fill: "#AF3C43", fontSize: 12}),
    Plot.text([{x: new Date("2025-05"), y: 70, text: "Importations"}], {x: "x", y: "y", text: "text", fill: "#1f77b4", fontSize: 12})
  ]
}));
```

## Commerce avec les États-Unis

Les exportations vers les États-Unis ont atteint 45,8 milliards de dollars en octobre 2025, ce qui représente 71 % des exportations totales de marchandises. Les importations en provenance des États-Unis ont totalisé 37,2 milliards de dollars.

Le Canada a enregistré un excédent commercial de 8,6 milliards de dollars avec les États-Unis en octobre.

## Principales destinations des exportations

| Partenaire | Exportations (en milliards $) | Part du total |
|------------|------------------------------|---------------|
| États-Unis | 45,8 | 71,4 % |
| Union européenne | 3,7 | 5,7 % |
| Royaume-Uni | 3,2 | 5,1 % |
| Chine | 2,5 | 4,0 % |
| Japon | 1,1 | 1,8 % |
| Suisse | 1,0 | 1,6 % |
| Allemagne | 0,9 | 1,5 % |
| Mexique | 0,8 | 1,3 % |

```js
const partnerData = [
  {partner: "États-Unis", value: 45.8},
  {partner: "Union européenne", value: 3.7},
  {partner: "Royaume-Uni", value: 3.2},
  {partner: "Chine", value: 2.5},
  {partner: "Japon", value: 1.1},
  {partner: "Autres", value: 7.9}
];

display(Plot.plot({
  title: "Exportations de marchandises par destination, octobre 2025 (en milliards $)",
  width: 500,
  height: 280,
  marginLeft: 140,
  x: {grid: true, label: "Milliards $"},
  y: {label: null},
  marks: [
    Plot.barX(partnerData, {
      y: "partner",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(partnerData, {
      y: "partner",
      x: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + " G$",
      dx: 30,
      fill: "currentColor"
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les données sur le commerce international de marchandises sont exprimées en dollars courants et sont désaisonnalisées. Les données portent sur le commerce de biens entre le Canada et ses partenaires commerciaux.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 12-10-0011](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1210001101)
**Enquête :** Commerce international canadien de marchandises
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1210001101-fra](https://doi.org/10.25318/1210001101-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "commerce-international-octobre-2025", "fr"));
```
