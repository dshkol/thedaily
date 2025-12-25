---
title: L'emploi augmente de 54 000 en novembre 2025, le taux de chômage recule à 6,5 %
toc: false
---

# L'emploi augmente de 54 000 en novembre 2025, le taux de chômage recule à 6,5 %

<p class="release-date">Diffusion : 5 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- L'emploi a progressé de 54 000 (+0,3 %) en novembre 2025
- Le taux de chômage a diminué de 0,4 point de pourcentage pour s'établir à 6,5 %
- L'emploi total a augmenté de 309 000 (+1,5 %) par rapport à novembre 2024
- L'emploi à temps partiel a augmenté de 63 000 par rapport à octobre

</div>

L'emploi a augmenté de 54 000 (+0,3 %) en novembre 2025, après une hausse de 67 000 en octobre. Le taux de chômage a diminué de 0,4 point de pourcentage pour s'établir à 6,5 %, en baisse par rapport à 6,9 % le mois précédent.

L'emploi total s'est établi à 21,1 millions en novembre 2025, une hausse de 309 000 (+1,5 %) comparativement à novembre 2024.

Le nombre de chômeurs a diminué de 80 000 pour s'établir à 1,48 million. Sur une base annuelle, le nombre de chômeurs a reculé de 63 000 par rapport à novembre 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles du Tableau 14-10-0287
const urData = [
  {date: new Date("2023-01"), rate: 5.1},
  {date: new Date("2023-02"), rate: 5.1},
  {date: new Date("2023-03"), rate: 5.0},
  {date: new Date("2023-04"), rate: 5.1},
  {date: new Date("2023-05"), rate: 5.2},
  {date: new Date("2023-06"), rate: 5.4},
  {date: new Date("2023-07"), rate: 5.5},
  {date: new Date("2023-08"), rate: 5.5},
  {date: new Date("2023-09"), rate: 5.5},
  {date: new Date("2023-10"), rate: 5.7},
  {date: new Date("2023-11"), rate: 5.7},
  {date: new Date("2023-12"), rate: 5.8},
  {date: new Date("2024-01"), rate: 5.7},
  {date: new Date("2024-02"), rate: 5.9},
  {date: new Date("2024-03"), rate: 6.1},
  {date: new Date("2024-04"), rate: 6.2},
  {date: new Date("2024-05"), rate: 6.3},
  {date: new Date("2024-06"), rate: 6.4},
  {date: new Date("2024-07"), rate: 6.4},
  {date: new Date("2024-08"), rate: 6.7},
  {date: new Date("2024-09"), rate: 6.6},
  {date: new Date("2024-10"), rate: 6.6},
  {date: new Date("2024-11"), rate: 6.9},
  {date: new Date("2024-12"), rate: 6.7},
  {date: new Date("2025-01"), rate: 6.6},
  {date: new Date("2025-02"), rate: 6.6},
  {date: new Date("2025-03"), rate: 6.7},
  {date: new Date("2025-04"), rate: 6.9},
  {date: new Date("2025-05"), rate: 7.0},
  {date: new Date("2025-06"), rate: 6.9},
  {date: new Date("2025-07"), rate: 6.9},
  {date: new Date("2025-08"), rate: 7.1},
  {date: new Date("2025-09"), rate: 7.1},
  {date: new Date("2025-10"), rate: 6.9},
  {date: new Date("2025-11"), rate: 6.5}
];

