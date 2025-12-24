#!/usr/bin/env python3
"""
The D-AI-LY Site Builder

Generates the static site from article HTML files:
- index.html: SPA-style homepage with date navigation
- articles.json: Date-keyed metadata for both languages
- Copies articles to site/articles/en/ and site/articles/fr/
"""

import os
import re
import json
import shutil
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Optional, Any
from html.parser import HTMLParser


class ArticleMetadataExtractor(HTMLParser):
    """Extract title and metadata from article HTML."""

    def __init__(self):
        super().__init__()
        self.title = ""
        self.in_h1 = False
        self.in_release_date = False
        self.release_date = ""

    def handle_starttag(self, tag, attrs):
        if tag == "h1":
            self.in_h1 = True
        attrs_dict = dict(attrs)
        if attrs_dict.get("class") == "release-date":
            self.in_release_date = True

    def handle_endtag(self, tag):
        if tag == "h1":
            self.in_h1 = False
        if self.in_release_date and tag == "div":
            self.in_release_date = False

    def handle_data(self, data):
        if self.in_h1:
            self.title += data.strip()
        if self.in_release_date:
            self.release_date += data.strip()


def extract_article_metadata(html_path: Path, lang: str = "en") -> Dict:
    """Extract metadata from an article HTML file."""
    with open(html_path, "r", encoding="utf-8") as f:
        content = f.read()

    parser = ArticleMetadataExtractor()
    parser.feed(content)

    # Extract date from filename pattern
    filename = html_path.stem
    date_match = re.search(r'(\d{4})-?(\d{2})?-?(\d{2})?', filename)

    if date_match:
        year = date_match.group(1)
        month = date_match.group(2) or "01"
        day = date_match.group(3) or "01"
        article_date = f"{year}-{month}-{day}"
    else:
        mtime = html_path.stat().st_mtime
        article_date = datetime.fromtimestamp(mtime).strftime("%Y-%m-%d")

    # Parse release date from content if available
    release_date_text = parser.release_date
    # Handle both English and French formats
    release_date_text = release_date_text.replace("Released:", "").replace("Diffusé:", "").strip()
    if release_date_text:
        # French month name mapping
        french_months = {
            'janvier': 'January', 'février': 'February', 'mars': 'March',
            'avril': 'April', 'mai': 'May', 'juin': 'June',
            'juillet': 'July', 'août': 'August', 'septembre': 'September',
            'octobre': 'October', 'novembre': 'November', 'décembre': 'December'
        }
        # Convert French months to English for parsing
        date_text_normalized = release_date_text.lower()
        for fr_month, en_month in french_months.items():
            if fr_month in date_text_normalized:
                date_text_normalized = release_date_text.replace(
                    fr_month, en_month
                ).replace(fr_month.capitalize(), en_month)
                release_date_text = date_text_normalized
                break

        # Try various date formats
        for fmt in ["%B %d, %Y", "%d %B %Y", "%d %b %Y"]:
            try:
                parsed_date = datetime.strptime(release_date_text, fmt)
                article_date = parsed_date.strftime("%Y-%m-%d")
                break
            except ValueError:
                continue

    # Extract table number from source section
    table_match = re.search(r'Table[^\d]*(\d{2}-\d{2}-\d{4})', content)
    table_number = table_match.group(1) if table_match else None

    return {
        "title": parser.title,
        "date": article_date,
        "table_number": table_number,
        "filename": html_path.name,
        "slug": html_path.stem,
        "lang": lang
    }


def get_bilingual_articles(articles_base: Path) -> Dict[str, Dict[str, List[Dict]]]:
    """
    Get metadata for all articles in both languages.
    Returns: {date: {en: [...articles], fr: [...articles]}}
    """
    date_grouped: Dict[str, Dict[str, List[Dict]]] = {}

    for lang in ["en", "fr"]:
        lang_dir = articles_base / lang
        if not lang_dir.exists():
            continue

        for html_file in lang_dir.glob("*.html"):
            try:
                metadata = extract_article_metadata(html_file, lang)
                if metadata["title"]:
                    date = metadata["date"]
                    if date not in date_grouped:
                        date_grouped[date] = {"en": [], "fr": []}
                    date_grouped[date][lang].append(metadata)
            except Exception as e:
                print(f"Warning: Could not parse {html_file}: {e}")

    # Also check root articles dir for backwards compatibility
    root_dir = articles_base
    if root_dir.exists():
        for html_file in root_dir.glob("*.html"):
            # Skip if it's a directory or in en/fr subdirs
            if html_file.parent.name in ["en", "fr"]:
                continue
            try:
                metadata = extract_article_metadata(html_file, "en")
                if metadata["title"]:
                    date = metadata["date"]
                    if date not in date_grouped:
                        date_grouped[date] = {"en": [], "fr": []}
                    # Avoid duplicates
                    existing_slugs = [a["slug"] for a in date_grouped[date]["en"]]
                    if metadata["slug"] not in existing_slugs:
                        date_grouped[date]["en"].append(metadata)
            except Exception as e:
                print(f"Warning: Could not parse {html_file}: {e}")

    return date_grouped


