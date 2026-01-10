---
title: Prix du betail en hausse de plus de 25 % d'une annee a l'autre en octobre 2025
verification_json: output/data_32_10_0107_enhanced.json
toc: false
---

# Prix du betail en hausse de plus de 25 % d'une annee a l'autre en octobre 2025

<p class="release-date">Diffusion : 29 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Les prix du betail dans les provinces des Prairies ont augmente de plus de 25 % d'une annee a l'autre, les bovins d'abattage en Alberta atteignant 293 $ le quintal
- Les prix du ble dans les Prairies ont baisse de 7,5 % a 8,6 % par rapport a octobre 2024, dans un contexte d'abondance de l'offre mondiale
- Les prix du canola ont legerement augmente de 0,6 % a 2,0 % d'une annee a l'autre dans les provinces des Prairies
- Les prix des porcs ont augmente de 12,6 % a 19,7 % au Manitoba, en Saskatchewan et en Alberta

</div>

Les prix des produits agricoles ont affiche des tendances divergentes en octobre 2025, les prix du betail ayant augmente de facon substantielle tandis que les prix des principaux grains ont continue de baisser. Les prix des bovins ont mene les gains, en hausse de plus de 25 % d'une annee a l'autre dans les provinces des Prairies, tandis que les prix du ble ont baisse de 7,5 % a 8,6 % par rapport a l'annee precedente.

La forte hausse des prix des bovins reflete la persistance des approvisionnements limites de bovins en Amerique du Nord a la suite de la contraction des troupeaux au cours des dernieres annees. En revanche, les prix du ble sont restes sous pression en raison de l'abondance de l'offre mondiale a la suite de recoltes favorables.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, tableau 32-10-0077
const cattleData = [
  {date: new Date("2023-11"), ab: 231.88, sk: 219.03, mb: 228.54},
  {date: new Date("2023-12"), ab: 228.70, sk: 213.69, mb: 224.62},
  {date: new Date("2024-01"), ab: 225.24, sk: 215.95, mb: 222.02},
  {date: new Date("2024-02"), ab: 233.40, sk: 223.19, mb: 230.06},
  {date: new Date("2024-03"), ab: 233.85, sk: 222.09, mb: 233.55},
  {date: new Date("2024-04"), ab: 235.34, sk: 222.57, mb: 232.31},
  {date: new Date("2024-05"), ab: 239.53, sk: 227.87, mb: 236.73},
  {date: new Date("2024-06"), ab: 234.65, sk: 225.84, mb: 233.29},
  {date: new Date("2024-07"), ab: 236.25, sk: 225.66, mb: 234.78},
  {date: new Date("2024-08"), ab: 237.37, sk: 221.25, mb: 231.13},
  {date: new Date("2024-09"), ab: 225.69, sk: 209.98, mb: 222.58},
  {date: new Date("2024-10"), ab: 233.46, sk: 208.61, mb: 218.89},
  {date: new Date("2024-11"), ab: 228.89, sk: 216.45, mb: 225.00},
  {date: new Date("2024-12"), ab: 231.13, sk: 218.42, mb: 227.71},
  {date: new Date("2025-01"), ab: 244.22, sk: 232.37, mb: 241.16},
  {date: new Date("2025-02"), ab: 258.06, sk: 244.63, mb: 252.91},
  {date: new Date("2025-03"), ab: 254.62, sk: 244.10, mb: 249.78},
  {date: new Date("2025-04"), ab: 268.35, sk: 254.82, mb: 264.06},
  {date: new Date("2025-05"), ab: 277.64, sk: 263.18, mb: 271.84},
  {date: new Date("2025-06"), ab: 290.55, sk: 277.00, mb: 286.78},
  {date: new Date("2025-07"), ab: 296.37, sk: 280.25, mb: 289.56},
  {date: new Date("2025-08"), ab: 296.32, sk: 275.38, mb: 285.22},
  {date: new Date("2025-09"), ab: 297.20, sk: 271.20, mb: 280.70},
  {date: new Date("2025-10"), ab: 292.79, sk: 264.32, mb: 277.76}
];

// Restructurer pour le graphique
const cattleLong = cattleData.flatMap(d => [
  {date: d.date, province: "Alberta", value: d.ab},
  {date: d.date, province: "Saskatchewan", value: d.sk},
  {date: d.date, province: "Manitoba", value: d.mb}
]);

