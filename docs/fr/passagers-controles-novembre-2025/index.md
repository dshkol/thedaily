---
title: Trafic de passagers contrôlés inchangé d'une année à l'autre en novembre 2025
verification_json: output/screened_passengers.json
toc: false
---
# Trafic de passagers contrôlés inchangé d'une année à l'autre en novembre 2025

<p class="release-date">Diffusion : 17 janvier 2026 <span class="article-type-tag release">Nouvelle diffusion</span></p>

<div class="highlights">

**Faits saillants**

- Le trafic de passagers contrôlés dans les huit plus grands aéroports du Canada a totalisé 4,4 millions en novembre 2025, pratiquement inchangé (+0,1 %) par rapport à novembre 2024
- Le trafic mensuel a diminué de 12,3 % par rapport à octobre, le ralentissement des voyages après l'été se poursuivant
- Toronto Pearson a traité 1,6 million de passagers, représentant 37 % de tout le trafic contrôlé
- Les voyages intérieurs ont représenté 45 % des passagers, tandis que les voyages internationaux ont constitué 31 %

</div>

Le trafic de passagers contrôlés dans les huit plus grands aéroports du Canada a totalisé 4 419 632 en novembre 2025, pratiquement inchangé par rapport aux 4 413 567 passagers contrôlés en novembre 2024. Le trafic a diminué de 12,3 % par rapport aux 5 036 979 passagers d'octobre, les tendances saisonnières ayant modéré les volumes de voyage après la période estivale achalandée.

Novembre a marqué le quatrième mois consécutif de baisses mensuelles depuis le sommet de juillet de 5,9 millions de passagers.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, tableau 23-10-0312
const passengerData = [
  {date: new Date("2023-12-01"), value: 4533764},
  {date: new Date("2024-01-01"), value: 4323045},
  {date: new Date("2024-02-01"), value: 4219440},
  {date: new Date("2024-03-01"), value: 4554090},
  {date: new Date("2024-04-01"), value: 4364918},
  {date: new Date("2024-05-01"), value: 4714460},
  {date: new Date("2024-06-01"), value: 5049935},
  {date: new Date("2024-07-01"), value: 5729343},
  {date: new Date("2024-08-01"), value: 5881612},
  {date: new Date("2024-09-01"), value: 4903309},
  {date: new Date("2024-10-01"), value: 4820063},
  {date: new Date("2024-11-01"), value: 4413567},
  {date: new Date("2024-12-01"), value: 4901887},
  {date: new Date("2025-01-01"), value: 4392911},
  {date: new Date("2025-02-01"), value: 4248782},
  {date: new Date("2025-03-01"), value: 4625367},
  {date: new Date("2025-04-01"), value: 4526474},
  {date: new Date("2025-05-01"), value: 4810219},
  {date: new Date("2025-06-01"), value: 5222346},
  {date: new Date("2025-07-01"), value: 5935640},
  {date: new Date("2025-08-01"), value: 5870107},
  {date: new Date("2025-09-01"), value: 5086336},
  {date: new Date("2025-10-01"), value: 5036979},
  {date: new Date("2025-11-01"), value: 4419632}
];

display(Plot.plot({
  title: "Trafic de passagers contrôlés dans les principaux aéroports canadiens, décembre 2023 à novembre 2025",
  width: 680,
  height: 300,
  y: {domain: [4000000, 6200000], grid: true, label: "Nombre de passagers"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000000).toFixed(1) + "M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Toronto Pearson traite la plus grande part

L'aéroport international Toronto Pearson a contrôlé 1,6 million de passagers en novembre 2025, représentant 37 % de tout le trafic dans les principaux aéroports du Canada. L'aéroport international de Vancouver a suivi avec 829 000 passagers (19 %), tandis que Montréal-Trudeau a traité 686 000 passagers (16 %).

| Aéroport | Passagers | Part |
|---|---:|---:|
| Toronto Pearson | 1 620 401 | 36,7 % |
| Vancouver | 828 753 | 18,8 % |
| Montréal-Trudeau | 685 828 | 15,5 % |
| Calgary | 528 966 | 12,0 % |
| Edmonton | 280 989 | 6,4 % |
| Ottawa | 178 892 | 4,0 % |
| Winnipeg | 161 826 | 3,7 % |
| Halifax | 133 977 | 3,0 % |

## Les voyages intérieurs en tête des secteurs de passagers

Les passagers intérieurs ont représenté 1 966 046 ou 45 % du trafic total de passagers en novembre 2025. Les voyages internationaux vers des destinations à l'extérieur des États-Unis ont totalisé 1 361 775 passagers (31 %), tandis que les voyages transfrontaliers vers les États-Unis ont atteint 1 024 866 passagers (24 %).

```js
const sectorData = [
  {sector: "Intérieur", value: 1966046},
  {sector: "Autre international", value: 1361775},
  {sector: "Transfrontalier (É.-U.)", value: 1024866}
];

display(Plot.plot({
  title: "Trafic de passagers par secteur, novembre 2025",
  width: 640,
  height: 200,
  marginLeft: 140,
  x: {grid: true, label: "Nombre de passagers"},
  y: {label: null},
  marks: [
    Plot.barX(sectorData, {x: "value", y: "sector", fill: "#AF3C43", sort: {y: "-x"}}),
    Plot.text(sectorData, {x: "value", y: "sector", text: d => (d.value/1000000).toFixed(1) + "M", dx: 35, fill: "currentColor"})
  ]
}));
```

<div class="note-to-readers">

## Note aux lecteurs

Les données sur les passagers contrôlés comprennent toutes les personnes qui passent par les points de contrôle de l'Administration canadienne de la sûreté du transport aérien (ACSTA) dans les huit plus grands aéroports canadiens. Les données comprennent à la fois les passagers et les non-passagers (comme les employés des aéroports et des compagnies aériennes).

Les huit aéroports couverts sont Toronto Pearson, Vancouver, Montréal-Trudeau, Calgary, Edmonton, Ottawa, Winnipeg et Halifax.

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Récupérer les données sur les passagers contrôlés
passengers <- get_cansim("23-10-0312")

# Total du trafic contrôlé
total <- passengers %>%
  filter(GEO == "Total of eight largest airports, Canada",
         `Screened traffic` == "Total screened traffic") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculer les variations
current <- total %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
previous <- total %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
year_ago <- total %>% filter(REF_DATE == "2024-11") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100
yoy_change <- (current - year_ago) / year_ago * 100

# Par aéroport
by_airport <- passengers %>%
  filter(GEO != "Total of eight largest airports, Canada",
         `Screened traffic` == "Total screened traffic",
         REF_DATE == "2025-11") %>%
  select(GEO, VALUE) %>%
  arrange(desc(VALUE))
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 23-10-0312](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2310031201)
**Enquête :** Trafic des transporteurs aériens aux aéroports canadiens
**Période de référence :** Novembre 2025
**DOI :** [https://doi.org/10.25318/2310031201-fra](https://doi.org/10.25318/2310031201-fra)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "passagers-controles-novembre-2025", "fr"));
```
