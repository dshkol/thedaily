---
title: La production de pétrole brut en hausse de 9 % d'une année à l'autre en septembre malgré un recul mensuel
toc: false
---

# La production de pétrole brut en hausse de 9 % d'une année à l'autre en septembre malgré un recul mensuel

<p class="release-date">Diffusion : 28 décembre 2025 <span class="article-type-tag backfill">Historique</span></p>

<div class="highlights">

**Faits saillants**

- La production de pétrole brut du Canada a totalisé 145,1 millions de barils en septembre 2025, en baisse de 4,0 % par rapport à août, mais en hausse de 9,0 % d'une année à l'autre
- La production quotidienne a été en moyenne de 4,8 millions de barils, comparativement à 4,4 millions de barils en septembre 2024
- L'Alberta représentait 85 % de la production nationale et a mené les gains d'une année à l'autre (+10,7 %)
- Les exportations vers les États-Unis ont totalisé 113 millions de barils, soit 91 % des exportations totales de pétrole brut

</div>

La production de pétrole brut du Canada a diminué de 4,0 % en septembre 2025 pour s'établir à 145,1 millions de barils, en baisse par rapport à 151,1 millions de barils en août. Malgré le recul mensuel, la production était supérieure de 9,0 % à celle de septembre 2024, lorsque la production avait totalisé 133,1 millions de barils.

Le recul de septembre fait suite à de solides gains en juillet et en août, lorsque la production avait atteint respectivement 153,0 millions et 151,1 millions de barils. Sur une base quotidienne, la production a été en moyenne de 4,8 millions de barils en septembre 2025, comparativement à 4,4 millions de barils en septembre 2024.

