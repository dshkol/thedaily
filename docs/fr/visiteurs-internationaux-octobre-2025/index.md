---
title: Les visiteurs internationaux en hausse de 4,9 % sur un an en octobre 2025
toc: false
---

# Les visiteurs internationaux en hausse de 4,9 % sur un an en octobre 2025

<p class="release-date">Diffusion : 29 decembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="metric-box">
  <div class="value">2,4 millions</div>
  <div class="label">Visiteurs non residents entrant au Canada, octobre 2025</div>
</div>

Le Canada a accueilli 2 363 398 visiteurs non residents en octobre 2025, en hausse de 4,9 % par rapport aux 2 252 283 visiteurs d'octobre 2024. Cette hausse temoigne d'une reprise continue du tourisme international, les visiteurs en provenance de pays autres que les Etats-Unis ayant augmente de 11,7 % sur un an.

<div class="highlights">

**Faits saillants**

- Les visiteurs non residents au Canada ont augmente de 4,9 % sur un an en octobre 2025
- Les visiteurs de pays autres que les Etats-Unis ont augmente de 11,7 %, contre une croissance de 3,0 % pour les Americains
- La Coree du Sud a enregistre la plus forte hausse sur un an parmi les principaux pays sources, soit 48,2 %
- La Nouvelle-Ecosse a vu ses visiteurs augmenter de 69,5 % sur un an, le gain le plus eleve parmi les provinces

</div>

## Tendance mensuelle des visiteurs

Les volumes de visiteurs en octobre etaient inferieurs de 17,8 % a ceux de septembre, ce qui reflete la tendance saisonniere typique alors que les voyages diminuent apres le pic estival. Juillet 2025 a enregistre le total mensuel le plus eleve avec 4,3 millions de visiteurs.

```js
import * as Plot from "npm:@observablehq/plot";

// Donnees reelles de Statistique Canada, Tableau 24-10-0050
const visitorData = [
  {date: new Date("2023-11"), value: 1520059},
  {date: new Date("2023-12"), value: 1993965},
  {date: new Date("2024-01"), value: 1189366},
  {date: new Date("2024-02"), value: 1459708},
  {date: new Date("2024-03"), value: 1682944},
  {date: new Date("2024-04"), value: 1886774},
  {date: new Date("2024-05"), value: 2687964},
  {date: new Date("2024-06"), value: 3643749},
  {date: new Date("2024-07"), value: 4260020},
  {date: new Date("2024-08"), value: 4007080},
  {date: new Date("2024-09"), value: 2882158},
  {date: new Date("2024-10"), value: 2252283},
  {date: new Date("2024-11"), value: 1734045},
  {date: new Date("2024-12"), value: 2132061},
  {date: new Date("2025-01"), value: 1414635},
  {date: new Date("2025-02"), value: 1391190},
  {date: new Date("2025-03"), value: 1587932},
  {date: new Date("2025-04"), value: 1824703},
  {date: new Date("2025-05"), value: 2595836},
  {date: new Date("2025-06"), value: 3571205},
  {date: new Date("2025-07"), value: 4250749},
  {date: new Date("2025-08"), value: 4037165},
  {date: new Date("2025-09"), value: 2876327},
  {date: new Date("2025-10"), value: 2363398}
];

display(Plot.plot({
  title: "Visiteurs non residents entrant au Canada, novembre 2023 a octobre 2025",
  width: 680,
  height: 300,
  y: {grid: true, label: "Visiteurs (millions)", tickFormat: d => (d/1000000).toFixed(1).replace(".", ",")},
  x: {type: "utc", label: null},
  marks: [
    Plot.ruleY([0]),
    Plot.lineY(visitorData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(visitorData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(visitorData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000000).toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Les Etats-Unis demeurent la source dominante

Les visiteurs americains representaient 76,8 % de toutes les arrivees de non-residents en octobre 2025, pour un total de 1 814 406. Alors que les visiteurs americains ont augmente de 3,0 % sur un an, la croissance en provenance d'autres pays etait nettement plus forte, a 11,7 %.

```js
// Donnees reelles de Statistique Canada, Tableau 24-10-0050
const usOtherData = [
  {date: new Date("2023-11"), us: 1219676, other: 300383},
  {date: new Date("2023-12"), us: 1524595, other: 469370},
  {date: new Date("2024-01"), us: 910621, other: 278745},
  {date: new Date("2024-02"), us: 1127588, other: 332120},
  {date: new Date("2024-03"), us: 1336056, other: 346888},
  {date: new Date("2024-04"), us: 1476081, other: 410693},
  {date: new Date("2024-05"), us: 2072414, other: 615550},
  {date: new Date("2024-06"), us: 2897819, other: 745930},
  {date: new Date("2024-07"), us: 3353349, other: 906671},
  {date: new Date("2024-08"), us: 3195854, other: 811226},
  {date: new Date("2024-09"), us: 2198468, other: 683690},
  {date: new Date("2024-10"), us: 1760987, other: 491296},
  {date: new Date("2024-11"), us: 1448685, other: 285360},
  {date: new Date("2024-12"), us: 1685491, other: 446570},
  {date: new Date("2025-01"), us: 1105027, other: 309608},
  {date: new Date("2025-02"), us: 1076683, other: 314507},
  {date: new Date("2025-03"), us: 1257520, other: 330412},
  {date: new Date("2025-04"), us: 1360708, other: 463995},
  {date: new Date("2025-05"), us: 1969363, other: 626473},
  {date: new Date("2025-06"), us: 2786594, other: 784611},
  {date: new Date("2025-07"), us: 3251100, other: 999649},
  {date: new Date("2025-08"), us: 3151192, other: 885973},
  {date: new Date("2025-09"), us: 2142122, other: 734205},
  {date: new Date("2025-10"), us: 1814406, other: 548992}
];

