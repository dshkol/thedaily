---
title: Le nombre de passagers aériens en hausse de 2,2 % en octobre 2025
toc: false
---

# Le nombre de passagers aériens en hausse de 2,2 % en octobre 2025

<p class="release-date">Diffusion : 23 décembre 2025</p>

<div class="highlights">

**Faits saillants**

- Les grands transporteurs aériens canadiens ont transporté 7,1 millions de passagers en octobre 2025, en hausse de 2,2 % d'une année à l'autre
- Le coefficient d'occupation a atteint 83,3 %, la première hausse d'une année à l'autre depuis décembre 2024
- Le trafic transfrontalier (Canada-États-Unis) a diminué de 13,4 %, soit le neuvième mois consécutif de baisse
- Le trafic vers les autres destinations internationales a augmenté de 8,0 % d'une année à l'autre

</div>

Les grands transporteurs aériens canadiens ont transporté 7,1 millions de passagers sur des vols réguliers et nolisés en octobre 2025, en hausse de 2,2 % par rapport à octobre 2024. Le coefficient d'occupation des passagers est passé de 83,1 % à 83,3 %, marquant la première amélioration d'une année à l'autre depuis décembre 2024.

Les passagers-kilomètres ont augmenté de 4,6 % d'une année à l'autre pour atteindre 19,6 milliards, tandis que la capacité a progressé de 4,3 % pour s'établir à 23,5 milliards de sièges-kilomètres disponibles. La longueur moyenne des voyages était de 2 743 kilomètres, en hausse de 2,3 % par rapport à octobre 2024.

```js
import * as Plot from "npm:@observablehq/plot";

// Données du Tableau 23-10-0079 de Statistique Canada
// Passagers transportés par les grands transporteurs aériens canadiens (en milliers)
const passengerData = [
  {date: new Date("2023-01"), value: 6106},
  {date: new Date("2023-02"), value: 5766},
  {date: new Date("2023-03"), value: 6761},
  {date: new Date("2023-04"), value: 6369},
  {date: new Date("2023-05"), value: 6437},
  {date: new Date("2023-06"), value: 6911},
  {date: new Date("2023-07"), value: 7607},
  {date: new Date("2023-08"), value: 7722},
  {date: new Date("2023-09"), value: 6706},
  {date: new Date("2023-10"), value: 6524},
  {date: new Date("2023-11"), value: 5972},
  {date: new Date("2023-12"), value: 6757},
  {date: new Date("2024-01"), value: 6774},
  {date: new Date("2024-02"), value: 6696},
  {date: new Date("2024-03"), value: 7584},
  {date: new Date("2024-04"), value: 7001},
  {date: new Date("2024-05"), value: 7265},
  {date: new Date("2024-06"), value: 7491},
  {date: new Date("2024-07"), value: 8316},
  {date: new Date("2024-08"), value: 8457},
  {date: new Date("2024-09"), value: 7060},
  {date: new Date("2024-10"), value: 6991},
  {date: new Date("2024-11"), value: 6493},
  {date: new Date("2024-12"), value: 7319},
  {date: new Date("2025-01"), value: 6904},
  {date: new Date("2025-02"), value: 6486},
  {date: new Date("2025-03"), value: 7453},
  {date: new Date("2025-04"), value: 7001},
  {date: new Date("2025-05"), value: 7137},
  {date: new Date("2025-06"), value: 7546},
  {date: new Date("2025-07"), value: 8295},
  {date: new Date("2025-08"), value: 8136},
  {date: new Date("2025-09"), value: 7219},
  {date: new Date("2025-10"), value: 7147}
];

display(Plot.plot({
  title: "Passagers transportés par les grands transporteurs aériens canadiens (en milliers)",
  width: 680,
  height: 300,
  y: {domain: [5000, 9000], grid: true, label: "Passagers (en milliers)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(passengerData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(passengerData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(passengerData.slice(-1), {x: "date", y: "value", text: d => (d.value / 1000).toFixed(1).replace(".", ",") + " M", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Tendances divergentes dans les voyages internationaux

Bien que le trafic de passagers global ait augmenté, le trafic transfrontalier entre le Canada et les États-Unis a continué de diminuer. Le nombre de passagers sur les vols réguliers transfrontaliers a chuté de 13,4 % d'une année à l'autre en octobre, soit le neuvième mois consécutif de baisse.

La capacité sur les liaisons transfrontalières a également diminué, les sièges-kilomètres disponibles ayant reculé de 10,7 % par rapport à octobre 2024. Le coefficient d'occupation sur ces vols est passé de 82,3 % à 78,5 % par rapport à l'année précédente.

En revanche, le trafic vers les autres destinations internationales a progressé de 8,0 % d'une année à l'autre, la plus forte hausse depuis août 2024.

```js
const trafficData = [
  {segment: "Total des passagers", yoyChange: 2.2},
  {segment: "Autres destinations internationales", yoyChange: 8.0},
  {segment: "Intérieur itinérant", yoyChange: 1.1},
  {segment: "Transfrontalier (É.-U.)", yoyChange: -13.4}
];

