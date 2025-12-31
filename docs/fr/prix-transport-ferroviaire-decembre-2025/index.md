---
title: Les prix des services de transport ferroviaire de marchandises peu changés en décembre 2025
toc: false
---

# Les prix des services de transport ferroviaire de marchandises peu changés en décembre 2025

<p class="release-date">Diffusion : 27 décembre 2025 <span class="article-type-tag release">Nouvelle publication</span></p>

<div class="highlights">

**Faits saillants**

- L'Indice des prix des services de transport ferroviaire de marchandises s'est établi à 131,2 en décembre 2025, peu changé par rapport à novembre
- Les métaux et minéraux ont enregistré la valeur d'indice la plus élevée, soit 140,2
- Les céréales et engrais affichaient la valeur d'indice la plus faible, soit 127,1, un écart de 10,3 % par rapport aux métaux
- Les indices de prix pour les produits automobiles et le charbon demeurent supprimés pour des raisons de confidentialité

</div>

L'Indice des prix des services de transport ferroviaire de marchandises (IPSTFM) s'est établi à 131,2 en décembre 2025, peu changé par rapport à 131,3 en novembre. L'indice mesure les variations des prix des expéditions de marchandises par l'industrie du transport ferroviaire.

Parmi les groupes de marchandises, les métaux et minéraux ont enregistré la valeur d'indice la plus élevée, soit 140,2, tandis que les céréales et engrais affichaient la plus faible, soit 127,1. L'écart de 10,3 % entre les indices les plus élevés et les plus faibles reflète la variation des pressions sur les prix dans les différents marchés du transport ferroviaire.

```js
import * as Plot from "npm:@observablehq/plot";

// Données de Statistique Canada, Tableau 18-10-0212
// Indice des prix des services de transport ferroviaire de marchandises par produit, décembre 2025 (2019=100)
const commodityData = [
  {commodity: "Métaux et minéraux", value: 140.2},
  {commodity: "Produits forestiers", value: 135.5},
  {commodity: "Intermodal", value: 133.0},
  {commodity: "Pétrole et produits chimiques", value: 131.8},
  {commodity: "Indice d'ensemble", value: 131.2},
  {commodity: "Céréales et engrais", value: 127.1}
];

display(Plot.plot({
  title: "Indice des prix du transport ferroviaire par produit, décembre 2025",
  width: 700,
  height: 300,
  marginLeft: 200,
  style: {fontSize: "12px"},
  x: {domain: [120, 145], grid: true, label: "Indice (2019=100)"},
  y: {label: null},
  marks: [
    Plot.barX(commodityData, {
      y: "commodity",
      x1: 120,
      x2: "value",
      fill: d => d.commodity === "Indice d'ensemble" ? "#1f77b4" : "#AF3C43",
      sort: {y: "-x"}
    }),
    Plot.text(commodityData, {
      y: "commodity",
      x: "value",
      text: d => d.value.toFixed(1).replace(".", ","),
      dx: 20,
      fill: "currentColor"
    })
  ]
}));
```

## Répartition par marchandise

Les prix du transport ferroviaire varient considérablement selon le type de marchandise expédiée. En décembre 2025, les métaux et minéraux affichaient la valeur d'indice la plus élevée, soit 140,2, ce qui indique que les prix pour l'expédition de ces marchandises ont augmenté de 40,2 % depuis la période de référence de 2019.

Le transport intermodal, qui comprend le fret conteneurisé, affichait un indice de 133,0. Cette catégorie représente les marchandises expédiées dans des conteneurs standardisés pouvant être transférés entre le rail, le camion et le navire.

Les céréales et engrais ont enregistré l'indice le plus bas, soit 127,1, ce qui peut refléter des structures contractuelles et des pressions concurrentielles différentes sur les marchés du transport agricole.

