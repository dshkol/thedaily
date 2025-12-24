---
title: Les prix à la consommation en hausse de 2,2 % d'une année à l'autre en novembre 2025
toc: false
---

# Les prix à la consommation en hausse de 2,2 % d'une année à l'autre en novembre 2025

<p class="release-date">Diffusion : 22 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix à la consommation a augmenté de 2,2 % d'une année à l'autre en novembre 2025
- Les coûts des aliments ont augmenté de 4,2 %, la plus forte hausse
- Les prix du fonctionnement du ménage, de l'ameublement et de l'équipement du ménage ont augmenté de 3,3 % par rapport à novembre l'an dernier
- Le Manitoba a enregistré la hausse la plus élevée à 3,3 %

</div>

L'Indice des prix à la consommation (IPC) s'établissait à 165,4 en novembre 2025, en hausse de 2,2 % par rapport au même mois un an plus tôt. Il y a un an, l'indice s'établissait à 161,8.

Sur une base mensuelle, l'indice a augmenté de 0,06 %, passant de 165,3 en octobre 2025 à 165,4 en novembre 2025.

Au cours des deux dernières années, le taux d'inflation d'une année à l'autre a varié entre 1,6 % et 3,4 %.

```js
import * as Plot from "npm:@observablehq/plot";

const cpiData = [
  {date: new Date("2024-01"), value: 158.9},
  {date: new Date("2024-02"), value: 159.5},
  {date: new Date("2024-03"), value: 160.1},
  {date: new Date("2024-04"), value: 160.6},
  {date: new Date("2024-05"), value: 161.0},
  {date: new Date("2024-06"), value: 161.4},
  {date: new Date("2024-07"), value: 161.8},
  {date: new Date("2024-08"), value: 162.1},
  {date: new Date("2024-09"), value: 161.8},
  {date: new Date("2024-10"), value: 162.0},
  {date: new Date("2024-11"), value: 161.8},
  {date: new Date("2024-12"), value: 162.3},
  {date: new Date("2025-01"), value: 162.7},
  {date: new Date("2025-02"), value: 163.1},
  {date: new Date("2025-03"), value: 163.5},
  {date: new Date("2025-04"), value: 163.9},
  {date: new Date("2025-05"), value: 164.2},
  {date: new Date("2025-06"), value: 164.4},
  {date: new Date("2025-07"), value: 164.6},
  {date: new Date("2025-08"), value: 164.8},
  {date: new Date("2025-09"), value: 165.0},
  {date: new Date("2025-10"), value: 165.3},
  {date: new Date("2025-11"), value: 165.4}
];

display(Plot.plot({
  title: "Indice des prix à la consommation, décembre 2023 à novembre 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "↑ Indice (2002=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(cpiData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(cpiData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(cpiData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Tendance de l'inflation d'une année à l'autre

```js
const inflationData = [
  {date: new Date("2025-06"), rate: 1.9},
  {date: new Date("2025-07"), rate: 1.7},
  {date: new Date("2025-08"), rate: 1.9},
  {date: new Date("2025-09"), rate: 2.4},
  {date: new Date("2025-10"), rate: 2.2},
  {date: new Date("2025-11"), rate: 2.2}
];

display(Plot.plot({
  title: "Taux d'inflation d'une année à l'autre (%)",
  width: 640,
  height: 280,
  y: {domain: [0, 4], grid: true, label: "Pourcentage"},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.ruleY([1, 3], {stroke: "#ddd", strokeDasharray: "4,4"}),
    Plot.lineY(inflationData, {x: "date", y: "rate", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(inflationData, {x: "date", y: "rate", fill: "#AF3C43", r: 4})
  ]
}));
```

## Prix selon les principales composantes

Parmi les huit principales composantes de l'IPC, les prix des aliments ont affiché la plus forte hausse annuelle, soit 4,2 %. Les coûts hypothécaires et les loyers ont continué d'exercer une pression à la hausse sur cette catégorie.

Les prix des aliments ont augmenté de 4,2 %.

```js
const components = [
  {name: "Aliments", change: 4.2},
  {name: "Fonctionnement du ménage, ameublement et équipement", change: 3.3},
  {name: "Soins de santé et soins personnels", change: 3.0},
  {name: "Logement", change: 2.3},
  {name: "Boissons alcoolisées, tabac et cannabis récréatif", change: 1.4},
  {name: "Vêtements et chaussures", change: 0.8},
  {name: "Transports", change: 0.7},
  {name: "Loisirs, formation et lecture", change: 0.4}
];

display(Plot.plot({
  title: "Variation annuelle selon la composante (%)",
  width: 640,
  height: 320,
  marginLeft: 200,
  x: {domain: [-1, 5], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(components, {
      y: "name",
      x: "change",
      fill: d => d.change >= 0 ? "#AF3C43" : "#2e7d32",
      sort: {y: "-x"}
    }),
    Plot.text(components, {
      y: "name",
      x: "change",
      text: d => d.change.toFixed(1) + "%",
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Variation provinciale

Les hausses de prix ont varié d'une province à l'autre. Le Manitoba a enregistré la hausse annuelle la plus élevée, soit 3,3 %, en raison de la hausse des coûts du logement et du transport. L'Île-du-Prince-Édouard a affiché la plus faible hausse, soit 1,4 %.

| Province | Variation annuelle |
|----------|----------------------|
| Manitoba | +3,3 % |
| Québec | +3,0 % |
| Nouveau-Brunswick | +2,7 % |
| Nouvelle-Écosse | +2,4 % |
| Terre-Neuve-et-Labrador | +2,2 % |
| Saskatchewan | +2,1 % |
| Colombie-Britannique | +2,0 % |
| Ontario | +1,9 % |
| Alberta | +1,9 % |
| Île-du-Prince-Édouard | +1,4 % |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix à la consommation mesure le taux de variation des prix que subissent les consommateurs canadiens. Il est calculé en comparant le coût d'un panier fixe de biens et de services achetés par les consommateurs au fil du temps.

L'IPC n'est pas désaisonnalisé. Les variations d'un mois à l'autre peuvent refléter des tendances saisonnières en plus des tendances de prix sous-jacentes.

</div>

<div class="source-info">

**Source :** Statistique Canada, Tableau 18-10-0004
**Enquête :** Indice des prix à la consommation
**Période de référence :** novembre 2025

</div>
