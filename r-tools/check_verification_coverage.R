# The D-AI-LY: Verification Coverage Checker
# Audits that all articles have corresponding JSON verification files
#
# USAGE:
#   Rscript r-tools/check_verification_coverage.R
#
# EXIT CODES:
#   0 = All articles have verification JSON
#   1 = Some articles missing verification JSON

library(jsonlite)

# Configuration
articles_dir <- "docs/en"
output_dir <- "output"

# Known JSON file mappings (indicator slug pattern → JSON file)
json_mappings <- list(
  "cpi-" = "data_18_10_0004_enhanced.json",
  "consumer-price" = "data_18_10_0004_enhanced.json",
  "employment-" = "lfs_real.json",
  "labour-force" = "lfs_real.json",
  "lfs-" = "lfs_real.json",
  "gdp-" = "gdp_real.json",
  "gross-domestic" = "gdp_real.json",
  "retail-" = "retail_real.json",
  "retail-trade" = "retail_real.json",
  "trade-" = "trade_real.json",
  "merchandise-trade" = "trade_real.json",
  "international-trade" = "trade_real.json",
  "building-permits" = "building_permits.json",
  "airline-" = "airline.json",
  "air-passenger" = "airline.json",
  "nhpi-" = "nhpi.json",
  "new-housing-price" = "nhpi.json",
  "housing-starts" = "housing_starts.json",
  "wholesale-" = "wholesale.json",
  "wholesale-trade" = "wholesale.json",
  "manufacturing-" = "manufacturing_sales.json",
  "manufacturing-sales" = "manufacturing_sales.json",
  "food-services" = "food_services.json",
  "industrial-product-price" = "ippi.json",
  "ippi-" = "ippi.json",
  "raw-materials-price" = "rmpi.json",
  "rmpi-" = "rmpi.json",
  "electricity-" = "electricity.json",
  "electric-power" = "electricity.json",
  "ei-claims" = "ei_claims.json",
  "employment-insurance" = "ei_claims.json"
)

# Find all article directories
article_dirs <- list.dirs(articles_dir, recursive = FALSE, full.names = TRUE)

# Filter to actual articles (have index.md)
articles <- sapply(article_dirs, function(d) {
  index_file <- file.path(d, "index.md")
  if (file.exists(index_file)) {
    return(basename(d))
  }
  return(NA)
})
articles <- articles[!is.na(articles)]

# Skip non-article pages
skip_patterns <- c("explore", "about", "index")
articles <- articles[!grepl(paste(skip_patterns, collapse = "|"), articles)]

cat("Checking verification JSON coverage for", length(articles), "articles...\n\n")

# Check each article
missing_json <- c()
found_json <- c()
unknown_mapping <- c()

for (article in articles) {
  # Find matching JSON
  matched <- FALSE
  for (pattern in names(json_mappings)) {
    if (grepl(pattern, article, ignore.case = TRUE)) {
      json_file <- json_mappings[[pattern]]
      json_path <- file.path(output_dir, json_file)

      if (file.exists(json_path)) {
        found_json <- c(found_json, article)
        matched <- TRUE
        break
      } else {
        missing_json <- c(missing_json, paste0(article, " -> ", json_file))
        matched <- TRUE
        break
      }
    }
  }

  if (!matched) {
    unknown_mapping <- c(unknown_mapping, article)
  }
}

# Report results
cat("=== VERIFICATION COVERAGE REPORT ===\n\n")

cat("VERIFIED (JSON exists):", length(found_json), "\n")
if (length(found_json) > 0 && length(found_json) <= 20) {
  for (a in found_json) cat("  ✓", a, "\n")
} else if (length(found_json) > 20) {
  cat("  (", length(found_json), "articles - too many to list)\n")
}

cat("\nMISSING JSON:", length(missing_json), "\n")
if (length(missing_json) > 0) {
  for (m in missing_json) cat("  ✗", m, "\n")
}

cat("\nNO MAPPING DEFINED:", length(unknown_mapping), "\n")
if (length(unknown_mapping) > 0) {
  for (u in unknown_mapping) cat("  ?", u, "\n")
}

cat("\n=== SUMMARY ===\n")
cat("Total articles:", length(articles), "\n")
cat("With verification JSON:", length(found_json), "\n")
cat("Missing JSON file:", length(missing_json), "\n")
cat("No mapping defined:", length(unknown_mapping), "\n")

coverage_pct <- round(length(found_json) / length(articles) * 100, 1)
cat("\nVerification coverage:", coverage_pct, "%\n")

# Exit with error if not 100% covered
if (length(missing_json) > 0 || length(unknown_mapping) > 0) {
  cat("\n⚠️  Some articles lack verification JSON. Run data fetches to create missing files.\n")
  quit(status = 1)
} else {
  cat("\n✓ All articles have verification JSON coverage.\n")
  quit(status = 0)
}
