---
title: The D-AI-LY
toc: false
---

# The D-AI-LY

<p class="tagline">AI-generated statistical bulletins from Statistics Canada data</p>

## Latest Releases

```js
const articles = await FileAttachment("articles.json").json();
const featured = articles.en.slice(0, 3);

function formatDate(dateStr) {
  const d = new Date(dateStr);
  return d.toLocaleDateString("en-US", { month: "long", day: "numeric", year: "numeric" });
}

function sectorLabel(sector) {
  const labels = {
    prices: "Consumer Prices",
    labour: "Labour Market",
    trade: "Trade",
    housing: "Housing",
    economy: "Economy",
    manufacturing: "Manufacturing",
    demographics: "Demographics",
    transport: "Transportation",
    tourism: "Tourism",
    agriculture: "Agriculture",
    energy: "Energy",
    general: "Statistics"
  };
  return labels[sector] || "Statistics";
}
```

<div class="featured-articles">

```js
for (const article of featured) {
  display(html`<a href="${article.path}" class="article-card">
    <span class="article-date">${formatDate(article.date)}</span>
    <span class="article-title">${article.title}</span>
  </a>`);
}
```

</div>

<div class="feed-links">

[**View all English releases →**](/en/)

[**Voir les publications en français →**](/fr/)

</div>

---

<div class="about-section">

## About

The D-AI-LY is an experimental project using large language models to generate statistical bulletins from Statistics Canada data. Articles are produced automatically from official CANSIM tables.

**Not an official Statistics Canada publication.** Data comes from public sources; narrative and analysis are AI-generated. [Verify figures with Statistics Canada](https://www.statcan.gc.ca).

Read about how it works in the accompanying [blog post](https://dshkol.com/posts/the-daily/) and check out the repo on [GitHub](https://github.com/dshkol/thedaily).

</div>