display(Plot.plot({
  title: "Prix des bovins d'abattage selon la province, novembre 2023 a octobre 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Dollars le quintal", domain: [200, 320]},
  x: {type: "utc", label: null},
  color: {
    domain: ["Alberta", "Saskatchewan", "Manitoba"],
    range: ["#AF3C43", "#E57373", "#FFAB91"],
    legend: true
  },
  marks: [
    Plot.lineY(cattleLong, {x: "date", y: "value", stroke: "province", strokeWidth: 2}),
    Plot.dot(cattleLong.filter(d => d.date.getTime() === new Date("2025-10").getTime()), {x: "date", y: "value", fill: "province", r: 5}),
    Plot.text([{date: new Date("2025-10"), value: 292.79, province: "AB"}], {x: "date", y: "value", text: d => "292,79 $", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Prix du betail

Les prix des bovins ont augmente de facon substantielle dans toutes les provinces en octobre 2025. En Alberta, les bovins d'abattage se sont vendus en moyenne 292,79 $ le quintal, en hausse de 25,4 % par rapport a 233,46 $ en octobre 2024. Les prix des bovins en Saskatchewan ont augmente de 26,7 % d'une annee a l'autre pour atteindre 264,32 $ le quintal, tandis que les prix au Manitoba ont progresse de 26,9 % pour s'etablir a 277,76 $.

Les prix des porcs ont egalement augmente, mais de facon plus moderee. Les prix des porcs en Alberta ont atteint 126,09 $ le quintal en octobre 2025, en hausse de 19,7 % par rapport a l'annee precedente. Les prix des porcs en Saskatchewan ont augmente de 17,8 % pour atteindre 121,18 $, tandis que les porcs au Manitoba ont progresse de 12,6 % pour s'etablir a 120,39 $.

```js
const livestockYoY = [
  {product: "Bovins (AB)", oct2024: 233.46, oct2025: 292.79, yoyPct: 25.4},
  {product: "Bovins (SK)", oct2024: 208.61, oct2025: 264.32, yoyPct: 26.7},
  {product: "Bovins (MB)", oct2024: 218.89, oct2025: 277.76, yoyPct: 26.9},
  {product: "Porcs (AB)", oct2024: 105.32, oct2025: 126.09, yoyPct: 19.7},
  {product: "Porcs (SK)", oct2024: 102.86, oct2025: 121.18, yoyPct: 17.8},
  {product: "Porcs (MB)", oct2024: 106.89, oct2025: 120.39, yoyPct: 12.6}
];

display(Plot.plot({
  title: "Variation d'une annee a l'autre des prix du betail dans les Prairies, octobre 2025 (%)",
  width: 640,
  height: 280,
  marginLeft: 120,
  marginRight: 60,
  x: {grid: true, label: "Variation en pourcentage", domain: [0, 30]},
  y: {label: null},
  marks: [
    Plot.barX(livestockYoY, {
      y: "product",
      x: "yoyPct",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(livestockYoY, {
      y: "product",
      x: 29,
      text: d => "+" + d.yoyPct.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 11
    })
  ]
}));
```

<div class="data-table">

| Province | Bovins d'abattage ($/quintal) | Variation annuelle | Porcs ($/quintal) | Variation annuelle |
|----------|------------------------------:|:------------------:|------------------:|:------------------:|
| Alberta | 292,79 | +25,4 % | 126,09 | +19,7 % |
| Saskatchewan | 264,32 | +26,7 % | 121,18 | +17,8 % |
| Manitoba | 277,76 | +26,9 % | 120,39 | +12,6 % |

</div>

## Prix des cultures

Les prix du ble ont baisse dans toutes les provinces des Prairies en octobre 2025. Le ble de Saskatchewan (excluant le ble dur) a baisse a 255,29 $ la tonne metrique, en baisse de 8,6 % par rapport a 279,19 $ un an plus tot. Le ble de l'Alberta a baisse de 8,6 % pour s'etablir a 266,95 $ la tonne, tandis que le ble du Manitoba a diminue de 7,5 % a 267,58 $.

Les prix du canola ont affiche de modestes gains d'une annee a l'autre malgre une baisse d'un mois a l'autre. Le canola de Saskatchewan s'est vendu en moyenne 617,11 $ la tonne metrique, en hausse de 2,0 % par rapport a octobre 2024. Le canola de l'Alberta a augmente de 1,6 % pour atteindre 609,38 $, tandis que le canola du Manitoba a legerement progresse de 0,6 % a 613,25 $.

```js
// Donnees reelles de Statistique Canada, tableau 32-10-0077
const wheatData = [
  {date: new Date("2023-11"), ab: 362.88, sk: 348.33, mb: 351.37},
  {date: new Date("2023-12"), ab: 352.93, sk: 342.06, mb: 346.36},
  {date: new Date("2024-01"), ab: 342.00, sk: 331.86, mb: 329.66},
  {date: new Date("2024-02"), ab: 332.66, sk: 320.86, mb: 320.96},
  {date: new Date("2024-03"), ab: 323.38, sk: 313.19, mb: 314.55},
  {date: new Date("2024-04"), ab: 323.17, sk: 312.83, mb: 317.17},
  {date: new Date("2024-05"), ab: 335.69, sk: 326.42, mb: 331.29},
  {date: new Date("2024-06"), ab: 339.50, sk: 327.00, mb: 328.89},
  {date: new Date("2024-07"), ab: 311.88, sk: 301.65, mb: 305.30},
  {date: new Date("2024-08"), ab: 290.87, sk: 277.75, mb: 289.08},
  {date: new Date("2024-09"), ab: 289.10, sk: 272.75, mb: 283.37},
  {date: new Date("2024-10"), ab: 291.95, sk: 279.19, mb: 289.29},
  {date: new Date("2024-11"), ab: 291.29, sk: 279.80, mb: 293.56},
  {date: new Date("2024-12"), ab: 298.29, sk: 283.80, mb: 294.21},
  {date: new Date("2025-01"), ab: 301.35, sk: 285.66, mb: 294.66},
  {date: new Date("2025-02"), ab: 306.31, sk: 289.77, mb: 296.91},
  {date: new Date("2025-03"), ab: 307.65, sk: 290.87, mb: 298.17},
  {date: new Date("2025-04"), ab: 308.89, sk: 293.65, mb: 299.47},
  {date: new Date("2025-05"), ab: 312.54, sk: 298.64, mb: 302.03},
  {date: new Date("2025-06"), ab: 316.74, sk: 302.00, mb: 304.09},
  {date: new Date("2025-07"), ab: 310.78, sk: 299.19, mb: 302.03},
  {date: new Date("2025-08"), ab: 288.27, sk: 273.50, mb: 281.67},
  {date: new Date("2025-09"), ab: 269.01, sk: 253.72, mb: 269.72},
  {date: new Date("2025-10"), ab: 266.95, sk: 255.29, mb: 267.58}
];

// Restructurer pour le graphique
const wheatLong = wheatData.flatMap(d => [
  {date: d.date, province: "Alberta", value: d.ab},
  {date: d.date, province: "Saskatchewan", value: d.sk},
  {date: d.date, province: "Manitoba", value: d.mb}
]);

display(Plot.plot({
  title: "Prix du ble selon la province, novembre 2023 a octobre 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Dollars la tonne metrique", domain: [240, 380]},
  x: {type: "utc", label: null},
  color: {
    domain: ["Alberta", "Saskatchewan", "Manitoba"],
    range: ["#AF3C43", "#E57373", "#FFAB91"],
    legend: true
  },
  marks: [
    Plot.lineY(wheatLong, {x: "date", y: "value", stroke: "province", strokeWidth: 2}),
    Plot.dot(wheatLong.filter(d => d.date.getTime() === new Date("2025-10").getTime()), {x: "date", y: "value", fill: "province", r: 5})
  ]
}));
```

```js
const cropYoY = [
  {product: "Orge (MB)", yoyPct: 2.4},
  {product: "Canola (SK)", yoyPct: 2.0},
  {product: "Canola (AB)", yoyPct: 1.6},
  {product: "Avoine (AB)", yoyPct: 1.0},
  {product: "Canola (MB)", yoyPct: 0.6},
  {product: "Orge (AB)", yoyPct: -0.7},
  {product: "Orge (SK)", yoyPct: -3.7},
  {product: "Avoine (MB)", yoyPct: -4.6},
  {product: "Ble (MB)", yoyPct: -7.5},
  {product: "Ble (AB)", yoyPct: -8.6},
  {product: "Ble (SK)", yoyPct: -8.6},
  {product: "Avoine (SK)", yoyPct: -10.3}
];

display(Plot.plot({
  title: "Variation d'une annee a l'autre des prix des cultures dans les Prairies, octobre 2025 (%)",
  width: 640,
  height: 360,
  marginLeft: 120,
  marginRight: 60,
  x: {grid: true, label: "Variation en pourcentage", domain: [-12, 4]},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(cropYoY, {
      y: "product",
      x: "yoyPct",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(cropYoY, {
      y: "product",
      x: 3.5,
      text: d => (d.yoyPct >= 0 ? "+" : "") + d.yoyPct.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 11
    })
  ]
}));
```

<div class="data-table">

| Culture | Province | Oct. 2024 ($/tonne) | Oct. 2025 ($/tonne) | Variation annuelle |
|---------|----------|--------------------:|--------------------:|:------------------:|
| Ble | Saskatchewan | 279,19 | 255,29 | -8,6 % |
| Ble | Alberta | 291,95 | 266,95 | -8,6 % |
| Ble | Manitoba | 289,29 | 267,58 | -7,5 % |
| Canola | Saskatchewan | 605,21 | 617,11 | +2,0 % |
| Canola | Alberta | 599,57 | 609,38 | +1,6 % |
| Canola | Manitoba | 609,46 | 613,25 | +0,6 % |
| Orge | Manitoba | 243,06 | 248,82 | +2,4 % |
| Orge | Saskatchewan | 246,05 | 236,94 | -3,7 % |
| Avoine | Saskatchewan | 282,07 | 253,07 | -10,3 % |

</div>

## Comparaison provinciale

Les prix des bovins ont affiche une variation considerable d'une province a l'autre en octobre 2025. L'Alberta a enregistre les prix les plus eleves a 292,79 $ le quintal, tandis que le Quebec a enregistre les plus bas a 199,02 $. L'ecart de 93,77 $ le quintal entre les prix provinciaux les plus eleves et les plus bas reflete les differences regionales dans les conditions du marche et l'infrastructure de transformation.

```js
const provincialCattle = [
  {province: "Alberta", value: 292.79},
  {province: "Ontario", value: 291.21},
  {province: "Manitoba", value: 277.76},
  {province: "Saskatchewan", value: 264.32},
  {province: "Colombie-Britannique", value: 262.72},
  {province: "Terre-Neuve-et-Labrador", value: 243.49},
  {province: "Ile-du-Prince-Edouard", value: 241.59},
  {province: "Nouveau-Brunswick", value: 229.37},
  {province: "Nouvelle-Ecosse", value: 226.05},
  {province: "Quebec", value: 199.02}
];

display(Plot.plot({
  title: "Prix des bovins d'abattage selon la province, octobre 2025 ($/quintal)",
  width: 680,
  height: 340,
  marginLeft: 180,
  marginRight: 60,
  x: {grid: true, label: "Dollars le quintal", domain: [180, 320]},
  y: {label: null},
  marks: [
    Plot.barX(provincialCattle, {
      y: "province",
      x1: 180,
      x2: "value",
      fill: "#AF3C43",
      sort: {y: "-x2"}
    }),
    Plot.text(provincialCattle, {
      y: "province",
      x: "value",
      dx: 5,
      text: d => d.value.toFixed(2).replace(".", ",") + " $",
      textAnchor: "start",
      fontSize: 11
    })
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les prix des produits agricoles refletent les prix payes aux agriculteurs pour les produits agricoles au point de premiere vente. Les prix sont recueillis aupres de diverses sources, notamment les offices de commercialisation, les bourses de marchandises et les enquetes directes.

Les prix des cultures sont exprimes en dollars la tonne metrique, tandis que les prix du betail sont exprimes en dollars le quintal (environ 45,4 kilogrammes). Les differences de prix regionales peuvent refleter les couts de transport, les conditions locales de l'offre et de la demande et la proximite des installations de transformation.

Les donnees ne sont pas desaisonnalisees. Les prix des produits agricoles affichent generalement des tendances saisonnieres liees au calendrier des recoltes et aux cycles de commercialisation.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 32-10-0077](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3210007701)
**Enquete :** Prix des produits agricoles
**Periode de reference :** Octobre 2025
**DOI :** [https://doi.org/10.25318/3210007701-fra](https://doi.org/10.25318/3210007701-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "prix-agricoles-octobre-2025", "fr"));
```
