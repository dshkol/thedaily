---
title: Le credit aux menages en hausse de 4,5 % d'une annee a l'autre en octobre 2025
toc: false
---

# Le credit aux menages en hausse de 4,5 % d'une annee a l'autre en octobre 2025

<p class="release-date">Diffusion : 29 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- Le credit total des menages a atteint 3,2 billions de dollars en octobre 2025, en hausse de 4,5 % d'une annee a l'autre
- Les prets hypothecaires representaient 74,7 % du credit total des menages, en hausse de 4,8 % par rapport a l'annee precedente
- Le credit non hypothecaire a augmente de 3,8 % d'une annee a l'autre, pour atteindre 807,3 milliards de dollars
- Les soldes de cartes de credit ont augmente de 3,8 % tandis que les prets automobiles ont progresse de 1,0 % sur 12 mois
- Le credit des menages a augmente de 29,7 % au cours des cinq dernieres annees

</div>

Le passif de credit total des menages s'etablissait a 3 196,2 milliards de dollars en octobre 2025, en hausse de 4,5 % par rapport au meme mois de l'annee precedente. Sur une base mensuelle, le credit des menages a augmente de 0,4 % par rapport a septembre 2025.

Le taux de croissance annuel de 4,5 % etait legerement inferieur aux 4,6 % enregistres en septembre, mais demeurait eleve par rapport a la fourchette de 3,5 % a 4,0 % observee pendant la majeure partie de 2023 et au debut de 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, tableau 36-10-0639
const creditData = [
  {date: new Date("2022-11"), value: 2844600},
  {date: new Date("2022-12"), value: 2851266},
  {date: new Date("2023-01"), value: 2857472},
  {date: new Date("2023-02"), value: 2865330},
  {date: new Date("2023-03"), value: 2872325},
  {date: new Date("2023-04"), value: 2881997},
  {date: new Date("2023-05"), value: 2892052},
  {date: new Date("2023-06"), value: 2899507},
  {date: new Date("2023-07"), value: 2909464},
  {date: new Date("2023-08"), value: 2919393},
  {date: new Date("2023-09"), value: 2927265},
  {date: new Date("2023-10"), value: 2936552},
  {date: new Date("2023-11"), value: 2945689},
  {date: new Date("2023-12"), value: 2954074},
  {date: new Date("2024-01"), value: 2962347},
  {date: new Date("2024-02"), value: 2972701},
  {date: new Date("2024-03"), value: 2978688},
  {date: new Date("2024-04"), value: 2989278},
  {date: new Date("2024-05"), value: 2997656},
  {date: new Date("2024-06"), value: 3007111},
  {date: new Date("2024-07"), value: 3019472},
  {date: new Date("2024-08"), value: 3030663},
  {date: new Date("2024-09"), value: 3043684},
  {date: new Date("2024-10"), value: 3057598},
  {date: new Date("2024-11"), value: 3070687},
  {date: new Date("2024-12"), value: 3085072},
  {date: new Date("2025-01"), value: 3093948},
  {date: new Date("2025-02"), value: 3104648},
  {date: new Date("2025-03"), value: 3116469},
  {date: new Date("2025-04"), value: 3127749},
  {date: new Date("2025-05"), value: 3135920},
  {date: new Date("2025-06"), value: 3148601},
  {date: new Date("2025-07"), value: 3155593},
  {date: new Date("2025-08"), value: 3168322},
  {date: new Date("2025-09"), value: 3182185},
  {date: new Date("2025-10"), value: 3196170}
];

