---
title: L'emploi en légère hausse de 9 000 en mai 2025, le taux de chômage monte à 7,0 %
toc: false
---

# L'emploi en légère hausse de 9 000 en mai 2025, le taux de chômage monte à 7,0 %

<p class="release-date">Diffusion : 6 juin 2025</p>

<div class="highlights">

- L'emploi a augmenté de 9 000 (+0,0 %) en mai 2025
- Le taux de chômage a augmenté de 0,1 point de pourcentage pour s'établir à 7,0 %
- L'emploi total a augmenté de 280 000 (+1,4 %) par rapport à mai 2024
- L'emploi à temps plein a mené les gains, en hausse de 29 000 par rapport à avril

</div>

L'emploi a légèrement progressé de 9 000 (+0,0 %) en mai 2025, un gain modeste après une perte de 7 000 en avril. Le taux de chômage a augmenté de 0,1 point de pourcentage pour s'établir à 7,0 %, un plus grand nombre de personnes s'étant jointes à la population active.

L'emploi total s'est établi à 21,0 millions en mai 2025, soit une hausse de 280 000 (+1,4 %) par rapport à mai 2024.

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
  {date: new Date("2025-01"), rate: 6.6},
  {date: new Date("2025-02"), rate: 6.6},
  {date: new Date("2025-03"), rate: 6.7},
  {date: new Date("2025-04"), rate: 6.9},
  {date: new Date("2025-05"), rate: 7.0}
];

display(Plot.plot({
  title: "Taux de chômage, janvier 2023 à mai 2025",
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
  {date: new Date("2025-01"), employment: 20993},
  {date: new Date("2025-02"), employment: 20995},
  {date: new Date("2025-03"), employment: 20962},
  {date: new Date("2025-04"), employment: 20969},
  {date: new Date("2025-05"), employment: 20978}
];

display(Plot.plot({
  title: "Emploi (en milliers), janvier 2023 à mai 2025",
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

| Indicateur | Mai 2025 | Avril 2025 | Mai 2024 | Variation mensuelle | Variation annuelle |
|-----------|---------------|--------------|---------------|----------------|----------------------|
| Emploi (en milliers) | 20 978,0 | 20 969,0 | 20 698,0 | +9,0 | +280,0 |
| Taux de chômage | 7,0 % | 6,9 % | 6,3 % | +0,1 pp | +0,7 pp |
| Taux d'activité | 65,3 % | 65,3 % | 65,0 % | 0,0 pp | +0,3 pp |
| Taux d'emploi | 60,8 % | 60,8 % | 60,9 % | 0,0 pp | -0,1 pp |

## Emploi à temps plein et à temps partiel

L'emploi à temps plein a augmenté de 29 000 (+0,3 %) en mai. L'emploi à temps partiel a diminué de 49 000.

```js
const typeData = [
  {type: "Emploi à temps plein", change: 28.5, yoy: 1.2},
  {type: "Emploi à temps partiel", change: -48.8, yoy: 2.0}
];

display(Plot.plot({
  title: "Variation mensuelle de l'emploi selon le type (en milliers)",
  width: 500,
  height: 200,
  marginLeft: 150,
  marginRight: 50,
  x: {domain: [-30, 40], grid: true, label: "Variation (en milliers)"},
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
      x: d => d.change >= 0 ? 40 : -30,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ","),
      textAnchor: d => d.change >= 0 ? "end" : "start",
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

Cet article de rattrapage couvre les données de mai 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410028701)
**Enquête :** Enquête sur la population active
**Période de référence :** Mai 2025
**DOI :** [https://doi.org/10.25318/1410028701-fra](https://doi.org/10.25318/1410028701-fra)

</div>
