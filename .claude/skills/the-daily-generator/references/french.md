# French Translation Reference

Rules for generating French-language articles.

## Formatting

| Element | English | French |
|---------|---------|--------|
| Decimal separator | 2.2% | 2,2 % |
| Date format | December 22, 2025 | 22 décembre 2025 |
| Release label | Released: | Diffusion : |
| Thousands separator | 1,234 | 1 234 |
| Currency | $1.2 billion | 1,2 milliard $ |

## Province Names

| English | French |
|---------|--------|
| Quebec | Québec |
| New Brunswick | Nouveau-Brunswick |
| Nova Scotia | Nouvelle-Écosse |
| Newfoundland and Labrador | Terre-Neuve-et-Labrador |
| British Columbia | Colombie-Britannique |
| Prince Edward Island | Île-du-Prince-Édouard |
| Ontario | Ontario |
| Manitoba | Manitoba |
| Saskatchewan | Saskatchewan |
| Alberta | Alberta |

## Common Indicator Translations

| English | French |
|---------|--------|
| Consumer Price Index | Indice des prix à la consommation |
| Labour Force Survey | Enquête sur la population active |
| Retail Trade | Commerce de détail |
| GDP | PIB |
| Unemployment rate | Taux de chômage |
| Employment | Emploi |

## CPI Components

| English | French |
|---------|--------|
| Food | Aliments |
| Shelter | Logement |
| Transportation | Transports |
| Household operations | Dépenses courantes |
| Clothing and footwear | Vêtements et chaussures |
| Health and personal care | Santé et soins personnels |
| Recreation | Loisirs |
| Alcoholic beverages | Boissons alcoolisées |
| Education | Éducation |

## Slug Conventions

| Type | English | French |
|------|---------|--------|
| CPI | `cpi-november-2025` | `ipc-novembre-2025` |
| Retail | `retail-trade-october-2025` | `commerce-detail-octobre-2025` |
| Labour | `lfs-november-2025` | `epa-novembre-2025` |
| GDP | `gdp-october-2025` | `pib-octobre-2025` |

## Source Info Block

```markdown
<div class="source-info">

**Source :** Statistique Canada, [Tableau XX-XX-XXXX](https://www150.statcan.gc.ca/t1/tbl1/fr/tv.action?pid=XXXXXXXXXX)
**Enquête :** Nom de l'enquête
**Période de référence :** Mois Année
**DOI :** [https://doi.org/10.25318/XXXXXXXXXX-fra](https://doi.org/10.25318/XXXXXXXXXX-fra)

</div>
```

## Number Formatting in Charts

```js
// French decimal formatting
d.value.toFixed(1).replace(".", ",")  // 165,4

// French percentage with space
d.toFixed(1).replace(".", ",") + " %"  // 2,2 %

// French currency
d.toFixed(1).replace(".", ",") + " G$"  // 165,4 G$
```
