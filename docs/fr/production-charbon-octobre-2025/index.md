---
title: La production de charbon en hausse de 13,2 % en octobre 2025 après le recul de septembre
verification_json: output/coal_production.json
toc: false
---
# La production de charbon en hausse de 13,2 % en octobre 2025 après le recul de septembre

<p class="release-date">Diffusion : 17 janvier 2026 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- La production de charbon du Canada a totalisé 3 511 milliers de tonnes en octobre 2025, en hausse de 13,2 % par rapport à septembre
- D'une année à l'autre, la production a diminué de 1,3 % comparativement à octobre 2024
- Le rebond d'octobre a suivi un recul en septembre, alors que la production avait chuté à 3 102 milliers de tonnes
- Le charbon bitumineux a représenté la majeure partie de la production avec 2 976 milliers de tonnes

</div>

La production de charbon du Canada a augmenté de 13,2 % en octobre 2025 pour atteindre 3 511 milliers de tonnes, rebondissant après les 3 102 milliers de tonnes enregistrés en septembre. Malgré ce gain mensuel, la production est demeurée inférieure de 1,3 % au niveau enregistré en octobre 2024, alors que la production avait totalisé 3 557 milliers de tonnes.

La hausse d'octobre a partiellement compensé le recul enregistré en septembre, lorsque la production a atteint son plus bas niveau de 2025. La production mensuelle a fluctué tout au long de l'année, allant d'un creux de 2 695 milliers de tonnes en février à un sommet de 3 901 milliers de tonnes en avril.

```js
import * as Plot from "npm:@observablehq/plot";

// Données réelles de Statistique Canada, Tableau 25-10-0046
const productionData = [
  {date: new Date("2023-11-01"), value: 4099},
  {date: new Date("2023-12-01"), value: 4270},
  {date: new Date("2024-01-01"), value: 3366},
  {date: new Date("2024-02-01"), value: 3398},
  {date: new Date("2024-03-01"), value: 3889},
  {date: new Date("2024-04-01"), value: 3809},
  {date: new Date("2024-05-01"), value: 3949},
  {date: new Date("2024-06-01"), value: 3569},
  {date: new Date("2024-07-01"), value: 3486},
  {date: new Date("2024-08-01"), value: 3055},
  {date: new Date("2024-09-01"), value: 3546},
  {date: new Date("2024-10-01"), value: 3557},
  {date: new Date("2024-11-01"), value: 3245},
  {date: new Date("2024-12-01"), value: 3713},
  {date: new Date("2025-01-01"), value: 3687},
  {date: new Date("2025-02-01"), value: 2695},
  {date: new Date("2025-03-01"), value: 3816},
  {date: new Date("2025-04-01"), value: 3901},
  {date: new Date("2025-05-01"), value: 3780},
  {date: new Date("2025-06-01"), value: 3444},
  {date: new Date("2025-07-01"), value: 3826},
  {date: new Date("2025-08-01"), value: 3805},
  {date: new Date("2025-09-01"), value: 3102},
  {date: new Date("2025-10-01"), value: 3511}
];

display(Plot.plot({
  title: "Production de charbon, Canada, novembre 2023 à octobre 2025 (milliers de tonnes)",
  width: 680,
  height: 300,
  y: {domain: [2500, 4500], grid: true, label: "Milliers de tonnes"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(productionData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(productionData.slice(-1), {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(productionData.slice(-1), {x: "date", y: "value", text: d => d.value.toLocaleString("fr-CA"), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Tendances de la production au cours de la dernière année

Au cours des 12 mois se terminant en octobre 2025, la production canadienne de charbon a atteint en moyenne 3 527 milliers de tonnes par mois. La production a culminé en avril 2025 à 3 901 milliers de tonnes et a atteint son point le plus bas en février 2025 à 2 695 milliers de tonnes.

Comparativement à la même période un an plus tôt, la production a généralement diminué. En octobre 2024, la production s'établissait à 3 557 milliers de tonnes, tandis que la fin de 2023 avait affiché des niveaux de production plus élevés, décembre 2023 ayant atteint 4 270 milliers de tonnes.

## Le charbon bitumineux domine la production

Le charbon bitumineux, utilisé à des fins métallurgiques et thermiques, a représenté 2 976 milliers de tonnes de la production en octobre 2025. Les ventilations détaillées par type de charbon pour le charbon subbitumineux et le lignite sont supprimées pour des raisons de confidentialité.

| Type de charbon | Octobre 2025 (milliers de tonnes) |
|---|---:|
| Bitumineux, toutes utilisations | 2 976 |
| Subbitumineux, thermique | supprimé |
| Lignite, thermique | supprimé |

## Production provinciale

Les données sur la production provinciale pour octobre 2025 sont en grande partie supprimées pour des raisons de confidentialité. L'Alberta a déclaré une production de 362 milliers de tonnes, tandis que les données pour les autres provinces productrices de charbon, notamment la Colombie-Britannique, la Saskatchewan et la Nouvelle-Écosse, ne sont pas disponibles pour diffusion.

<div class="note-to-readers">

## Note aux lecteurs

Les données sur la production de charbon sont recueillies mensuellement auprès des exploitations minières à travers le Canada. Les volumes de production comprennent le charbon extrait des mines à ciel ouvert et des mines souterraines.

Les données sont susceptibles d'être supprimées lorsque leur divulgation pourrait identifier des exploitations individuelles ou compromettre les exigences de confidentialité. Cela affecte les ventilations provinciales et les classifications détaillées par type de charbon.

La production est déclarée en tonnes. Le facteur scalaire est les milliers, ce qui signifie que les valeurs représentent des milliers de tonnes.

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Fetch coal production data
coal <- get_cansim("25-10-0046")

# National production time series
national <- coal %>%
  filter(GEO == "Canada",
         `Coal types and uses` == "Total all coal types and uses",
         `Coal volume` == "Production") %>%
  select(REF_DATE, VALUE) %>%
  arrange(desc(REF_DATE))

# Calculate month-over-month change
current <- national %>% filter(REF_DATE == "2025-10") %>% pull(VALUE)
previous <- national %>% filter(REF_DATE == "2025-09") %>% pull(VALUE)
mom_change <- (current - previous) / previous * 100

# Calculate year-over-year change
year_ago <- national %>% filter(REF_DATE == "2024-10") %>% pull(VALUE)
yoy_change <- (current - year_ago) / year_ago * 100

# Provincial breakdown
provincial <- coal %>%
  filter(`Coal types and uses` == "Total all coal types and uses",
         `Coal volume` == "Production",
         REF_DATE == "2025-10",
         GEO != "Canada") %>%
  select(GEO, VALUE, STATUS)
```

</details>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 25-10-0046](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=2510004601)
**Enquête :** Enquête mensuelle sur le charbon
**Période de référence :** Octobre 2025
**DOI :** [https://doi.org/10.25318/2510004601-fra](https://doi.org/10.25318/2510004601-fra)

</div>

```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "production-charbon-octobre-2025", "fr"));
```
