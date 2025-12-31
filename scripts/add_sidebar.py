#!/usr/bin/env python3
"""Add related articles sidebar to all article pages."""

import os
import re
import sys

# Sidebar code template
SIDEBAR_TEMPLATE_EN = '''
```js
// Related articles sidebar
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "%SLUG%", "en"));
```
'''

SIDEBAR_TEMPLATE_FR = '''
```js
// Barre laterale des articles connexes
import {createSidebar} from "../../components/sidebar.js";
const articles = await FileAttachment("../../articles.json").json();
display(createSidebar(articles, "%SLUG%", "fr"));
```
'''

def has_sidebar(content):
    """Check if file already has sidebar code."""
    return "createSidebar" in content

def add_sidebar_to_file(filepath, slug, lang):
    """Add sidebar code to an article file."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Skip if already has sidebar
    if has_sidebar(content):
        return False

    # Select template based on language
    template = SIDEBAR_TEMPLATE_EN if lang == "en" else SIDEBAR_TEMPLATE_FR
    sidebar_code = template.replace("%SLUG%", slug)

    # Add sidebar code at the end
    new_content = content.rstrip() + "\n" + sidebar_code

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

    return True

def process_articles(docs_dir, lang):
    """Process all articles in a language directory."""
    lang_dir = os.path.join(docs_dir, lang)

    if not os.path.exists(lang_dir):
        print(f"Directory not found: {lang_dir}")
        return 0

    # Skip these directories
    skip_dirs = {'explore', 'archive', 'about'}

    count = 0
    for entry in sorted(os.listdir(lang_dir)):
        entry_path = os.path.join(lang_dir, entry)

        # Skip non-directories and special directories
        if not os.path.isdir(entry_path) or entry in skip_dirs:
            continue

        index_path = os.path.join(entry_path, "index.md")
        if os.path.exists(index_path):
            slug = entry
            if add_sidebar_to_file(index_path, slug, lang):
                print(f"  Added sidebar: {lang}/{slug}/")
                count += 1
            else:
                print(f"  Skipped (already has sidebar): {lang}/{slug}/")

    return count

def main():
    docs_dir = os.path.join(os.path.dirname(os.path.dirname(__file__)), "docs")

    print("Adding related articles sidebar to articles...\n")

    print("Processing English articles:")
    en_count = process_articles(docs_dir, "en")
    print(f"  Total: {en_count} articles updated\n")

    print("Processing French articles:")
    fr_count = process_articles(docs_dir, "fr")
    print(f"  Total: {fr_count} articles updated\n")

    print(f"Done! Updated {en_count + fr_count} articles total.")

if __name__ == "__main__":
    main()