display(Plot.plot({
  title: "Taux de chômage, janvier 2023 à novembre 2025",
  width: 680,
  height: 300,
  y: {domain: [4, 8], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(urData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(urData.slice(-1), {x: "date", y: "rate", fill: "#AF3C43", r: 5}),
    Plot.text(urData.slice(-1), {x: "date", y: "rate", text: d => d.rate.toFixed(1).replace(".", ",") + " %", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Tendance de l'emploi

```js
// Données réelles du Tableau 14-10-0287
const empData = [
  {date: new Date("2023-01"), employment: 20114},
  {date: new Date("2023-02"), employment: 20153},
  {date: new Date("2023-03"), employment: 20214},
  {date: new Date("2023-04"), employment: 20258},
  {date: new Date("2023-05"), employment: 20247},
  {date: new Date("2023-06"), employment: 20333},
  {date: new Date("2023-07"), employment: 20352},
  {date: new Date("2023-08"), employment: 20412},
  {date: new Date("2023-09"), employment: 20465},
  {date: new Date("2023-10"), employment: 20494},
  {date: new Date("2023-11"), employment: 20519},
  {date: new Date("2023-12"), employment: 20533},
  {date: new Date("2024-01"), employment: 20577},
  {date: new Date("2024-02"), employment: 20608},
  {date: new Date("2024-03"), employment: 20615},
  {date: new Date("2024-04"), employment: 20701},
  {date: new Date("2024-05"), employment: 20698},
  {date: new Date("2024-06"), employment: 20716},
  {date: new Date("2024-07"), employment: 20713},
  {date: new Date("2024-08"), employment: 20743},
  {date: new Date("2024-09"), employment: 20779},
  {date: new Date("2024-10"), employment: 20783},
  {date: new Date("2024-11"), employment: 20826},
  {date: new Date("2024-12"), employment: 20917},
  {date: new Date("2025-01"), employment: 20993},
  {date: new Date("2025-02"), employment: 20995},
  {date: new Date("2025-03"), employment: 20962},
  {date: new Date("2025-04"), employment: 20969},
  {date: new Date("2025-05"), employment: 20978},
  {date: new Date("2025-06"), employment: 21061},
  {date: new Date("2025-07"), employment: 21020},
  {date: new Date("2025-08"), employment: 20955},
  {date: new Date("2025-09"), employment: 21015},
  {date: new Date("2025-10"), employment: 21082},
  {date: new Date("2025-11"), employment: 21136}
];

display(Plot.plot({
  title: "Emploi (en milliers), janvier 2023 à novembre 2025",
  width: 680,
  height: 300,
  y: {domain: [19500, 21500], grid: true, label: "Milliers"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(empData, {x: "date", y: "employment", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(empData.slice(-1), {x: "date", y: "employment", fill: "#AF3C43", r: 5}),
    Plot.text(empData.slice(-1), {x: "date", y: "employment", text: d => (d.employment/1000).toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Sommaire du marché du travail

| Indicateur | Novembre 2025 | Octobre 2025 | Novembre 2024 | Variation mensuelle | Variation annuelle |
|-----------|---------------|--------------|---------------|---------------------|-------------------|
| Emploi (en milliers) | 21 135,5 | 21 081,9 | 20 826,4 | +53,6 | +309,1 |
| Chômage (en milliers) | 1 477,8 | 1 557,3 | 1 540,6 | -79,5 | -62,8 |
| Taux de chômage | 6,5 % | 6,9 % | 6,9 % | -0,4 pp | -0,4 pp |
| Taux d'activité | 65,1 % | 65,3 % | 65,4 % | -0,2 pp | -0,3 pp |
| Taux d'emploi | 60,9 % | 60,8 % | 60,9 % | +0,1 pp | 0,0 pp |

## Emploi à temps plein et à temps partiel

L'emploi à temps partiel a augmenté de 63 000 (+1,6 %) en novembre. Sur une base annuelle, l'emploi à temps partiel a progressé de 173 000 (+4,6 %) comparativement à novembre 2024.

L'emploi à temps plein a peu varié en novembre.

```js
const typeData = [
  {type: "Emploi à temps partiel", change: 63.0, yoy: 4.6},
  {type: "Emploi à temps plein", change: -9.4, yoy: 0.6}
];

display(Plot.plot({
  title: "Variation mensuelle de l'emploi selon le type (en milliers)",
  width: 500,
  height: 200,
  marginLeft: 150,
  marginRight: 50,
  x: {domain: [-20, 70], grid: true, label: "Variation (en milliers)"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(typeData, {
      y: "type",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32"
    }),
    Plot.text(typeData, {
      y: "type",
      x: 70,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ","),
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les estimations de l'Enquête sur la population active (EPA) reposent sur un échantillon et sont donc sujettes à la variabilité d'échantillonnage. Les estimations peuvent différer d'un mois à l'autre en raison de cette variabilité.

L'enquête recueille des données sur l'activité sur le marché du travail de la population de 15 ans et plus. La population cible de l'EPA comprend la population civile non institutionnalisée.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410028701)
**Enquête :** Enquête sur la population active
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/1410028701-fra](https://doi.org/10.25318/1410028701-fra)

</div>
