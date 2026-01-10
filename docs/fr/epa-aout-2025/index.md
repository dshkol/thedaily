---
title: L'emploi en baisse de 65 000 en août 2025, le taux de chômage monte à 7,1 %
verification_json: output/data_14_10_0287_enhanced.json
toc: false
---

# L'emploi en baisse de 65 000 en août 2025, le taux de chômage monte à 7,1 %

<p class="release-date">Diffusion : 6 septembre 2025</p>

<div class="highlights">

- L'emploi a diminué de 65 000 (-0,3 %) en août 2025
- Le taux de chômage a augmenté de 0,2 point de pourcentage pour s'établir à 7,1 %
- D'une année à l'autre, l'emploi a progressé de 1,0 %, tandis que le taux de chômage a augmenté de 0,4 point de pourcentage

</div>

L'emploi a diminué de 65 000 en août 2025, après un recul de 41 000 en juillet. Le taux de chômage a augmenté de 0,2 point de pourcentage pour s'établir à 7,1 %, le niveau le plus élevé depuis le début de 2022.

D'une année à l'autre, l'emploi a progressé de 212 000 (+1,0 %), tandis que le taux de chômage était supérieur de 0,4 point de pourcentage à celui d'août 2024, alors qu'il s'établissait à 6,7 %.

## Tendances de l'emploi

L'emploi a diminué pour un deuxième mois consécutif en août, l'emploi total passant de 21,02 millions en juillet à 20,95 millions. Malgré la baisse mensuelle, l'emploi est demeuré supérieur aux niveaux enregistrés un an plus tôt.

```js
import * as Plot from "npm:@observablehq/plot";

const employmentData = [
  {date: new Date("2023-08-01"), value: 20443.2},
  {date: new Date("2023-09-01"), value: 20432.4},
  {date: new Date("2023-10-01"), value: 20503.9},
  {date: new Date("2023-11-01"), value: 20522.3},
  {date: new Date("2023-12-01"), value: 20520.9},
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
  {date: new Date("2025-08-01"), value: 20954.9}
];

display(Plot.plot({
  title: "Emploi, Canada (en milliers, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [20300, 21200],
    grid: true,
    label: "Milliers"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(employmentData, {x: "date", y: "value", fill: "#AF3C43", fillOpacity: 0.1}),
    Plot.lineY(employmentData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(employmentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#AF3C43",
      r: 5
    }),
    Plot.text(employmentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => d.value.toLocaleString("fr-CA") + " K",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

## Taux de chômage

Le taux de chômage a augmenté à 7,1 % en août, en hausse par rapport à 6,9 % en juillet. Il s'agit du niveau le plus élevé depuis le début de 2022, ce qui poursuit la tendance à la hausse observée depuis le printemps 2025.

```js
const unemploymentData = [
  {date: new Date("2023-08-01"), value: 5.5},
  {date: new Date("2023-09-01"), value: 5.5},
  {date: new Date("2023-10-01"), value: 5.8},
  {date: new Date("2023-11-01"), value: 5.8},
  {date: new Date("2023-12-01"), value: 5.8},
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
  {date: new Date("2025-08-01"), value: 7.1}
];

display(Plot.plot({
  title: "Taux de chômage, Canada (%, données désaisonnalisées)",
  width: 700,
  height: 400,
  y: {
    domain: [5.0, 7.5],
    grid: true,
    label: "Pourcentage"
  },
  x: {
    label: null
  },
  marks: [
    Plot.areaY(unemploymentData, {x: "date", y: "value", fill: "#2e7d32", fillOpacity: 0.1}),
    Plot.lineY(unemploymentData, {x: "date", y: "value", stroke: "#2e7d32", strokeWidth: 2}),
    Plot.dot(unemploymentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      fill: "#2e7d32",
      r: 5
    }),
    Plot.text(unemploymentData.filter(d => d.date.getTime() === new Date("2025-08-01").getTime()), {
      x: "date",
      y: "value",
      text: d => d.value.toFixed(1).replace(".", ",") + " %",
      dy: -12,
      fill: "#2e7d32",
      fontWeight: 600
    })
  ]
}));
```

## Tableau récapitulatif

| Indicateur | Août 2025 | Variation par rapport à juillet | Variation par rapport à août 2024 |
|-----------|----------:|--------------------------------:|----------------------------------:|
| Emploi (en milliers) | 20 954,9 | -65,5 | +212,3 (+1,0 %) |
| Taux de chômage (%) | 7,1 | +0,2 pp | +0,4 pp |

<div class="note-to-readers">

**Note aux lecteurs**

Les estimations de l'Enquête sur la population active (EPA) sont fondées sur un échantillon et sont donc sujettes à la variabilité d'échantillonnage. Les variations mensuelles de l'emploi inférieures à environ 35 000 ne sont pas statistiquement significatives au niveau de confiance de 68 %.

Cet article de rattrapage couvre les données d'août 2025, publié dans le cadre de l'initiative de couverture historique du D-AI-LY.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0287](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410028701)
**Enquête :** Enquête sur la population active
**Période de référence :** Août 2025
**DOI :** [https://doi.org/10.25318/1410028701-fra](https://doi.org/10.25318/1410028701-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "epa-aout-2025", "fr"));
```
