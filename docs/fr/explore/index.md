---
title: Explorer les articles
toc: false
---

# Explorer Le D-AI-LY

<p class="tagline">Filtrer et rechercher toutes les publications statistiques</p>

```js
const data = await FileAttachment("../../articles.json").json();
const articles = data.fr;

// Sector labels in French
const sectorLabels = {
  prices: "Prix",
  labour: "Travail",
  trade: "Commerce",
  housing: "Logement",
  economy: "Economie",
  manufacturing: "Fabrication",
  demographics: "Demographie",
  transport: "Transport",
  tourism: "Tourisme",
  agriculture: "Agriculture",
  energy: "Energie",
  finance: "Finance",
  employment: "Emploi",
  general: "General"
};

// Get unique values
const sectors = [...new Set(articles.map(a => a.sector))].filter(Boolean).sort();
const years = [...new Set(articles.map(a => a.referenceDate?.slice(0, 4) || a.date?.slice(0, 4)))].filter(Boolean).sort().reverse();
const indicators = [...new Set(articles.map(a => a.indicator))].filter(Boolean).sort();

function formatDate(dateStr) {
  if (!dateStr) return "";
  const d = new Date(dateStr + "T12:00:00");
  return d.toLocaleDateString("fr-CA", { day: "numeric", month: "short", year: "numeric" });
}
```

<div class="explore-filters">

```js
const sectorFilter = view(Inputs.select(
  ["Tous les secteurs", ...sectors.map(s => sectorLabels[s] || s)],
  {label: "Secteur", value: "Tous les secteurs"}
));
```

```js
const indicatorFilter = view(Inputs.select(
  ["Tous les indicateurs", ...indicators],
  {label: "Indicateur", value: "Tous les indicateurs"}
));
```

```js
const yearFilter = view(Inputs.select(
  ["Toutes les annees", ...years],
  {label: "Annee", value: "Toutes les annees"}
));
```

```js
const searchInput = view(Inputs.text({
  label: "Rechercher",
  placeholder: "Rechercher dans les titres..."
}));
```

</div>

```js
// Reverse map sector labels
const sectorByLabel = Object.fromEntries(
  Object.entries(sectorLabels).map(([k, v]) => [v, k])
);

// Apply filters
const filtered = articles.filter(a => {
  const matchSector = sectorFilter === "Tous les secteurs" ||
    a.sector === sectorByLabel[sectorFilter] ||
    sectorLabels[a.sector] === sectorFilter;
  const matchIndicator = indicatorFilter === "Tous les indicateurs" || a.indicator === indicatorFilter;
  const matchYear = yearFilter === "Toutes les annees" ||
    a.referenceDate?.startsWith(yearFilter) ||
    a.date?.startsWith(yearFilter);
  const matchSearch = !searchInput ||
    a.title.toLowerCase().includes(searchInput.toLowerCase()) ||
    a.summary?.toLowerCase().includes(searchInput.toLowerCase());
  return matchSector && matchIndicator && matchYear && matchSearch;
});
```

<div class="explore-count">

Affichage de **${filtered.length}** articles sur ${articles.length}

</div>

```js
display(html`<div class="explore-grid">
  ${filtered.map(a => html`
    <a href="${a.path}" class="explore-card">
      <span class="sector-tag sector-${a.sector}">${sectorLabels[a.sector] || a.sector}</span>
      <span class="explore-title">${a.title}</span>
      <span class="explore-date">${formatDate(a.date)}${a.indicator ? html` · <span class="explore-indicator">${a.indicator}</span>` : ""}</span>
      ${a.summary ? html`<span class="explore-summary">${a.summary.slice(0, 120)}${a.summary.length > 120 ? "..." : ""}</span>` : ""}
    </a>
  `)}
</div>`);
```