display(Plot.plot({
  title: "Passif de credit total des menages, novembre 2022 a octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [2800000, 3300000], grid: true, label: "Millions $", tickFormat: d => (d/1000000).toFixed(1).replace(".", ",") + " T$"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(creditData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(creditData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(creditData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000000).toFixed(2).replace(".", ",") + " T$", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Dette hypothecaire et non hypothecaire

Les prets hypothecaires representaient 74,7 % du passif de credit total des menages en octobre 2025, pour un total de 2 388,9 milliards de dollars. Cela representait une augmentation de 4,8 % par rapport a octobre 2024.

Le credit non hypothecaire, qui comprend les prets a la consommation et les lignes de credit, a atteint 807,3 milliards de dollars, en hausse de 3,8 % d'une annee a l'autre. La croissance du credit non hypothecaire a ete plus lente que celle du credit hypothecaire au cours des derniers mois.

```js
// Donnees reelles de Statistique Canada, tableau 36-10-0639
const compositionData = [
  {date: new Date("2022-11"), mortgage: 2119149, nonMortgage: 725452},
  {date: new Date("2023-02"), mortgage: 2136550, nonMortgage: 728780},
  {date: new Date("2023-05"), mortgage: 2155545, nonMortgage: 736508},
  {date: new Date("2023-08"), mortgage: 2179361, nonMortgage: 740033},
  {date: new Date("2023-11"), mortgage: 2199709, nonMortgage: 745980},
  {date: new Date("2024-02"), mortgage: 2215413, nonMortgage: 757288},
  {date: new Date("2024-05"), mortgage: 2235556, nonMortgage: 762101},
  {date: new Date("2024-08"), mortgage: 2259570, nonMortgage: 771093},
  {date: new Date("2024-11"), mortgage: 2290441, nonMortgage: 780245},
  {date: new Date("2025-02"), mortgage: 2317477, nonMortgage: 787171},
  {date: new Date("2025-05"), mortgage: 2343238, nonMortgage: 792682},
  {date: new Date("2025-08"), mortgage: 2367218, nonMortgage: 801104},
  {date: new Date("2025-10"), mortgage: 2388867, nonMortgage: 807302}
];

const stackData = compositionData.flatMap(d => [
  {date: d.date, type: "Prets hypothecaires", value: d.mortgage},
  {date: d.date, type: "Credit non hypothecaire", value: d.nonMortgage}
]);

display(Plot.plot({
  title: "Credit des menages par type, novembre 2022 a octobre 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Millions $", tickFormat: d => (d/1000000).toFixed(1).replace(".", ",") + " T$"},
  x: {type: "utc", label: null},
  color: {
    domain: ["Prets hypothecaires", "Credit non hypothecaire"],
    range: ["#AF3C43", "#E57373"],
    legend: true
  },
  marks: [
    Plot.areaY(stackData, Plot.stackY({
      x: "date",
      y: "value",
      fill: "type",
      order: ["Prets hypothecaires", "Credit non hypothecaire"]
    })),
    Plot.ruleY([0])
  ]
}));
```

| Type de credit | Valeur (G$) | Part | Variation annuelle |
|----------------|-------------|------|-------------------|
| Prets hypothecaires | 2 388,9 | 74,7 % | +4,8 % |
| Credit non hypothecaire | 807,3 | 25,3 % | +3,8 % |
| **Total** | **3 196,2** | **100 %** | **+4,5 %** |

## Composantes du credit a la consommation

Parmi les credits non hypothecaires, les lignes de credit representaient la composante la plus importante, a 246,6 milliards de dollars, suivies des prets personnels a 128,2 milliards de dollars.

Les soldes de cartes de credit ont augmente de 3,8 % d'une annee a l'autre pour atteindre 113,9 milliards de dollars. Les prets automobiles, a 109,3 milliards de dollars, ont connu une croissance plus lente de 1,0 % sur 12 mois.

```js
// Donnees reelles de Statistique Canada, tableau 36-10-0639
const consumerComponents = [
  {category: "Lignes de credit", value: 246.6, yoy: 3.75},
  {category: "Prets personnels", value: 128.2, yoy: 1.27},
  {category: "Cartes de credit", value: 113.9, yoy: 3.79},
  {category: "Prets automobiles", value: 109.3, yoy: 1.01}
];

display(Plot.plot({
  title: "Composantes du credit a la consommation, octobre 2025 (G$)",
  width: 640,
  height: 280,
  marginLeft: 130,
  marginRight: 80,
  x: {domain: [0, 280], grid: true, label: "Milliards $"},
  y: {label: null},
  marks: [
    Plot.barX(consumerComponents, {
      y: "category",
      x: "value",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(consumerComponents, {
      y: "category",
      x: 270,
      text: d => d.value.toFixed(1).replace(".", ",") + " G$ (+" + d.yoy.toFixed(1).replace(".", ",") + " %)",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

| Composante | Valeur (G$) | Variation annuelle |
|------------|-------------|-------------------|
| Lignes de credit | 246,6 | +3,8 % |
| Prets personnels | 128,2 | +1,3 % |
| Cartes de credit | 113,9 | +3,8 % |
| Prets automobiles | 109,3 | +1,0 % |

## Composition de la dette hypothecaire

Les hypotheques residentielles constituaient la grande majorite de la dette hypothecaire, a 2 379,7 milliards de dollars, en hausse de 4,9 % d'une annee a l'autre. Les hypotheques non residentielles, a 9,1 milliards de dollars, ont diminue de 10,6 % par rapport a octobre 2024.

Le marche des hypotheques residentielles continue de stimuler l'essentiel de la croissance du credit des menages, conformement aux prix eleves des logements et a l'activite hypothecaire soutenue.

## Croissance a long terme du credit des menages

Au cours des trois dernieres decennies, le passif de credit des menages a augmente considerablement. En octobre 1995, le credit total des menages s'etablissait a 488,5 milliards de dollars. En octobre 2025, ce montant avait plus que sextuple pour atteindre 3 196,2 milliards de dollars.

```js
// Donnees reelles de Statistique Canada, tableau 36-10-0639 (valeurs d'octobre chaque annee)
const historicalData = [
  {year: 1990, value: 376213},
  {year: 1995, value: 488526},
  {year: 2000, value: 663752},
  {year: 2005, value: 998902},
  {year: 2010, value: 1549693},
  {year: 2015, value: 1973397},
  {year: 2020, value: 2464577},
  {year: 2025, value: 3196170}
];

display(Plot.plot({
  title: "Passif de credit total des menages, 1990 a 2025 (valeurs d'octobre)",
  width: 680,
  height: 320,
  y: {domain: [0, 3500000], grid: true, label: "Millions $", tickFormat: d => (d/1000000).toFixed(1).replace(".", ",") + " T$"},
  x: {label: null, tickFormat: d => d.toString()},
  marks: [
    Plot.line(historicalData, {x: "year", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(historicalData, {x: "year", y: "value", fill: "#AF3C43", r: 4}),
    Plot.text(historicalData.filter(d => d.year === 2025), {
      x: "year",
      y: "value",
      text: d => (d.value/1000000).toFixed(2).replace(".", ",") + " T$",
      dy: -12,
      fill: "#AF3C43",
      fontWeight: 600
    })
  ]
}));
```

| Periode | Credit total (G$) | Croissance depuis la periode precedente |
|---------|-------------------|----------------------------------------|
| Octobre 1995 | 488,5 | -- |
| Octobre 2000 | 663,8 | +35,9 % |
| Octobre 2005 | 998,9 | +50,5 % |
| Octobre 2010 | 1 549,7 | +55,1 % |
| Octobre 2015 | 1 973,4 | +27,3 % |
| Octobre 2020 | 2 464,6 | +24,9 % |
| Octobre 2025 | 3 196,2 | +29,7 % |

Au cours des cinq dernieres annees (d'octobre 2020 a octobre 2025), le credit des menages a augmente de 29,7 %, soit environ 731,6 milliards de dollars.

<div class="note-to-readers">

## Note aux lecteurs

Cet article utilise des donnees desaisonnalisees provenant des agregats du credit mensuel. Le passif de credit des menages comprend les prets hypothecaires et non hypothecaires des banques a charte, des societes financieres non bancaires, des gouvernements et d'autres preteurs.

Les hypotheques residentielles comprennent les prets garantis par des proprietes residentielles. Les prets non hypothecaires comprennent les prets personnels, les cartes de credit, les lignes de credit et les prets automobiles.

Pour plus d'informations sur les concepts, les methodes et les classifications utilises, consultez le [Guide des agregats du credit mensuel](https://www150.statcan.gc.ca/n1/fr/catalogue/13-605-X202000100004).

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 36-10-0639](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=3610063901)
**Enquete :** Agregats du credit mensuel
**Periode de reference :** Octobre 2025
**DOI :** [https://doi.org/10.25318/3610063901-fra](https://doi.org/10.25318/3610063901-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "credit-menages-octobre-2025", "fr"));
```
