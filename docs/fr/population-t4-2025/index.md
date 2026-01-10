---
title: La population du Canada recule pour la première fois depuis 2020, l'Ontario en tête des baisses
verification_json: output/data_17_10_0009_enhanced.json
toc: false
---

# La population du Canada recule pour la première fois depuis 2020, l'Ontario en tête des baisses

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- La population du Canada a diminué de 76 068 personnes au quatrième trimestre de 2025, soit le premier recul trimestriel depuis le T4 2020
- L'Ontario représentait 88 % de la baisse nationale, perdant 66 888 résidents
- L'Alberta était la seule province à enregistrer une croissance démographique (+11 525)
- La croissance d'une année à l'autre a fortement ralenti à 0,2 %, en baisse par rapport au sommet de 7,9 % atteint à la mi-2024

</div>

La population du Canada a diminué pour s'établir à 41 575 585 au quatrième trimestre de 2025, en baisse de 76 068 (-0,18 %) par rapport au trimestre précédent. Il s'agit du premier recul trimestriel de la population depuis le quatrième trimestre de 2020, lorsque la croissance avait brièvement stagné pendant la pandémie de COVID-19.

Ce recul a mis fin à une série de 19 trimestres consécutifs de croissance démographique qui avait débuté au début de 2021. La croissance d'une année à l'autre a ralenti à seulement 0,2 %, une décélération marquée par rapport au rythme de 7,9 % enregistré à la mi-2024.

```js
import * as Plot from "npm:@observablehq/plot";

const populationData = [
  {date: new Date("2020-01-01"), value: 37.93, label: "T1 2020"},
  {date: new Date("2020-04-01"), value: 38.01, label: "T2 2020"},
  {date: new Date("2020-07-01"), value: 38.03, label: "T3 2020"},
  {date: new Date("2020-10-01"), value: 38.03, label: "T4 2020"},
  {date: new Date("2021-01-01"), value: 38.06, label: "T1 2021"},
  {date: new Date("2021-04-01"), value: 38.14, label: "T2 2021"},
  {date: new Date("2021-07-01"), value: 38.24, label: "T3 2021"},
  {date: new Date("2021-10-01"), value: 38.46, label: "T4 2021"},
  {date: new Date("2022-01-01"), value: 38.57, label: "T1 2022"},
  {date: new Date("2022-04-01"), value: 38.69, label: "T2 2022"},
  {date: new Date("2022-07-01"), value: 38.95, label: "T3 2022"},
  {date: new Date("2022-10-01"), value: 39.28, label: "T4 2022"},
  {date: new Date("2023-01-01"), value: 39.50, label: "T1 2023"},
  {date: new Date("2023-04-01"), value: 39.73, label: "T2 2023"},
  {date: new Date("2023-07-01"), value: 40.05, label: "T3 2023"},
  {date: new Date("2023-10-01"), value: 40.47, label: "T4 2023"},
  {date: new Date("2024-01-01"), value: 40.72, label: "T1 2024"},
  {date: new Date("2024-04-01"), value: 40.99, label: "T2 2024"},
  {date: new Date("2024-07-01"), value: 41.26, label: "T3 2024"},
  {date: new Date("2024-10-01"), value: 41.49, label: "T4 2024"},
  {date: new Date("2025-01-01"), value: 41.57, label: "T1 2025"},
  {date: new Date("2025-04-01"), value: 41.60, label: "T2 2025"},
  {date: new Date("2025-07-01"), value: 41.65, label: "T3 2025"},
  {date: new Date("2025-10-01"), value: 41.58, label: "T4 2025"}
];

display(Plot.plot({
  title: "Population du Canada, T1 2020 à T4 2025 (millions)",
  width: 680,
  height: 320,
  y: {domain: [37, 42.5], grid: true, label: "Population (millions)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(populationData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(populationData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(populationData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(2).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600}),
    Plot.areaY(populationData.slice(-2), {x: "date", y1: d => Math.min(...populationData.slice(-2).map(p => p.value)), y2: "value", fill: "#AF3C43", fillOpacity: 0.1})
  ]
}));
```

