---
title: Le produit intérieur brut réel en baisse de 0,3 % en octobre 2025
toc: false
---

# Le produit intérieur brut réel en baisse de 0,3 % en octobre 2025

<p class="release-date">Diffusion : 23 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- Le produit intérieur brut réel a diminué de 0,3 % en octobre 2025
- Le PIB s'établissait à 2 325,9 milliards $ en dollars enchaînés (2017)
- D'une année à l'autre, le PIB réel a augmenté de 0,4 %
- La baisse fait suite à une hausse de 0,2 % en septembre

</div>

Le produit intérieur brut (PIB) réel a diminué de 0,3 % en octobre 2025, après une hausse de 0,2 % en septembre. D'une année à l'autre, le PIB réel a progressé de 0,4 % par rapport à octobre 2024.

Le PIB total s'établissait à 2 325,9 milliards $ en dollars enchaînés (2017) en octobre, en baisse par rapport à 2 333,7 milliards $ en septembre.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 36-10-0434
const gdpData = [
  {date: new Date("2023-01"), value: 2236.2},
  {date: new Date("2023-02"), value: 2243.8},
  {date: new Date("2023-03"), value: 2250.6},
  {date: new Date("2023-04"), value: 2250.7},
  {date: new Date("2023-05"), value: 2251.3},
  {date: new Date("2023-06"), value: 2248.4},
  {date: new Date("2023-07"), value: 2250.9},
  {date: new Date("2023-08"), value: 2251.9},
  {date: new Date("2023-09"), value: 2251.2},
  {date: new Date("2023-10"), value: 2253.5},
  {date: new Date("2023-11"), value: 2259.5},
  {date: new Date("2023-12"), value: 2256.7},
  {date: new Date("2024-01"), value: 2262.8},
  {date: new Date("2024-02"), value: 2276.5},
  {date: new Date("2024-03"), value: 2277.5},
  {date: new Date("2024-04"), value: 2285.6},
  {date: new Date("2024-05"), value: 2289.0},
  {date: new Date("2024-06"), value: 2294.1},
  {date: new Date("2024-07"), value: 2298.6},
  {date: new Date("2024-08"), value: 2301.3},
  {date: new Date("2024-09"), value: 2307.5},
  {date: new Date("2024-10"), value: 2317.1},
  {date: new Date("2024-11"), value: 2312.3},
  {date: new Date("2024-12"), value: 2317.0},
  {date: new Date("2025-01"), value: 2327.2},
  {date: new Date("2025-02"), value: 2322.4},
  {date: new Date("2025-03"), value: 2324.4},
  {date: new Date("2025-04"), value: 2320.9},
  {date: new Date("2025-05"), value: 2317.7},
  {date: new Date("2025-06"), value: 2317.1},
  {date: new Date("2025-07"), value: 2329.4},
  {date: new Date("2025-08"), value: 2328.1},
  {date: new Date("2025-09"), value: 2333.7},
  {date: new Date("2025-10"), value: 2325.9}
];

display(Plot.plot({
  title: "PIB réel aux prix de base (en milliards $, prix constants de 2017)",
  width: 680,
  height: 300,
  y: {domain: [2200, 2380], grid: true, label: "Milliards $"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(gdpData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(gdpData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(gdpData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " G$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Rendement par industrie

La fabrication a été le principal contributeur à la croissance en octobre 2025, en hausse de 1,7 %. Le transport et l'entreposage ont progressé de 1,1 %, tandis que l'extraction minière, l'exploitation en carrière et l'extraction de pétrole et de gaz ont gagné 0,5 %.

Le commerce de détail a diminué de 0,8 % en octobre, tandis que la construction a reculé de 0,2 %.

```js
const sectorData = [
  {sector: "Fabrication", change: 1.72},
  {sector: "Transport et entreposage", change: 1.10},
  {sector: "Industries productrices de biens", change: 0.72},
  {sector: "Services publics", change: 0.58},
  {sector: "Extraction minière, pétrole et gaz", change: 0.54},
  {sector: "Commerce de gros", change: 0.52},
  {sector: "Agriculture, foresterie, pêche, chasse", change: 0.32},
  {sector: "Administration publique", change: 0.16},
  {sector: "Industries productrices de services", change: 0.08},
  {sector: "Construction", change: -0.16},
  {sector: "Services professionnels, scientifiques", change: -0.17},
  {sector: "Commerce de détail", change: -0.84}
];

display(Plot.plot({
  title: "Variation mensuelle par secteur (%)",
  width: 640,
  height: 380,
  marginLeft: 220,
  marginRight: 60,
  x: {domain: [-1.5, 2], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(sectorData, {
      y: "sector",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(sectorData, {
      y: "sector",
      x: d => d.change >= 0 ? 2 : -1.5,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(2).replace(".", ",") + " %",
      textAnchor: d => d.change >= 0 ? "start" : "end",
      dx: d => d.change >= 0 ? 5 : -5,
      fill: "currentColor"
    })
  ]
}));
```

## Secteurs des biens et des services

| Secteur | Octobre 2025 (en milliards $) | Variation mensuelle |
|---------|------------------------------|---------------------|
| Ensemble des industries | 2 325,9 | -0,3 % |
| Industries productrices de services | — | — |
| Industries productrices de biens | — | — |

*Remarque : Les ventilations détaillées par secteur sont disponibles dans le tableau 36-10-0434.*

<div class="note-to-readers">

## Note aux lecteurs

Le produit intérieur brut réel par industrie mesure la valeur ajoutée par chaque industrie dans la production de biens et de services. Il est calculé en enlevant l'effet des variations de prix de la valeur nominale de la production.

Les données sont présentées aux prix de base, qui excluent les impôts et les subventions sur les produits.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 36-10-0434](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3610043401)
**Enquête :** Produit intérieur brut par industrie
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/3610043401-fra](https://doi.org/10.25318/3610043401-fra)

</div>
