import fs from "fs";
import path from "path";

// Sector mapping based on CANSIM table prefixes
const sectorMap = {
  "18-10": "prices",
  "14-10": "labour",
  "20-10": "trade",
  "34-10": "housing",
  "36-10": "economy",
  "16-10": "manufacturing",
  "17-10": "demographics",
  "23-10": "transport",
  "24-10": "tourism",
  "32-10": "agriculture",
  "25-10": "energy",
  "22-10": "employment",
  "12-10": "trade",
  "10-10": "finance",
  "33-10": "finance"
};

// Indicator mapping from slug patterns to display names
const indicatorMap = {
  en: {
    "cpi": "Consumer Price Index",
    "lfs": "Labour Force Survey",
    "gdp": "GDP",
    "retail-trade": "Retail Trade",
    "wholesale-trade": "Wholesale Trade",
    "trade": "International Trade",
    "building-permits": "Building Permits",
    "housing-starts": "Housing Starts",
    "manufacturing-sales": "Manufacturing Sales",
    "airline-passengers": "Airline Passengers",
    "gasoline-prices": "Gasoline Prices",
    "new-housing-price": "New Housing Price Index",
    "food-services": "Food Services",
    "electricity-generation": "Electricity Generation",
    "industrial-product-prices": "Industrial Product Prices",
    "raw-materials-prices": "Raw Materials Prices",
    "population": "Population",
    "ei-claims": "EI Claims",
    "weekly-earnings": "Weekly Earnings",
    "urban-transit": "Urban Transit",
    "railway-carloadings": "Railway Carloadings",
    "motor-vehicle-sales": "Motor Vehicle Sales",
    "international-visitors": "International Visitors",
    "crude-oil-production": "Crude Oil Production",
    "lumber-production": "Lumber Production",
    "farm-prices": "Farm Prices",
    "grain-deliveries": "Grain Deliveries",
    "household-credit": "Household Credit",
    "manufacturing-capacity": "Manufacturing Capacity",
    "exchange-rates": "Exchange Rates",
    "interest-rates": "Interest Rates",
    "frozen-poultry-stocks": "Frozen Poultry Stocks"
  },
  fr: {
    "ipc": "Indice des prix",
    "epa": "Enquete population active",
    "pib": "PIB",
    "commerce-detail": "Commerce de detail",
    "commerce-gros": "Commerce de gros",
    "commerce-international": "Commerce international",
    "permis-batir": "Permis de batir",
    "mises-en-chantier": "Mises en chantier",
    "ventes-manufacturieres": "Ventes manufacturieres",
    "passagers-aeriens": "Passagers aeriens",
    "prix-essence": "Prix de l'essence",
    "indice-prix-logements-neufs": "Indice prix logements neufs",
    "services-alimentaires": "Services alimentaires",
    "production-electricite": "Production d'electricite",
    "prix-produits-industriels": "Prix produits industriels",
    "prix-matieres-premieres": "Prix matieres premieres",
    "population": "Population",
    "demandes-ae": "Demandes d'AE",
    "remuneration-hebdomadaire": "Remuneration hebdomadaire",
    "transport-urbain": "Transport urbain",
    "chargements-ferroviaires": "Chargements ferroviaires",
    "ventes-vehicules-automobiles": "Ventes vehicules",
    "visiteurs-internationaux": "Visiteurs internationaux",
    "production-petrole-brut": "Production petrole brut",
    "production-bois": "Production de bois",
    "prix-agricoles": "Prix agricoles",
    "livraisons-cereales": "Livraisons de cereales",
    "credit-menages": "Credit des menages",
    "capacite-manufacturiere": "Capacite manufacturiere",
    "taux-change": "Taux de change",
    "taux-interet": "Taux d'interet",
    "stocks-volaille-congelee": "Stocks de volaille congelee"
  }
};

function getIndicator(slug, lang) {
  const map = indicatorMap[lang] || indicatorMap.en;
  for (const [pattern, name] of Object.entries(map)) {
    if (slug.startsWith(pattern + "-") || slug === pattern) {
      return name;
    }
  }
  // Fallback: try English patterns for French slugs
  if (lang === "fr") {
    for (const [pattern, name] of Object.entries(indicatorMap.en)) {
      if (slug.startsWith(pattern + "-") || slug === pattern) {
        return name;
      }
    }
  }
  return null;
}

function getSector(tableNumber) {
  if (!tableNumber) return "general";
  const prefix = tableNumber.substring(0, 5);
  return sectorMap[prefix] || "general";
}

// Parse reference period from slug (e.g., "retail-trade-october-2025" -> "2025-10")
function parseReferenceDate(slug) {
  const months = {
    january: "01", february: "02", march: "03", april: "04",
    may: "05", june: "06", july: "07", august: "08",
    september: "09", october: "10", november: "11", december: "12",
    // Quarters
    q1: "03", q2: "06", q3: "09", q4: "12"
  };

  // Match patterns like "october-2025" or "q4-2025"
  const match = slug.match(/-(january|february|march|april|may|june|july|august|september|october|november|december|q[1-4])-(\d{4})$/i);
  if (match) {
    const month = months[match[1].toLowerCase()];
    return `${match[2]}-${month}`;
  }
  return null;
}

