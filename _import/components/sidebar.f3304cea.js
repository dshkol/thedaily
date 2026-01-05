// Related articles sidebar component
import {html} from "../../_npm/htl@0.3.1/72f4716c.js";

// Sector labels for both languages
const sectorLabels = {
  en: {
    prices: "Prices", labour: "Labour", trade: "Trade", housing: "Housing",
    economy: "Economy", manufacturing: "Manufacturing", demographics: "Demographics",
    transport: "Transport", tourism: "Tourism", agriculture: "Agriculture",
    energy: "Energy", finance: "Finance", employment: "Employment", general: "General"
  },
  fr: {
    prices: "Prix", labour: "Travail", trade: "Commerce", housing: "Logement",
    economy: "Economie", manufacturing: "Fabrication", demographics: "Demographie",
    transport: "Transport", tourism: "Tourisme", agriculture: "Agriculture",
    energy: "Energie", finance: "Finance", employment: "Emploi", general: "General"
  }
};

// UI text for both languages
const uiText = {
  en: {
    relatedArticles: "Related Articles",
    exploreAll: "Explore all",
    noRelated: "No related articles"
  },
  fr: {
    relatedArticles: "Articles connexes",
    exploreAll: "Explorer tout",
    noRelated: "Aucun article connexe"
  }
};

export function createSidebar(articles, currentSlug, lang = "en") {
  // Find current article
  const langArticles = articles[lang] || [];
  const currentArticle = langArticles.find(a => a.slug === currentSlug);

  if (!currentArticle) {
    return html``;
  }

  const sector = currentArticle.sector || "general";
  const labels = sectorLabels[lang] || sectorLabels.en;
  const text = uiText[lang] || uiText.en;

  // Find related articles (same sector, excluding current, max 5)
  const related = langArticles
    .filter(a => a.sector === sector && a.slug !== currentSlug)
    .slice(0, 5);

  return html`
    <aside class="article-sidebar">
      <div class="sidebar-section">
        <span class="sector-tag sector-${sector}">${labels[sector] || sector}</span>
      </div>

      <div class="sidebar-section">
        <h4>${text.relatedArticles}</h4>
        ${related.length > 0
          ? html`<ul class="related-list">
              ${related.map(a => html`
                <li><a href="${a.path}">${a.title}</a></li>
              `)}
            </ul>`
          : html`<p class="no-related">${text.noRelated}</p>`
        }
      </div>

      <div class="sidebar-section">
        <a href="/thedaily/${lang}/explore/?sector=${encodeURIComponent(labels[sector])}" class="explore-link">
          ${text.exploreAll} ${labels[sector]} →
        </a>
      </div>
    </aside>
  `;
}