## L'Ontario représente la quasi-totalité du recul national

L'Ontario a perdu 66 888 résidents au quatrième trimestre, ce qui représente 88 % du recul démographique national. La population de la province a diminué pour s'établir à 16 191 372, soit une baisse de 0,4 % par rapport au trimestre précédent.

La Colombie-Britannique (-14 335) et le Manitoba (-2 645) ont également enregistré des baisses notables. La population du Québec est demeurée essentiellement inchangée, ne diminuant que de 208 résidents.

**L'Alberta était la seule province à enregistrer une croissance démographique** au quatrième trimestre, ajoutant 11 525 résidents (+0,2 %). Le Nunavut a également affiché un léger gain de 89 personnes.

```js
const provincialData = [
  {province: "Alberta", value: 11525, pct: 0.23},
  {province: "Nunavut", value: 89, pct: 0.21},
  {province: "Québec", value: -208, pct: -0.00},
  {province: "Saskatchewan", value: -725, pct: -0.06},
  {province: "Île-du-Prince-Édouard", value: -149, pct: -0.08},
  {province: "Territoires du Nord-Ouest", value: -102, pct: -0.22},
  {province: "Terre-Neuve-et-Labrador", value: -173, pct: -0.03},
  {province: "Yukon", value: -17, pct: -0.04},
  {province: "Nouveau-Brunswick", value: -1052, pct: -0.12},
  {province: "Nouvelle-Écosse", value: -1388, pct: -0.13},
  {province: "Manitoba", value: -2645, pct: -0.18},
  {province: "Colombie-Britannique", value: -14335, pct: -0.25},
  {province: "Ontario", value: -66888, pct: -0.41}
];

display(Plot.plot({
  title: "Variation de la population selon la province, T4 2025 (nombre de personnes)",
  width: 680,
  height: 400,
  marginLeft: 180,
  x: {grid: true, label: "Variation de la population", domain: [-70000, 15000]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15000,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toLocaleString("fr-CA"),
      textAnchor: "end",
      fontSize: 10
    })
  ]
}));
```

## Ralentissement marqué de la croissance démographique

Le recul du quatrième trimestre fait suite à une période de croissance démographique historiquement rapide. La croissance d'une année à l'autre de la population du Canada avait atteint un sommet de 7,9 % à la mi-2024, alimentée en grande partie par l'immigration. La croissance a depuis considérablement ralenti, tombant à 0,2 % au quatrième trimestre de 2025.

Ce ralentissement reflète les changements apportés à la politique d'immigration annoncés à la fin de 2024, qui ont réduit les cibles pour les résidents temporaires et les immigrants permanents.

| Trimestre | Population | Variation trimestrielle | Variation annuelle |
|---|---:|---:|---:|
| T4 2024 | 41 494 132 | +0,56 % | +7,89 % |
| T1 2025 | 41 574 517 | +0,19 % | +7,80 % |
| T2 2025 | 41 604 555 | +0,07 % | +7,52 % |
| T3 2025 | 41 651 653 | +0,11 % | +6,94 % |
| T4 2025 | 41 575 585 | **-0,18 %** | +0,20 % |

<div class="note-to-readers">

## Note aux lecteurs

Les estimations de la population sont produites trimestriellement par Statistique Canada. Les estimations du 1er octobre (T4) représentent la population à cette date.

La croissance démographique se compose de l'accroissement naturel (naissances moins décès), de la migration internationale (immigration, émigration, émigrants de retour et résidents non permanents nets) et de la migration interprovinciale.

Les estimations pour les trimestres les plus récents sont préliminaires et sujettes à révision à mesure que des données plus complètes deviennent disponibles.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 17-10-0009](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1710000901)
**Enquête :** Programme des estimations démographiques
**Période de référence :** Quatrième trimestre 2025
**DOI :** [https://doi.org/10.25318/1710000901-fra](https://doi.org/10.25318/1710000901-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "population-t4-2025", "fr"));
```