display(Plot.plot({
  title: "Variation d'une année à l'autre par segment de trafic, octobre 2025 (%)",
  width: 550,
  height: 200,
  marginLeft: 200,
  x: {grid: true, label: "Variation en pourcentage"},
  y: {label: null},
  marks: [
    Plot.ruleX([0]),
    Plot.barX(trafficData, {
      y: "segment",
      x: "yoyChange",
      fill: d => d.yoyChange >= 0 ? "#AF3C43" : "#1f77b4",
      sort: {y: "-x"}
    }),
    Plot.text(trafficData, {
      y: "segment",
      x: d => d.yoyChange >= 0 ? d.yoyChange + 0.8 : d.yoyChange - 0.8,
      text: d => (d.yoyChange >= 0 ? "+" : "") + d.yoyChange.toFixed(1).replace(".", ",") + " %",
      textAnchor: d => d.yoyChange >= 0 ? "start" : "end",
      fill: "currentColor"
    })
  ]
}));
```

## Mouvements d'aéronefs

Le nombre total de mouvements d'aéronefs dans les grands aéroports du Canada et dans certains petits aéroports a atteint 514 143 en octobre, en baisse de 0,6 % par rapport à octobre 2024. Les mouvements locaux ont diminué de 3,8 %, tandis que les mouvements itinérants ont augmenté de 0,9 %.

Les mouvements itinérants intérieurs ont progressé de 1,1 %, la Colombie-Britannique et le Québec affichant les gains régionaux les plus importants. Les mouvements transfrontaliers entre le Canada et les États-Unis ont reculé de 2,9 %, tandis que les mouvements vers les autres destinations internationales ont augmenté de 8,0 %.

| Indicateur | Octobre 2025 | Variation d'une année à l'autre |
|------------|--------------|--------------------------------|
| Total des passagers | 7,1 millions | +2,2 % |
| Passagers-kilomètres | 19,6 milliards | +4,6 % |
| Sièges-kilomètres disponibles | 23,5 milliards | +4,3 % |
| Coefficient d'occupation | 83,3 % | +0,2 pp |
| Total des mouvements d'aéronefs | 514 143 | -0,6 % |
| Heures de vol | 183 000 | +4,6 % |
| Revenus d'exploitation | 2,4 milliards $ | +1,1 % |

<div class="note-to-readers">

## Note aux lecteurs

Les transporteurs aériens de niveau I sont des transporteurs aériens canadiens titulaires d'une licence intérieure et/ou d'une licence internationale délivrée par l'Office des transports du Canada et qui ont transporté 2 millions de passagers ou plus l'année précédente.

Les données de cette diffusion ne sont pas désaisonnalisées. Les variations mensuelles reflètent les tendances saisonnières typiques du transport aérien, les mois d'été enregistrant généralement les volumes de passagers les plus élevés.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 23-10-0079](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2310007901)
**Enquête :** Statistique de l'aviation civile mensuelle
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2310007901-fra](https://doi.org/10.25318/2310007901-fra)

</div>

<details>
<summary>Reproductibilité : Code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)
library(tidyr)

# Télécharger les statistiques d'exploitation des compagnies aériennes
airline <- get_cansim("23-10-0079")

# Série chronologique des passagers
passengers <- airline %>%
  filter(`Operational and financial statistics` == "Passengers") %>%
  filter(REF_DATE >= "2023-01") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Indicateurs multiples pour le mois le plus récent
metrics <- airline %>%
  filter(`Operational and financial statistics` %in% c(
    "Passengers", "Passenger-kilometres", "Available seat-kilometres",
    "Load factor", "Hours flown"
  )) %>%
  filter(REF_DATE == "2025-10") %>%
  select(`Operational and financial statistics`, VALUE)

# Calculer la variation d'une année à l'autre
oct2025 <- passengers %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
oct2024 <- passengers %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
yoy_change <- (oct2025 - oct2024) / oct2024 * 100
```

</details>
