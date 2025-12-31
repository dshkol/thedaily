---
title: La rémunération hebdomadaire moyenne en baisse de 0,2 % en octobre, mettant fin à une série de quatre mois
toc: false
---

# La rémunération hebdomadaire moyenne en baisse de 0,2 % en octobre, mettant fin à une série de quatre mois

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- La rémunération hebdomadaire moyenne a diminué de 0,2 % en octobre 2025 pour s'établir à 1 312,16 $, mettant fin à une série de quatre mois consécutifs de hausses
- D'une année à l'autre, la rémunération a progressé de 2,2 %, un rythme plus lent que la hausse de 2,9 % enregistrée en septembre
- L'Île-du-Prince-Édouard a affiché la plus forte croissance provinciale (+4,3 % sur un an), tandis que l'Alberta a enregistré la plus faible hausse (+0,5 %)
- Les 13 provinces et territoires ont affiché des gains d'une année à l'autre malgré la baisse mensuelle

</div>

La rémunération hebdomadaire moyenne des employés payés à l'heure a diminué de 0,2 % en octobre 2025 pour s'établir à 1 312,16 $, mettant fin à une série de quatre mois consécutifs de hausses qui avait débuté en juin. Malgré la baisse mensuelle, la rémunération était supérieure de 2,2 % à celle d'octobre 2024.

Le recul d'octobre a partiellement contrebalancé les gains enregistrés depuis juin, lorsque la rémunération a commencé à augmenter à partir de 1 300,24 $. Le taux de croissance d'une année à l'autre de 2,2 % était inférieur au rythme de 2,9 % observé en septembre.

