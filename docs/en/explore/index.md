---
title: Explore Articles
toc: false
---

# Explore The D-AI-LY

<p class="tagline">Filter and search all statistical releases</p>

```js
const data = await FileAttachment("../../articles.json").json();
const articles = data.en;

// Sector labels
const sectorLabels = {
  prices: "Prices",
  labour: "Labour",
  trade: "Trade",
  housing: "Housing",
  economy: "Economy",
  manufacturing: "Manufacturing",
  demographics: "Demographics",
  transport: "Transport",
  tourism: "Tourism",
  agriculture: "Agriculture",
  energy: "Energy",
  finance: "Finance",
  employment: "Employment",
  general: "General"
};

// Get unique values
const sectors = [...new Set(articles.map(a => a.sector))].filter(Boolean).sort();
const years = [...new Set(articles.map(a => a.referenceDate?.slice(0, 4) || a.date?.slice(0, 4)))].filter(Boolean).sort().reverse();
const indicators = [...new Set(articles.map(a => a.indicator))].filter(Boolean).sort();

function formatDate(dateStr) {
  if (!dateStr) return "";
  const d = new Date(dateStr + "T12:00:00");
  return d.toLocaleDateString("en-CA", { month: "short", day: "numeric", year: "numeric" });
}
```

<div class="explore-filters">

```js
const sectorFilter = view(Inputs.select(
  ["All sectors", ...sectors.map(s => sectorLabels[s] || s)],
  {label: "Sector", value: "All sectors"}
));
```

```js
const indicatorFilter = view(Inputs.select(
  ["All indicators", ...indicators],
  {label: "Indicator", value: "All indicators"}
));
```

```js
const yearFilter = view(Inputs.select(
  ["All years", ...years],
  {label: "Year", value: "All years"}
));
```

```js
const searchInput = view(Inputs.text({
  label: "Search",
  placeholder: "Search titles..."
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
  const matchSector = sectorFilter === "All sectors" ||
    a.sector === sectorByLabel[sectorFilter] ||
    sectorLabels[a.sector] === sectorFilter;
  const matchIndicator = indicatorFilter === "All indicators" || a.indicator === indicatorFilter;
  const matchYear = yearFilter === "All years" ||
    a.referenceDate?.startsWith(yearFilter) ||
    a.date?.startsWith(yearFilter);
  const matchSearch = !searchInput ||
    a.title.toLowerCase().includes(searchInput.toLowerCase()) ||
    a.summary?.toLowerCase().includes(searchInput.toLowerCase());
  return matchSector && matchIndicator && matchYear && matchSearch;
});
```

<div class="explore-count">

Showing **${filtered.length}** of ${articles.length} articles

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