function parseArticle(filePath, lang) {
  const content = fs.readFileSync(filePath, "utf-8");
  const slug = path.basename(path.dirname(filePath));

  // Extract title from frontmatter
  const titleMatch = content.match(/^---[\s\S]*?title:\s*(.+?)[\r\n]/m);
  const title = titleMatch ? titleMatch[1].trim() : slug;

  // Extract reference period from slug for sorting
  const referenceDate = parseReferenceDate(slug);

  // Extract release date (handles EN "Released:" and FR "Diffusion :" formats)
  let date = null;
  const isoDateMatch = content.match(/Released:\s*(\d{4}-\d{2}-\d{2})/);
  if (isoDateMatch) {
    date = isoDateMatch[1];
  } else {
    // English text format: "Released: December 5, 2025"
    const textDateMatch = content.match(/Released:\s*([A-Za-z]+)\s+(\d{1,2}),\s*(\d{4})/);
    if (textDateMatch) {
      const months = {
        January: "01", February: "02", March: "03", April: "04",
        May: "05", June: "06", July: "07", August: "08",
        September: "09", October: "10", November: "11", December: "12"
      };
      const month = months[textDateMatch[1]] || "01";
      const day = textDateMatch[2].padStart(2, "0");
      date = `${textDateMatch[3]}-${month}-${day}`;
    } else {
      // French format: "Diffusion : 22 décembre 2025"
      const frDateMatch = content.match(/Diffusion\s*:\s*(\d{1,2})\s+([a-zéû]+)\s+(\d{4})/i);
      if (frDateMatch) {
        const frMonths = {
          janvier: "01", février: "02", fevrier: "02", mars: "03", avril: "04",
          mai: "05", juin: "06", juillet: "07", août: "08", aout: "08",
          septembre: "09", octobre: "10", novembre: "11", décembre: "12", decembre: "12"
        };
        const month = frMonths[frDateMatch[2].toLowerCase()] || "01";
        const day = frDateMatch[1].padStart(2, "0");
        date = `${frDateMatch[3]}-${month}-${day}`;
      }
    }
  }

  // Extract CANSIM table number (supports English "Table" and French "Tableau")
  const tableMatch = content.match(/(?:Table|Tableau)\s+(\d{2}-\d{2}-\d{4})/);
  const tableNumber = tableMatch ? tableMatch[1] : null;

  // Extract first paragraph summary (after highlights div, before first ##)
  const summaryMatch = content.match(/<\/div>\n\n([^#<][^\n]+)/);
  const summary = summaryMatch ? summaryMatch[1].trim().substring(0, 200) : "";

  return {
    slug,
    title,
    date,
    referenceDate,  // For sorting by data period
    tableNumber,
    sector: getSector(tableNumber),
    indicator: getIndicator(slug, lang),
    summary,
    lang,
    path: `/thedaily/${lang}/${slug}/`
  };
}

function scanArticles(docsDir, lang) {
  const langDir = path.join(docsDir, lang);
  const articles = [];

  if (!fs.existsSync(langDir)) return articles;

  const entries = fs.readdirSync(langDir, { withFileTypes: true });

  for (const entry of entries) {
    if (!entry.isDirectory()) continue;
    if (entry.name === "about") continue;

    const indexPath = path.join(langDir, entry.name, "index.md");
    if (fs.existsSync(indexPath)) {
      try {
        const article = parseArticle(indexPath, lang);
        if (article.date) {
          articles.push(article);
        }
      } catch (e) {
        console.error(`Error parsing ${indexPath}:`, e.message);
      }
    }
  }

  return articles;
}

// Main - data loader runs from project root, so "docs" works
const docsDir = path.dirname(new URL(import.meta.url).pathname);
const enArticles = scanArticles(docsDir, "en");
const frArticles = scanArticles(docsDir, "fr");

// Sort by release date descending (most recent first)
function sortByDate(a, b) {
  const aDate = a.date || "0000-00-00";
  const bDate = b.date || "0000-00-00";
  return bDate.localeCompare(aDate);
}
enArticles.sort(sortByDate);
frArticles.sort(sortByDate);

// Add prev/next navigation
function addNavigation(articles) {
  for (let i = 0; i < articles.length; i++) {
    articles[i].prevSlug = i > 0 ? articles[i - 1].slug : null;
    articles[i].nextSlug = i < articles.length - 1 ? articles[i + 1].slug : null;
  }
}

addNavigation(enArticles);
addNavigation(frArticles);

// Output
const output = {
  en: enArticles,
  fr: frArticles,
  generated: new Date().toISOString()
};

process.stdout.write(JSON.stringify(output, null, 2));
