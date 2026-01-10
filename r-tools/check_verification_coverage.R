# The D-AI-LY: Verification Coverage Checker
# Reads verification_json from article frontmatter and validates the files exist
#
# USAGE:
#   Rscript r-tools/check_verification_coverage.R
#
# EXIT CODES:
#   0 = All articles have valid verification JSON
#   1 = Some articles missing verification_json field or file not found

# Configuration
articles_dir <- "docs/en"

# Parse YAML frontmatter from markdown file
parse_frontmatter <- function(filepath) {
  lines <- readLines(filepath, warn = FALSE)

  # Find frontmatter boundaries (---)
  fm_markers <- which(lines == "---")
  if (length(fm_markers) < 2) {
    return(list())
  }

  fm_lines <- lines[(fm_markers[1] + 1):(fm_markers[2] - 1)]

  # Simple YAML parsing for key: value pairs
  result <- list()
  for (line in fm_lines) {
    if (grepl(":", line)) {
      parts <- strsplit(line, ":", fixed = TRUE)[[1]]
      if (length(parts) >= 2) {
        key <- trimws(parts[1])
        value <- trimws(paste(parts[-1], collapse = ":"))
        # Remove quotes if present
        value <- gsub("^[\"']|[\"']$", "", value)
        result[[key]] <- value
      }
    }
  }

  return(result)
}

# Find all article directories
article_dirs <- list.dirs(articles_dir, recursive = FALSE, full.names = TRUE)

# Filter to actual articles (have index.md)
articles <- list()
for (dir in article_dirs) {
  index_file <- file.path(dir, "index.md")
  if (file.exists(index_file)) {
    slug <- basename(dir)
    # Skip non-article pages
    if (!grepl("^(explore|about|index)$", slug)) {
      articles[[slug]] <- index_file
    }
  }
}

cat("Checking verification JSON coverage for", length(articles), "articles...\n\n")

# Check each article
has_json <- c()           # Articles with valid verification_json
missing_field <- c()      # Articles without verification_json in frontmatter
file_not_found <- c()     # Articles with verification_json but file doesn't exist

for (slug in names(articles)) {
  filepath <- articles[[slug]]
  frontmatter <- parse_frontmatter(filepath)

  if ("verification_json" %in% names(frontmatter)) {
    json_path <- frontmatter$verification_json

    if (file.exists(json_path)) {
      has_json <- c(has_json, slug)
    } else {
      file_not_found <- c(file_not_found, paste0(slug, " -> ", json_path))
    }
  } else {
    missing_field <- c(missing_field, slug)
  }
}

# Report results
cat("=== VERIFICATION COVERAGE REPORT ===\n\n")

cat("VERIFIED (JSON exists):", length(has_json), "\n")
if (length(has_json) > 0 && length(has_json) <= 20) {
  for (a in has_json) cat("  ✓", a, "\n")
} else if (length(has_json) > 20) {
  cat("  (", length(has_json), "articles - too many to list)\n")
}

cat("\nMISSING FRONTMATTER FIELD:", length(missing_field), "\n")
if (length(missing_field) > 0) {
  if (length(missing_field) <= 30) {
    for (m in missing_field) cat("  ?", m, "\n")
  } else {
    cat("  (", length(missing_field), "articles - too many to list)\n")
    cat("  First 10:", paste(head(missing_field, 10), collapse = ", "), "\n")
  }
}

cat("\nJSON FILE NOT FOUND:", length(file_not_found), "\n")
if (length(file_not_found) > 0) {
  for (f in file_not_found) cat("  ✗", f, "\n")
}

cat("\n=== SUMMARY ===\n")
cat("Total articles:", length(articles), "\n")
cat("With valid verification_json:", length(has_json), "\n")
cat("Missing frontmatter field:", length(missing_field), "\n")
cat("JSON file not found:", length(file_not_found), "\n")

coverage_pct <- round(length(has_json) / length(articles) * 100, 1)
cat("\nVerification coverage:", coverage_pct, "%\n")

# Exit with status based on results
if (length(missing_field) > 0 || length(file_not_found) > 0) {
  cat("\n⚠️  Some articles lack valid verification JSON.\n")
  cat("   Add 'verification_json: output/<file>.json' to article frontmatter.\n")
  quit(status = 1)
} else {
  cat("\n✓ All articles have valid verification JSON.\n")
  quit(status = 0)
}