const stackData = usOtherData.flatMap(d => [
  {date: d.date, source: "Etats-Unis", value: d.us},
  {date: d.date, source: "Autres pays", value: d.other}
]);

display(Plot.plot({
  title: "Visiteurs selon l'origine, novembre 2023 a octobre 2025",
  width: 680,
  height: 320,
  y: {grid: true, label: "Visiteurs (millions)", tickFormat: d => (d/1000000).toFixed(1).replace(".", ",")},
  x: {type: "utc", label: null},
  color: {
    domain: ["Etats-Unis", "Autres pays"],
    range: ["#AF3C43", "#E57373"],
    legend: true
  },
  marks: [
    Plot.areaY(stackData, Plot.stackY({
      x: "date",
      y: "value",
      fill: "source",
      order: ["Etats-Unis", "Autres pays"]
    })),
    Plot.ruleY([0])
  ]
}));
```

## Principaux pays sources

La France et le Royaume-Uni etaient les principaux pays sources hors Etats-Unis en octobre 2025, chacun envoyant plus de 65 000 visiteurs. La Chine se classait troisieme avec 38 695 visiteurs, en hausse de 12,6 % sur un an.

| Pays | Octobre 2025 | Octobre 2024 | Variation annuelle |
|------|-------------|-------------|-------------------|
| France | 66 180 | 62 116 | +6,5 % |
| Royaume-Uni | 65 241 | 64 550 | +1,1 % |
| Chine | 38 695 | 34 361 | +12,6 % |
| Allemagne | 27 934 | 26 854 | +4,0 % |
| Inde | 27 063 | 24 194 | +11,9 % |
| Coree du Sud | 25 463 | 17 182 | +48,2 % |
| Mexique | 24 560 | 23 284 | +5,5 % |
| Australie | 17 940 | 18 144 | -1,1 % |
| Japon | 15 214 | 14 446 | +5,3 % |
| Taiwan | 11 268 | 8 161 | +38,1 % |

## Marches a plus forte croissance

La Coree du Sud a enregistre la plus forte hausse sur un an parmi les principaux pays sources, soit 48,2 %, ajoutant plus de 8 200 visiteurs supplementaires par rapport a octobre 2024. Taiwan suivait avec une croissance de 38,1 %.

```js
// Donnees reelles de Statistique Canada, Tableau 24-10-0050
const growthData = [
  {country: "Coree du Sud", change: 48.2},
  {country: "Taiwan", change: 38.1},
  {country: "Nigeria", change: 13.1},
  {country: "Chine", change: 12.6},
  {country: "Inde", change: 11.9},
  {country: "Suisse", change: 10.5},
  {country: "France", change: 6.5},
  {country: "Mexique", change: 5.5},
  {country: "Japon", change: 5.3},
  {country: "Allemagne", change: 4.0},
  {country: "Hong Kong", change: 2.5},
  {country: "Bresil", change: 1.3},
  {country: "Royaume-Uni", change: 1.1},
  {country: "Australie", change: -1.1},
  {country: "Philippines", change: -9.9}
];

