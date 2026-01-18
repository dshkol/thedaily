---
title: Mouvements d'aéronefs en baisse de 6,2 % en octobre 2025, les tendances saisonnières s'installent
verification_json: output/aircraft_movements.json
toc: false
---
# Mouvements d'aéronefs en baisse de 6,2 % en octobre 2025, les tendances saisonnières s'installent

<p class="release-date">Diffusion : 17 janvier 2026 <span class="article-type-tag release">Nouvelle diffusion</span></p>

<div class="highlights">

**Faits saillants**

- Les mouvements totaux d'aéronefs dans les aéroports canadiens dotés de tours de NAV CANADA ont atteint 514 143 en octobre 2025, en baisse de 6,2 % par rapport à septembre
- D'une année à l'autre, les mouvements ont diminué de 0,6 % comparativement à octobre 2024
- L'aéroport Toronto Pearson est en tête de tous les aéroports avec 33 548 mouvements, suivi de Vancouver avec 24 678
- Les mouvements itinérants (vols entre aéroports) ont totalisé 350 032, soit 68 % de toute l'activité

</div>

Les mouvements d'aéronefs dans les aéroports canadiens dotés de tours de NAV CANADA ont totalisé 514 143 en octobre 2025, en baisse de 6,2 % par rapport aux 548 386 de septembre. Cette diminution reflète les tendances saisonnières habituelles, l'activité diminuant par rapport aux sommets estivaux.

D'une année à l'autre, les mouvements ont diminué de 0,6 % par rapport à octobre 2024, alors que 517 437 mouvements avaient été enregistrés. L'activité en octobre 2025 est demeurée inférieure au sommet de juillet de 614 251 mouvements.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, tableau 23-10-0296
const movementsData = [
  {date: new Date("2023-11-01"), value: 448113},
  {date: new Date("2023-12-01"), value: 352356},
  {date: new Date("2024-01-01"), value: 318005},
  {date: new Date("2024-02-01"), value: 389604},
  {date: new Date("2024-03-01"), value: 444170},
  {date: new Date("2024-04-01"), value: 487753},
  {date: new Date("2024-05-01"), value: 545077},
  {date: new Date("2024-06-01"), value: 520294},
  {date: new Date("2024-07-01"), value: 592979},
  {date: new Date("2024-08-01"), value: 547951},
  {date: new Date("2024-09-01"), value: 522102},
  {date: new Date("2024-10-01"), value: 517437},
  {date: new Date("2024-11-01"), value: 416344},
  {date: new Date("2024-12-01"), value: 351072},
  {date: new Date("2025-01-01"), value: 380590},
  {date: new Date("2025-02-01"), value: 346117},
  {date: new Date("2025-03-01"), value: 457019},
  {date: new Date("2025-04-01"), value: 523796},
  {date: new Date("2025-05-01"), value: 560048},
  {date: new Date("2025-06-01"), value: 563211},
  {date: new Date("2025-07-01"), value: 614251},
  {date: new Date("2025-08-01"), value: 574355},
  {date: new Date("2025-09-01"), value: 548386},
  {date: new Date("2025-10-01"), value: 514143}
];

display(Plot.plot({
  title: "Mouvements d'aéronefs dans les aéroports canadiens, novembre 2023 à octobre 2025",
  width: 680,
  height: 300,
  y: {domain: [300000, 650000], grid: true, label: "Nombre de mouvements"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(movementsData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(movementsData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(movementsData.slice(-1), {x: "date", y: "value", text: d => (d.value/1000).toFixed(0) + "K", dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Toronto Pearson en tête de l'activité aéroportuaire

L'aéroport international Toronto Pearson a enregistré le plus grand nombre de mouvements avec 33 548 en octobre 2025, suivi de l'aéroport international de Vancouver avec 24 678. Plusieurs petits aéroports de la Colombie-Britannique — Boundary Bay, Abbotsford et Pitt Meadows — figurent parmi les dix premiers, reflétant les communautés d'aviation générale actives dans la région.

| Aéroport | Mouvements |
|---|---:|
| Toronto/Lester B. Pearson International | 33 548 |
| Vancouver International | 24 678 |
| Boundary Bay | 19 945 |
| Abbotsford | 18 222 |
| Calgary International | 17 864 |
| Montréal/Pierre Elliott Trudeau International | 17 611 |
| Pitt Meadows | 16 227 |
| Kitchener/Waterloo | 14 305 |
| Calgary/Springbank | 13 684 |
| Saskatoon/John G. Diefenbaker International | 13 527 |

## Les mouvements itinérants dominent l'activité

Les mouvements itinérants — vols entre différents aéroports — ont représenté 350 032 ou 68 % des mouvements totaux en octobre 2025. Les mouvements locaux, qui comprennent les vols d'entraînement et autres opérations qui décollent et atterrissent au même aéroport, ont totalisé 164 111.

L'aviation civile a représenté la quasi-totalité des mouvements locaux avec 163 737, tandis que les mouvements militaires locaux n'ont été que de 374.

<div class="note-to-readers">

## Note aux lecteurs

Les mouvements d'aéronefs comprennent les décollages et les atterrissages. Un mouvement itinérant est un mouvement où l'aéronef se rend à un autre aéroport ou en provient. Un mouvement local implique un aéronef qui reste dans les environs de l'aéroport.

Les données couvrent les aéroports dotés de tours de contrôle ou de stations d'information de vol de NAV CANADA. L'activité dans les autres aéroports n'est pas incluse dans ces totaux.

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Récupérer les données sur les mouvements d'aéronefs
movements <- get_cansim("23-10-0296")

# Total des mouvements dans tous les aéroports
total <- movements %>%
  filter(Airports == "Total, all airports",
         `Class of operation` == "Total, itinerant and local movements") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculer la variation mensuelle
current <- total %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous <- total %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Principaux aéroports
top_airports <- movements %>%
  filter(Airports != "Total, all airports",
         `Class of operation` == "Total, itinerant and local movements",
         REF_DATE == "2025-10") %>%
  select(Airports, VALUE) %>%
  arrange(desc(VALUE)) %>%
  head(10)
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 23-10-0296](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2310029601)
**Enquête :** Statistiques de l'aviation civile
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2310029601-fra](https://doi.org/10.25318/2310029601-fra)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "mouvements-aeronefs-octobre-2025", "fr"));
```
