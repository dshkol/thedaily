#!/usr/bin/env node
/**
 * Post-build script to convert relative asset paths to absolute paths.
 * Fixes Safari compatibility issues with proxied subdirectory deployments.
 *
 * Converts: href="./_import/..." and src="./_import/..."
 * To:       href="/thedaily/_import/..." and src="/thedaily/_import/..."
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DIST_DIR = path.join(__dirname, '..', 'dist');
const BASE_PATH = '/thedaily';

function processHtmlFile(filePath) {
  let content = fs.readFileSync(filePath, 'utf8');
  let modified = false;

  // Replace relative asset paths with absolute paths
  // Matches: href="./_something", href="../../_something", etc.
  const patterns = [
    // Match ./_something
    { regex: /href="\.\/(_[^"]+)"/g, replacement: `href="${BASE_PATH}/$1"` },
    { regex: /src="\.\/(_[^"]+)"/g, replacement: `src="${BASE_PATH}/$1"` },
    // Match ../_something or ../../_something etc.
    { regex: /href="(?:\.\.\/)+(_[^"]+)"/g, replacement: `href="${BASE_PATH}/$1"` },
    { regex: /src="(?:\.\.\/)+(_[^"]+)"/g, replacement: `src="${BASE_PATH}/$1"` },
    // Match JS imports: from "./_something" or from "../../_something"
    { regex: /from "\.\/(_[^"]+)"/g, replacement: `from "${BASE_PATH}/$1"` },
    { regex: /from "(?:\.\.\/)+(_[^"]+)"/g, replacement: `from "${BASE_PATH}/$1"` },
    // Match dynamic imports: import("./_something") or import("../../_something")
    { regex: /import\("\.\/(_[^"]+)"\)/g, replacement: `import("${BASE_PATH}/$1")` },
    { regex: /import\("(?:\.\.\/)+(_[^"]+)"\)/g, replacement: `import("${BASE_PATH}/$1")` },
  ];

  for (const { regex, replacement } of patterns) {
    const newContent = content.replace(regex, replacement);
    if (newContent !== content) {
      content = newContent;
      modified = true;
    }
  }

  if (modified) {
    fs.writeFileSync(filePath, content);
    console.log(`Fixed paths in: ${path.relative(DIST_DIR, filePath)}`);
  }
}

function processDirectory(dir) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });

  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);

    if (entry.isDirectory()) {
      processDirectory(fullPath);
    } else if (entry.name.endsWith('.html')) {
      processHtmlFile(fullPath);
    }
  }
}

console.log('Fixing asset paths for Safari compatibility...');
processDirectory(DIST_DIR);
console.log('Done!');
