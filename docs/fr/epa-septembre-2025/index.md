---
title: L'emploi en hausse de 60 000 en septembre 2025, le taux de chômage inchangé à 7,1 %
toc: false
---

# L'emploi en hausse de 60 000 en septembre 2025, le taux de chômage inchangé à 7,1 %

<p class="release-date">Diffusion : 11 octobre 2025</p>

<div class="highlights">

- L'emploi a augmenté de 60 000 (+0,3 %) en septembre 2025
- Le taux de chômage est demeuré stable à 7,1 %
- D'une année à l'autre, l'emploi a progressé de 1,1 %, tandis que le taux de chômage a augmenté de 0,5 point de pourcentage

</div>

L'emploi a augmenté de 60 000 en septembre 2025, après avoir diminué de 65 000 en août. Le taux de chômage est demeuré inchangé à 7,1 %, se maintenant près des niveaux élevés observés depuis le milieu de 2025.

D'une année à l'autre, l'emploi a progressé de 236 000 (+1,1 %), tandis que le taux de chômage était supérieur de 0,5 point de pourcentage à celui de septembre 2024, alors qu'il s'établissait à 6,6 %.

## Tendances de l'emploi

La hausse de l'emploi en septembre a partiellement compensé la baisse enregistrée en août. L'emploi total a atteint 21,0 millions en septembre, comparativement à 20,8 millions un an plus tôt.

```js
import * as Plot from "npm:@observablehq/plot";

const employmentData = [
  {date: new Date("2024-01-01"), value: 20577.1},
  {date: new Date("2024-02-01"), value: 20607.7},
  {date: new Date("2024-03-01"), value: 20614.5},
  {date: new Date("2024-04-01"), value: 20700.5},
  {date: new Date("2024-05-01"), value: 20698.3},
  {date: new Date("2024-06-01"), value: 20715.9},
  {date: new Date("2024-07-01"), value: 20712.9},
  {date: new Date("2024-08-01"), value: 20742.6},
  {date: new Date("2024-09-01"), value: 20779.3},
  {date: new Date("2024-10-01"), value: 20782.6},
  {date: new Date("2024-11-01"), value: 20826.4},
  {date: new Date("2024-12-01"), value: 20917.4},
  {date: new Date("2025-01-01"), value: 20993.4},
  {date: new Date("2025-02-01"), value: 20994.5},
  {date: new Date("2025-03-01"), value: 20961.9},
  {date: new Date("2025-04-01"), value: 20969.3},
  {date: new Date("2025-05-01"), value: 20978.1},
  {date: new Date("2025-06-01"), value: 21061.2},
  {date: new Date("2025-07-01"), value: 21020.4},
  {date: new Date("2025-08-01"), value: 20954.9},
  {date: new Date("2025-09-01"), value: 21015.3}
];

display(Plot.plot({
  title: "Emploi, Canada (milliers, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [20400, 21200],
    grid: true,
    label: "Milliers"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(employmentData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(employmentData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(employmentData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    })
  ]
}));
```

## Taux de chômage

Le taux de chômage est demeuré à 7,1 % en septembre, inchangé par rapport à août. Le taux est demeuré élevé depuis le milieu de 2025, en hausse par rapport aux niveaux d'environ 6,5 % observés au début de 2025.

```js
const unemploymentData = [
  {date: new Date("2024-01-01"), value: 5.7},
  {date: new Date("2024-02-01"), value: 5.9},
  {date: new Date("2024-03-01"), value: 6.1},
  {date: new Date("2024-04-01"), value: 6.2},
  {date: new Date("2024-05-01"), value: 6.3},
  {date: new Date("2024-06-01"), value: 6.4},
  {date: new Date("2024-07-01"), value: 6.4},
  {date: new Date("2024-08-01"), value: 6.7},
  {date: new Date("2024-09-01"), value: 6.6},
  {date: new Date("2024-10-01"), value: 6.6},
  {date: new Date("2024-11-01"), value: 6.9},
  {date: new Date("2024-12-01"), value: 6.7},
  {date: new Date("2025-01-01"), value: 6.6},
  {date: new Date("2025-02-01"), value: 6.6},
  {date: new Date("2025-03-01"), value: 6.7},
  {date: new Date("2025-04-01"), value: 6.9},
  {date: new Date("2025-05-01"), value: 7.0},
  {date: new Date("2025-06-01"), value: 6.9},
  {date: new Date("2025-07-01"), value: 6.9},
  {date: new Date("2025-08-01"), value: 7.1},
  {date: new Date("2025-09-01"), value: 7.1}
];

display(Plot.plot({
  title: "Taux de chômage, Canada (%, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [5.5, 7.5],
    grid: true,
    label: "Pourcentage"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(unemploymentData, {x: "date", y: "value", fill: "#2e7d32", fillOpacity: 0.1}),
    Plot.lineY(unemploymentData, {x: "date", y: "value", stroke: "#2e7d32", strokeWidth: 2}),
    Plot.dot(unemploymentData.filter(d => d.date.getTime() === new Date("2025-09-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#2e7d32",
      r: 5
    }),
    Plot.ruleY([7.1], {stroke: "#2e7d32", strokeDasharray: "4 2", strokeOpacity: 0.5})
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Septembre 2025 | Variation par rapport à août | Variation par rapport à septembre 2024 |
|-----------|---------------:|-------------------:|---------------------------:|
| Emploi (milliers) | 21 015,3 | +60,4 | +236,0 (+1,1 %) |
| Taux de chômage (%) | 7,1 | 0,0 pp | +0,5 pp |

<div class="note-to-readers">

**Note aux lecteurs**

Les estimations de l'Enquête sur la population active (EPA) sont fondées sur un échantillon et sont sujettes à la variabilité d'échantillonnage. Les variations mensuelles de l'emploi de moins d'environ 35 000 ne sont pas statistiquement significatives au niveau de confiance de 68 %.

Cet article de rattrapage couvre les données de septembre 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410028701)
**Enquête :** Enquête sur la population active
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/1410028701-fra](https://doi.org/10.25318/1410028701-fra)

</div>