```js
import * as Plot from "npm:@observablehq/plot";

const earningsData = [
  {date: new Date("2023-11-01"), value: 1223.83},
  {date: new Date("2023-12-01"), value: 1219.19},
  {date: new Date("2024-01-01"), value: 1227.18},
  {date: new Date("2024-02-01"), value: 1231.65},
  {date: new Date("2024-03-01"), value: 1237.47},
  {date: new Date("2024-04-01"), value: 1242.41},
  {date: new Date("2024-05-01"), value: 1252.05},
  {date: new Date("2024-06-01"), value: 1255.15},
  {date: new Date("2024-07-01"), value: 1265.97},
  {date: new Date("2024-08-01"), value: 1273.80},
  {date: new Date("2024-09-01"), value: 1277.47},
  {date: new Date("2024-10-01"), value: 1284.22},
  {date: new Date("2024-11-01"), value: 1285.64},
  {date: new Date("2024-12-01"), value: 1291.17},
  {date: new Date("2025-01-01"), value: 1295.73},
  {date: new Date("2025-02-01"), value: 1294.91},
  {date: new Date("2025-03-01"), value: 1287.74},
  {date: new Date("2025-04-01"), value: 1295.29},
  {date: new Date("2025-05-01"), value: 1293.24},
  {date: new Date("2025-06-01"), value: 1300.24},
  {date: new Date("2025-07-01"), value: 1306.77},
  {date: new Date("2025-08-01"), value: 1307.87},
  {date: new Date("2025-09-01"), value: 1314.87},
  {date: new Date("2025-10-01"), value: 1312.16}
];

display(Plot.plot({
  title: "Rémunération hebdomadaire moyenne, Canada, novembre 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [1200, 1350], grid: true, label: "Dollars ($)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(earningsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(earningsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(earningsData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(2).replace(".", ",") + " $", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les provinces de l'Atlantique en tête des gains d'une année à l'autre

L'Île-du-Prince-Édouard a enregistré la plus forte hausse d'une année à l'autre de la rémunération hebdomadaire moyenne, soit 4,3 %, suivie de Terre-Neuve-et-Labrador (+4,0 %) et de la Nouvelle-Écosse (+3,5 %). Les trois provinces de l'Atlantique ont surpassé la moyenne nationale de 2,2 %.

L'Alberta a affiché le plus faible gain d'une année à l'autre parmi les provinces, soit 0,5 %, malgré l'un des niveaux de rémunération hebdomadaire moyenne les plus élevés à 1 353,54 $. La Colombie-Britannique (+1,7 %) et le Manitoba (+1,8 %) ont également enregistré une croissance inférieure à la moyenne.

```js
const provincialData = [
  {province: "Île-du-Prince-Édouard", value: 4.3},
  {province: "Terre-Neuve-et-Labrador", value: 4.0},
  {province: "Nouvelle-Écosse", value: 3.5},
  {province: "Saskatchewan", value: 3.3},
  {province: "Yukon", value: 3.2},
  {province: "Ontario", value: 2.9},
  {province: "Nouveau-Brunswick", value: 2.1},
  {province: "Québec", value: 2.0},
  {province: "Manitoba", value: 1.8},
  {province: "Colombie-Britannique", value: 1.7},
  {province: "Nunavut", value: 0.8},
  {province: "Territoires du Nord-Ouest", value: 0.8},
  {province: "Alberta", value: 0.5}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre de la rémunération hebdomadaire moyenne selon la province, octobre 2025 (%)",
  width: 680,
  height: 380,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [0, 5]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: d => d.value >= 2.2 ? "#AF3C43" : "#666666"
    }),
    Plot.text(provincialData, {
      x: "value",
      y: "province",
      text: d => d.value.toFixed(1).replace(".", ",") + " %",
      dx: 4,
      textAnchor: "start",
      fontSize: 11
    }),
    Plot.ruleX([2.2], {stroke: "#333", strokeDasharray: "4,2", strokeWidth: 1.5}),
    Plot.text([{x: 2.2, label: "Moyenne canadienne"}], {
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

## Rémunération provinciale par niveau

Bien que la croissance d'une année à l'autre ait varié considérablement d'une province à l'autre, les territoires ont continué d'afficher les niveaux de rémunération hebdomadaire moyenne les plus élevés. Le Nunavut était en tête avec 1 774,16 $, suivi des Territoires du Nord-Ouest à 1 753,40 $.

Parmi les provinces, l'Alberta (1 353,54 $), l'Ontario (1 357,26 $) et la Colombie-Britannique (1 310,62 $) ont affiché les niveaux de rémunération les plus élevés. L'Île-du-Prince-Édouard a enregistré la moyenne provinciale la plus basse à 1 141,86 $.

| Province/Territoire | Rémunération (octobre 2025) | Variation d'une année à l'autre |
|---|---:|---:|
| Nunavut | 1 774,16 $ | +0,8 % |
| Territoires du Nord-Ouest | 1 753,40 $ | +0,8 % |
| Yukon | 1 514,94 $ | +3,2 % |
| Ontario | 1 357,26 $ | +2,9 % |
| Alberta | 1 353,54 $ | +0,5 % |
| Colombie-Britannique | 1 310,62 $ | +1,7 % |
| Terre-Neuve-et-Labrador | 1 293,43 $ | +4,0 % |
| Saskatchewan | 1 277,40 $ | +3,3 % |
| Québec | 1 259,63 $ | +2,0 % |
| Nouveau-Brunswick | 1 193,47 $ | +2,1 % |
| Nouvelle-Écosse | 1 179,42 $ | +3,5 % |
| Manitoba | 1 177,18 $ | +1,8 % |
| Île-du-Prince-Édouard | 1 141,86 $ | +4,3 % |

<div class="note-to-readers">

## Note aux lecteurs

La rémunération hebdomadaire moyenne est calculée en divisant la rémunération hebdomadaire totale par le nombre d'employés. Les données sont désaisonnalisées pour tenir compte des tendances régulières telles que l'embauche accrue pendant les périodes de vacances.

L'Enquête sur l'emploi, la rémunération et les heures de travail fournit des estimations mensuelles de l'emploi, de la rémunération et des heures travaillées par industrie et région géographique. Elle couvre les employés rémunérés par retenues à la source qui reçoivent un feuillet T4.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 14-10-0223](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1410022301)
**Enquête :** Enquête sur l'emploi, la rémunération et les heures de travail
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/1410022301-fra](https://doi.org/10.25318/1410022301-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "remuneration-hebdomadaire-octobre-2025", "fr"));
```