display(Plot.plot({
  title: "Variation annuelle par pays source (%)",
  width: 680,
  height: 380,
  marginLeft: 100,
  marginRight: 60,
  x: {domain: [-15, 55], grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(growthData, {
      y: "country",
      x: "change",
      fill: "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(growthData, {
      y: "country",
      x: 55,
      text: d => (d.change >= 0 ? "+" : "") + d.change.toFixed(1).replace(".", ",") + " %",
      textAnchor: "end",
      fill: "currentColor",
      fontSize: 11
    })
  ]
}));
```

## Repartition regionale des sources

Parmi les regions du monde, l'Asie a enregistre la plus forte hausse sur un an, soit 14,9 %, suivie de l'Europe a 10,5 %. Les visiteurs en provenance d'Afrique ont augmente de 29,1 %, bien qu'a partir d'une base plus petite de 29 647 visiteurs.

| Region | Octobre 2025 | Octobre 2024 | Variation annuelle |
|--------|-------------|-------------|-------------------|
| Europe | 254 266 | 230 060 | +10,5 % |
| Asie | 169 317 | 147 345 | +14,9 % |
| Ameriques (sauf E.-U.) | 73 653 | 68 478 | +7,6 % |
| Afrique | 29 647 | 22 962 | +29,1 % |
| Oceanie | 22 041 | 22 421 | -1,7 % |

## Destinations provinciales

L'Ontario a recu le plus grand nombre de visiteurs non residents, soit 1 179 753, representant pres de la moitie de toutes les arrivees. La Colombie-Britannique suivait avec 518 046 visiteurs.

La Nouvelle-Ecosse a enregistre la plus forte croissance sur un an, soit 69,5 %, tandis que l'Ile-du-Prince-Edouard a vu ses visiteurs diminuer de 68,2 %.

| Province | Octobre 2025 | Octobre 2024 | Variation annuelle |
|----------|-------------|-------------|-------------------|
| Ontario | 1 179 753 | 1 127 482 | +4,6 % |
| Colombie-Britannique | 518 046 | 493 998 | +4,9 % |
| Quebec | 355 145 | 356 431 | -0,4 % |
| Nouveau-Brunswick | 103 671 | 99 692 | +4,0 % |
| Alberta | 93 977 | 83 262 | +12,9 % |
| Nouvelle-Ecosse | 55 299 | 32 626 | +69,5 % |
| Manitoba | 32 564 | 31 101 | +4,7 % |
| Saskatchewan | 11 568 | 10 913 | +6,0 % |

## Contexte saisonnier

Les volumes de visiteurs en octobre 2025 representaient 55,6 % du pic de juillet, ce qui correspond aux tendances saisonnieres typiques du tourisme canadien. Le nombre de visiteurs diminue generalement des sommets estivaux au cours des mois d'automne, avec une reprise partielle pendant la periode des fetes de decembre.

<div class="note-to-readers">

## Note aux lecteurs

Ce communique presente le nombre de visiteurs non residents entrant au Canada selon le pays de residence et la province de destination.

Les donnees comprennent tous les passages frontaliers et ne sont pas desaisonnalisees. Les variations d'un mois a l'autre refletent a la fois les tendances saisonnieres et les tendances sous-jacentes de la demande de voyage.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 24-10-0050](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2410005001)
**Enquete :** Statistique des voyages entre le Canada et les autres pays
**Periode de reference :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2410005001-fra](https://doi.org/10.25318/2410005001-fra)

</div>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "visiteurs-internationaux-octobre-2025", "fr"));
```