```js
// Données de Statistique Canada, Tableau 18-10-0212
// Tendance mensuelle, octobre à décembre 2025
const trendData = [
  {date: new Date("2025-10"), value: 130.2},
  {date: new Date("2025-11"), value: 131.3},
  {date: new Date("2025-12"), value: 131.2}
];

display(Plot.plot({
  title: "Indice des prix du transport ferroviaire, octobre à décembre 2025",
  width: 640,
  height: 280,
  y: {domain: [128, 134], grid: true, label: "Indice (2019=100)"},
  x: {type: "utc", label: null},
  marks: [
    Plot.lineY(trendData, {x: "date", y: "value", stroke: "#AF3C43", strokeWidth: 2}),
    Plot.dot(trendData, {x: "date", y: "value", fill: "#AF3C43", r: 5}),
    Plot.text(trendData.slice(-1), {x: "date", y: "value", text: d => d.value.toFixed(1).replace(".", ","), dy: -12, fill: "#AF3C43", fontWeight: 600})
  ]
}));
```

## Catégories supprimées

Les indices de prix pour les produits automobiles et le charbon ont été supprimés pour des raisons de confidentialité. Cette suppression survient lorsqu'un petit nombre de répondants représente une grande part d'un groupe de marchandises particulier, ce qui pourrait potentiellement permettre l'identification de renseignements commerciaux individuels.

| Marchandise | Indice (déc. 2025) | Variation depuis nov. |
|-------------|--------------------|-----------------------|
| Métaux et minéraux | 140,2 | +0,2 % |
| Produits forestiers | 135,5 | -0,6 % |
| Intermodal | 133,0 | +0,1 % |
| Pétrole et produits chimiques | 131,8 | +0,3 % |
| **Indice d'ensemble** | **131,2** | **-0,1 %** |
| Céréales et engrais | 127,1 | -0,4 % |
| Automobiles | supprimé | — |
| Charbon | supprimé | — |

<div class="note-to-readers">

## Note aux lecteurs

L'Indice des prix des services de transport ferroviaire de marchandises (IPSTFM) mesure les variations des prix des expéditions de marchandises par l'industrie du transport ferroviaire. Les indices de prix sont ajustés en fonction de la qualité pour tenir compte des changements de service.

L'indice utilise 2019 comme période de référence (2019=100). Une valeur d'indice de 131,2 signifie que les prix sont 31,2 % plus élevés que le prix moyen en 2019.

Les indices de prix pour les produits automobiles et le charbon ont été supprimés pour des raisons de confidentialité en raison du petit nombre de répondants dans ces catégories.

</div>

<div class="source-info">

**Source :** Statistique Canada, [Tableau 18-10-0212](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=1810021201)
**Enquête :** Indice des prix des services de transport ferroviaire de marchandises
**Période de référence :** Décembre 2025
**DOI :** [https://doi.org/10.25318/1810021201-fra](https://doi.org/10.25318/1810021201-fra)

</div>

<details>
<summary>Reproductibilité : code R pour l'extraction des données</summary>

```r
library(cansim)
library(dplyr)

# Récupérer les données des prix du transport ferroviaire
ipstfm <- get_cansim("18-10-0212")

# Répartition par marchandise du dernier mois
dernier <- ipstfm %>%
  filter(REF_DATE == max(REF_DATE)) %>%
  select(Commodity, VALUE) %>%
  arrange(desc(VALUE))

# Série chronologique de l'indice d'ensemble
ensemble <- ipstfm %>%
  filter(Commodity == "Freight Rail Services Price Index") %>%
  select(REF_DATE, VALUE) %>%
  arrange(REF_DATE)

# Calculer la variation mensuelle
dec2025 <- ensemble %>% filter(REF_DATE == "2025-12") %>% pull(VALUE)
nov2025 <- ensemble %>% filter(REF_DATE == "2025-11") %>% pull(VALUE)
var_mensuelle <- (dec2025 - nov2025) / nov2025 * 100
```

</details>

```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "prix-transport-ferroviaire-decembre-2025", "fr"));
```