def build_articles_json(date_grouped: Dict[str, Dict[str, List[Dict]]]) -> Dict[str, Any]:
    """Build the articles.json structure for navigation."""
    articles_data = {
        "dates": sorted(date_grouped.keys(), reverse=True),
        "articles": {}
    }

    for date, langs in date_grouped.items():
        articles_data["articles"][date] = {}
        for lang in ["en", "fr"]:
            if langs.get(lang):
                articles_data["articles"][date][lang] = [
                    {
                        "slug": a["slug"],
                        "title": a["title"],
                        "table": a["table_number"],
                        "filename": a["filename"]
                    }
                    for a in langs[lang]
                ]

    return articles_data


def generate_spa_index(articles_data: Dict[str, Any], output_path: Path) -> None:
    """Generate the SPA-style homepage with date navigation."""

    # Get dates for navigation
    dates = articles_data.get("dates", [])
    latest_date = dates[0] if dates else datetime.now().strftime("%Y-%m-%d")

    html = """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>The D-AI-LY - AI-Generated Statistical Bulletins</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="site-header">
    <div class="masthead">
      <h1><a href="/">The D-AI-LY</a></h1>
      <p class="tagline" data-en="AI-generated statistical bulletins from Statistics Canada data"
         data-fr="Bulletins statistiques produits par l'IA à partir des données de Statistique Canada">
        AI-generated statistical bulletins from Statistics Canada data
      </p>
    </div>
    <div class="header-controls">
      <div class="lang-toggle">
        <button id="lang-en" class="lang-btn active">EN</button>
        <button id="lang-fr" class="lang-btn">FR</button>
      </div>
    </div>
  </header>

  <nav class="date-nav">
    <button id="prev-day" class="nav-btn" aria-label="Previous day">&larr;</button>
    <div class="current-date">
      <span id="date-display"></span>
      <input type="date" id="date-picker" aria-label="Select date">
    </div>
    <button id="next-day" class="nav-btn" aria-label="Next day">&rarr;</button>
  </nav>

  <main>
    <section class="daily-articles">
      <h2 class="section-title" data-en="Today's Releases" data-fr="Publications du jour">Today's Releases</h2>
      <div id="articles-container">
        <p class="no-articles" data-en="No articles for this date" data-fr="Aucun article pour cette date">
          Loading...
        </p>
      </div>
    </section>

    <div class="archive-link">
      <a href="archive.html" data-en="Browse Archive" data-fr="Parcourir les archives">Browse Archive</a>
    </div>
  </main>

  <footer>
    <div class="ai-disclosure">
      <strong data-en="AI Disclosure:" data-fr="Divulgation relative à l'IA :">AI Disclosure:</strong>
      <span data-en="Articles on this site are generated by an experimental AI system. Data comes from official Statistics Canada sources. Please verify important figures with"
            data-fr="Les articles sur ce site sont générés par un système d'IA expérimental. Les données proviennent de sources officielles de Statistique Canada. Veuillez vérifier les chiffres importants auprès de">
        Articles on this site are generated by an experimental AI system.
        Data comes from official Statistics Canada sources. Please verify important figures with
      </span>
      <a href="https://www.statcan.gc.ca" data-en="Statistics Canada" data-fr="Statistique Canada">Statistics Canada</a>.
    </div>
    <p class="copyright" data-en="Data source: Statistics Canada. Generated by The D-AI-LY."
       data-fr="Source des données : Statistique Canada. Généré par Le D-AI-LY.">
      Data source: Statistics Canada. Generated by The D-AI-LY.
    </p>
  </footer>

  <script src="js/navigation.js"></script>
</body>
</html>
"""

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(html)
    print(f"Generated: {output_path}")


