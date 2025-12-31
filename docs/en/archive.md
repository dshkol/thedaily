---
title: Archive
toc: false
---

# Article Archive

Browse all releases by date or indicator type.

```js
const data = await FileAttachment("../articles.json").json();
const articles = data.en;

// Sector labels
const sectorLabels = {
  prices: "Prices", labour: "Labour", trade: "Trade", housing: "Housing",
  economy: "Economy", manufacturing: "Manufacturing", demographics: "Demographics",
  transport: "Transport", tourism: "Tourism", agriculture: "Agriculture",
  energy: "Energy", finance: "Finance", employment: "Employment", general: "General"
};

// Get unique months and indicators for filters
const months = [...new Set(articles.map(a => a.date?.slice(0, 7)))].filter(Boolean).sort().reverse();
const indicators = [...new Set(articles.map(a => a.indicator))].filter(Boolean).sort();
```

```js
// Filter controls
const monthFilter = view(Inputs.select(
  ["All months", ...months],
  {label: "Month", value: "All months"}
));

const indicatorFilter = view(Inputs.select(
  ["All indicators", ...indicators],
  {label: "Indicator", value: "All indicators"}
));
```

```js
// Apply filters
const filteredArticles = articles.filter(a => {
  const matchMonth = monthFilter === "All months" || a.date?.startsWith(monthFilter);
  const matchIndicator = indicatorFilter === "All indicators" || a.indicator === indicatorFilter;
  return matchMonth && matchIndicator;
});
```

<div class="article-count">

Showing **${filteredArticles.length}** of ${articles.length} articles

</div>

```js
// Render filtered articles
display(html`
  <div class="archive-list">
    ${filteredArticles.map(a => html`
      <div class="archive-item">
        <a href="${a.path}" class="archive-title">${a.title}</a>
        <div class="archive-meta">
          <span class="archive-date">${a.date || ""}</span>
          ${a.indicator ? html`<span class="archive-indicator">${a.indicator}</span>` : ""}
          ${a.tableNumber ? html`<span class="archive-table">Table ${a.tableNumber}</span>` : ""}
        </div>
        ${a.summary ? html`<p class="archive-summary">${a.summary}</p>` : ""}
      </div>
    `)}
  </div>
`);
```

<style>
.article-count {
  margin: 1.5rem 0;
  padding: 0.75rem 1rem;
  background: #f5f5f5;
  border-radius: 4px;
}

.archive-list {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.archive-item {
  padding-bottom: 1.5rem;
  border-bottom: 1px solid #eee;
}

.archive-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: #AF3C43;
  text-decoration: none;
}

.archive-title:hover {
  text-decoration: underline;
}

.archive-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  margin-top: 0.5rem;
  font-size: 0.875rem;
  color: #666;
}

.archive-indicator {
  background: #AF3C43;
  color: white;
  padding: 0.1rem 0.5rem;
  border-radius: 3px;
  font-size: 0.75rem;
}

.archive-table {
  font-family: monospace;
}

.archive-summary {
  margin-top: 0.5rem;
  color: #333;
  font-size: 0.95rem;
}
</style>
