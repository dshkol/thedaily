---
title: L'emploi en hausse de 76 000 en janvier 2025, le taux de chômage recule à 6,6 %
toc: false
---

# L'emploi en hausse de 76 000 en janvier 2025, le taux de chômage recule à 6,6 %

<p class="release-date">Diffusion : 7 février 2025</p>

<div class="highlights">

- L'emploi a augmenté de 76 000 (+0,4 %) en janvier 2025
- Le taux de chômage a reculé de 0,1 point de pourcentage pour s'établir à 6,6 %
- L'emploi total a augmenté de 416 000 (+2,0 %) par rapport à janvier 2024
- L'emploi à temps plein a mené les gains, en hausse de 34 000 par rapport à décembre

</div>

L'emploi a augmenté de 76 000 (+0,4 %) en janvier 2025, un gain solide après une hausse de 91 000 en décembre. Le taux de chômage a reculé de 0,1 point de pourcentage pour s'établir à 6,6 %, en baisse par rapport à 6,7 % le mois précédent.

L'emploi total s'est établi à 21,0 millions en janvier 2025, soit une hausse de 416 000 (+2,0 %) par rapport à janvier 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, Tableau 14-10-0287
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
  {date: new Date("2025-01"), rate: 6.6}
];

display(Plot.plot({
  title: "Taux de chômage, janvier 2023 à janvier 2025",
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
// Données réelles de Statistique Canada, Tableau 14-10-0287
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
  {date: new Date("2025-01"), employment: 20993}
];

display(Plot.plot({
  title: "Emploi (en milliers), janvier 2023 à janvier 2025",
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

| Indicateur | Janvier 2025 | Décembre 2024 | Janvier 2024 | Variation mensuelle | Variation annuelle |
|-----------|---------------|--------------|---------------|----------------|----------------------|
| Emploi (en milliers) | 20 993,0 | 20 917,0 | 20 577,0 | +76,0 | +416,0 |
| Taux de chômage | 6,6 % | 6,7 % | 5,7 % | -0,1 pp | +0,9 pp |
| Taux d'activité | 65,5 % | 65,4 % | 65,2 % | +0,1 pp | +0,3 pp |
| Taux d'emploi | 61,1 % | 61,0 % | 61,4 % | +0,1 pp | -0,3 pp |

## Emploi à temps plein et à temps partiel

L'emploi à temps plein a augmenté de 34 000 (+0,4 %) en janvier. L'emploi à temps partiel a augmenté de 41 000.

```js
const typeData = [
  {type: "Emploi à temps plein", change: 33.9, yoy: 1.8},
  {type: "Emploi à temps partiel", change: 40.9, yoy: 2.6}
];

display(Plot.plot({
  title: "Variation mensuelle de l'emploi selon le type (en milliers)",
  width: 500,
  height: 200,
  marginLeft: 150,
  marginRight: 50,
  x: {domain: [-20, 80], grid: true, label: "Variation (en milliers)"},
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
      x: 80,
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

Les estimations de l'Enquête sur la population active (EPA) sont fondées sur un échantillon et sont donc sujettes à la variabilité d'échantillonnage. Les estimations peuvent varier d'un mois à l'autre en raison de la variabilité d'échantillonnage.

L'enquête recueille des données sur l'activité sur le marché du travail de la population âgée de 15 ans et plus. La population cible de l'EPA comprend la population civile non institutionnalisée.

Cet article de rattrapage couvre les données de janvier 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410028701)
**Enquête :** Enquête sur la population active
**Période de référence :** Janvier 2025
**DOI :** [https://doi.org/10.25318/1410028701-fra](https://doi.org/10.25318/1410028701-fra)

</div>