def generate_archive_html(articles_data: Dict[str, Any], output_path: Path) -> None:
    """Generate the archive page with all articles grouped by month."""

    # Group by month
    months: Dict[str, Dict] = {}
    for date in articles_data.get("dates", []):
        try:
            dt = datetime.strptime(date, "%Y-%m-%d")
            month_key = dt.strftime("%Y-%m")
            month_label = dt.strftime("%B %Y")
        except ValueError:
            month_key = "unknown"
            month_label = "Unknown Date"

        if month_key not in months:
            months[month_key] = {"label": month_label, "dates": []}
        months[month_key]["dates"].append(date)

    # Build archive content
    archive_content = ""
    for month_key in sorted(months.keys(), reverse=True):
        month_data = months[month_key]
        archive_content += f"""
      <section class="archive-month">
        <h2>{month_data['label']}</h2>
        <ul class="article-list">
"""
        for date in sorted(month_data["dates"], reverse=True):
            articles = articles_data["articles"].get(date, {})
            en_articles = articles.get("en", [])
            for article in en_articles:
                try:
                    dt = datetime.strptime(date, "%Y-%m-%d")
                    display_date = dt.strftime("%B %d, %Y")
                except ValueError:
                    display_date = date
                archive_content += f"""          <li>
            <a href="articles/en/{article['filename']}">{article['title']}</a>
            <span class="date">{display_date}</span>
          </li>
"""
        archive_content += """        </ul>
      </section>
"""

    total_articles = sum(
        len(articles_data["articles"].get(d, {}).get("en", []))
        for d in articles_data.get("dates", [])
    )

    html = f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Archive - The D-AI-LY</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="site-header">
    <div class="masthead">
      <h1><a href="/">The D-AI-LY</a></h1>
      <p class="tagline">AI-generated statistical bulletins from Statistics Canada data</p>
    </div>
    <nav>
      <a href="/">Latest</a>
      <a href="archive.html" class="active">Archive</a>
    </nav>
  </header>

  <main>
    <h1 class="page-title">Article Archive</h1>
    <p class="archive-count">{total_articles} articles published</p>

    <div class="archive-content">
{archive_content}
    </div>
  </main>

  <footer>
    <div class="ai-disclosure">
      <strong>AI Disclosure:</strong> Articles on this site are generated by an experimental AI system.
      Data comes from official Statistics Canada sources. Please verify important figures with
      <a href="https://www.statcan.gc.ca">Statistics Canada</a>.
    </div>
    <p class="copyright">Data source: Statistics Canada. Generated by The D-AI-LY.</p>
  </footer>
</body>
</html>
"""

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(html)
    print(f"Generated: {output_path}")


def copy_bilingual_articles(source_base: Path, dest_base: Path) -> int:
    """Copy article HTML files to site directory, preserving language structure."""
    copied = 0

    for lang in ["en", "fr"]:
        source_dir = source_base / lang
        dest_dir = dest_base / lang

        if source_dir.exists():
            dest_dir.mkdir(parents=True, exist_ok=True)
            for html_file in source_dir.glob("*.html"):
                dest_file = dest_dir / html_file.name
                shutil.copy2(html_file, dest_file)
                copied += 1

    # Also copy from root for backwards compatibility
    root_articles = list(source_base.glob("*.html"))
    if root_articles:
        # Copy to en/ by default
        dest_en = dest_base / "en"
        dest_en.mkdir(parents=True, exist_ok=True)
        for html_file in root_articles:
            if html_file.parent.name not in ["en", "fr"]:
                dest_file = dest_en / html_file.name
                if not dest_file.exists():  # Don't overwrite
                    shutil.copy2(html_file, dest_file)
                    copied += 1

    print(f"Copied {copied} articles to {dest_base}")
    return copied


def save_articles_json(articles_data: Dict[str, Any], output_path: Path) -> None:
    """Save article metadata as JSON for navigation."""
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(articles_data, f, indent=2, ensure_ascii=False)
    print(f"Saved metadata: {output_path}")


def build_site(project_dir: Path = None) -> None:
    """Build the complete static site."""
    if project_dir is None:
        project_dir = Path(__file__).parent

    articles_source = project_dir / "output" / "articles"
    site_dir = project_dir / "site"

    print("Building The D-AI-LY site (bilingual)...")
    print(f"Source: {articles_source}")
    print(f"Output: {site_dir}")
    print()

    # Get all articles from both languages
    date_grouped = get_bilingual_articles(articles_source)

    total_articles = sum(
        len(langs.get("en", [])) + len(langs.get("fr", []))
        for langs in date_grouped.values()
    )
    print(f"Found {len(date_grouped)} dates with {total_articles} articles")

    if not date_grouped:
        print("No articles found. Generate some articles first.")
        return

    # Build articles.json structure
    articles_data = build_articles_json(date_grouped)

    # Generate pages
    generate_spa_index(articles_data, site_dir / "index.html")
    generate_archive_html(articles_data, site_dir / "archive.html")

    # Copy articles (bilingual structure)
    copy_bilingual_articles(articles_source, site_dir / "articles")

    # Save metadata
    save_articles_json(articles_data, site_dir / "articles.json")

    print()
    print("Site build complete!")
    print(f"View at: file://{site_dir}/index.html")


if __name__ == "__main__":
    build_site()