```js
import * as Plot from "npm:@observablehq/plot";

const productionData = [
  {date: new Date("2024-01-01"), value: 137.2},
  {date: new Date("2024-02-01"), value: 133.4},
  {date: new Date("2024-03-01"), value: 144.7},
  {date: new Date("2024-04-01"), value: 137.7},
  {date: new Date("2024-05-01"), value: 133.8},
  {date: new Date("2024-06-01"), value: 134.7},
  {date: new Date("2024-07-01"), value: 143.4},
  {date: new Date("2024-08-01"), value: 145.1},
  {date: new Date("2024-09-01"), value: 133.1},
  {date: new Date("2024-10-01"), value: 147.2},
  {date: new Date("2024-11-01"), value: 144.2},
  {date: new Date("2024-12-01"), value: 152.2},
  {date: new Date("2025-01-01"), value: 150.0},
  {date: new Date("2025-02-01"), value: 129.1},
  {date: new Date("2025-03-01"), value: 151.3},
  {date: new Date("2025-04-01"), value: 140.1},
  {date: new Date("2025-05-01"), value: 131.8},
  {date: new Date("2025-06-01"), value: 140.2},
  {date: new Date("2025-07-01"), value: 153.0},
  {date: new Date("2025-08-01"), value: 151.1},
  {date: new Date("2025-09-01"), value: 145.1}
];

display(Plot.plot({
  title: "Production de pétrole brut, Canada, janvier 2024 à septembre 2025 (millions de barils)",
  width: 680,
  height: 300,
  y: {domain: [120, 160], grid: true, label: "Millions de barils"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(productionData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(productionData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(productionData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## L'Alberta est le moteur des gains de production nationale

L'Alberta a produit 123,7 millions de barils en septembre 2025, ce qui représente 85 % de la production nationale de pétrole brut. La production de la province était en hausse de 10,7 % par rapport à septembre 2024, où elle avait produit 111,8 millions de barils.

La Saskatchewan, deuxième province productrice en importance, a vu sa production diminuer de 3,5 % d'une année à l'autre pour s'établir à 12,6 millions de barils. La Colombie-Britannique a enregistré le recul en pourcentage le plus important parmi les provinces productrices, la production ayant chuté de 19,9 % pour atteindre 0,3 million de barils.

**Terre-Neuve-et-Labrador** a affiché le deuxième taux de croissance le plus élevé à 8,6 %, la production passant de 6,6 millions de barils en septembre 2024 à 7,1 millions de barils.

```js
const provincialData = [
  {province: "Alberta", value: 10.7, production: 123.7},
  {province: "Terre-Neuve-et-Labrador", value: 8.6, production: 7.1},
  {province: "Ontario", value: 6.0, production: 0.02},
  {province: "Manitoba", value: 2.4, production: 1.3},
  {province: "Saskatchewan", value: -3.5, production: 12.6},
  {province: "Territoires du Nord-Ouest", value: -4.2, production: 0.1},
  {province: "Colombie-Britannique", value: -19.9, production: 0.3}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre de la production de pétrole brut selon la province, septembre 2025 (%)",
  width: 680,
  height: 280,
  marginLeft: 180,
  x: {grid: true, label: "Variation d'une année à l'autre (%)", domain: [-25, 15]},
  y: {label: null, domain: provincialData.map(d => d.province)},
  marks: [
    Plot.ruleX([0], {stroke: "#333"}),
    Plot.barX(provincialData, {
      x: "value",
      y: "province",
      fill: "#AF3C43"
    }),
    Plot.text(provincialData, {
      x: 15,
      y: "province",
      text: d => (d.value >= 0 ? "+" : "") + d.value.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fontSize: 10
    })
  ]
}));
```

## Le bitume brut est la composante de production la plus importante

La production de bitume brut non valorisé a totalisé 67,9 millions de barils en septembre 2025, ce qui représente la composante la plus importante de l'approvisionnement en pétrole brut du Canada. La production de pétrole brut synthétique, dérivé du bitume valorisé, a ajouté 39,3 millions de barils supplémentaires.

La production de pétrole brut léger et moyen a atteint 24,8 millions de barils, tandis que la production de pétrole brut lourd a totalisé 13,2 millions de barils.

| Type de production | Septembre 2025 (millions de barils) | Part du total |
|---|---:|---:|
| Bitume brut non valorisé | 67,9 | 47 % |
| Pétrole brut synthétique | 39,3 | 27 % |
| Pétrole brut léger et moyen | 24,8 | 17 % |
| Pétrole brut lourd | 13,2 | 9 % |

## Les exportations en baisse par rapport à août, mais en hausse d'une année à l'autre

Le Canada a exporté 124,3 millions de barils de pétrole brut en septembre 2025, en baisse par rapport à 132,6 millions de barils en août, mais en hausse par rapport à 115,7 millions de barils en septembre 2024.

Les exportations vers les États-Unis ont totalisé 113,0 millions de barils, soit 91 % des exportations totales de pétrole brut. Les exportations vers d'autres pays se sont chiffrées à 11,6 millions de barils.

| Destination | Septembre 2025 (millions de barils) | Part des exportations |
|---|---:|---:|
| États-Unis | 113,0 | 91 % |
| Autres pays | 11,6 | 9 % |
| **Total des exportations** | **124,3** | **100 %** |

<div class="note-to-readers">

## Note aux lecteurs

La production de pétrole brut comprend le pétrole brut classique (léger, moyen et lourd), le bitume brut provenant des exploitations des sables bitumineux (à la fois miné et in situ) et le pétrole brut synthétique produit à partir du bitume valorisé.

Les données sont recueillies au moyen de l'Enquête mensuelle sur le pétrole et le gaz et sont sujettes à révision à mesure que des renseignements plus complets deviennent disponibles.

Les volumes de production sont déclarés en barils. Un baril équivaut à environ 159 litres.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 25-10-0063](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2510006301)
**Enquête :** Enquête mensuelle sur le pétrole et le gaz
**Période de référence :** Septembre 2025
**DOI :** [https://doi.org/10.25318/2510006301-fra](https://doi.org/10.25318/2510006301-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "production-petrole-brut-septembre-2025", "fr"));
```
