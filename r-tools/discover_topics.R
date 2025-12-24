#!/usr/bin/env Rscript
# Topic Discovery for The D-AI-LY
# Scans CANSIM cubes and ranks candidates for article generation

library(cansim)
library(dplyr)
library(tidyr)

# Configuration
LOOKBACK_DAYS <- 60  # How far back to look for recent data
MIN_SCORE <- 50      # Minimum score to recommend

# Sector classification for diversity scoring
SECTOR_KEYWORDS <- list(
  prices = c("price", "index", "cpi", "cost"),
  labour = c("employment", "labour", "workforce", "job", "wage"),
  trade = c("trade", "retail", "wholesale", "export", "import", "merchandise"),
  housing = c("housing", "dwelling", "residential", "building permit", "starts"),
  production = c("gdp", "manufacturing", "production", "output", "industry"),
  transport = c("aviation", "airline", "passenger", "rail", "vehicle", "transport"),
  finance = c("credit", "investment", "financial", "banking", "debt"),
  demographics = c("population", "migration", "birth", "death", "census")
)

# Classify a cube into a sector based on title
classify_sector <- function(title) {
  title_lower <- tolower(title)
  for (sector in names(SECTOR_KEYWORDS)) {
    if (any(sapply(SECTOR_KEYWORDS[[sector]], function(kw) grepl(kw, title_lower)))) {
      return(sector)
    }
  }
  return("other")
}

# Calculate recency score (0-100)
recency_score <- function(end_date, today = Sys.Date()) {
  days_old <- as.numeric(today - as.Date(end_date))
  # 0 days old = 100, 60 days old = 0
  max(0, 100 - (days_old * 100 / LOOKBACK_DAYS))
}

# Main discovery function
discover_topics <- function(existing_sectors = c(), top_n = 10) {
  cat("Fetching CANSIM cube metadata...\n")
  cubes <- list_cansim_cubes()

  cat(sprintf("Found %d total cubes\n", nrow(cubes)))

  # Filter for recent monthly data
  candidates <- cubes %>%
    filter(frequencyCode == "6") %>%  # Monthly
    filter(!is.na(cubeEndDate)) %>%
    filter(as.Date(cubeEndDate) >= Sys.Date() - LOOKBACK_DAYS) %>%
    mutate(
      sector = sapply(cubeTitleEn, classify_sector),
      recency = sapply(cubeEndDate, recency_score)
    )

  cat(sprintf("Found %d monthly cubes with recent data\n", nrow(candidates)))

  # Calculate diversity score (boost sectors not recently covered)
  candidates <- candidates %>%
    mutate(
      diversity = ifelse(sector %in% existing_sectors, 30, 100)
    )

  # Calculate composite score
  # Weights: recency 25%, diversity 25%, base interest 50% (estimated from sector)
  sector_interest <- c(
    prices = 90,
    labour = 95,
    trade = 70,
    housing = 85,
    production = 75,
    transport = 65,
    finance = 60,
    demographics = 50,
    other = 40
  )

  candidates <- candidates %>%
    mutate(
      interest = sector_interest[sector],
      score = round(0.25 * recency + 0.25 * diversity + 0.50 * interest)
    ) %>%
    arrange(desc(score))

  # Return top candidates
  top_candidates <- candidates %>%
    head(top_n) %>%
    select(
      cansim_table_number,
      cubeTitleEn,
      sector,
      cubeEndDate,
      score,
      recency,
      diversity,
      interest
    )

  return(top_candidates)
}

# Print formatted results
print_results <- function(results) {
  cat("\n")
  cat("═══════════════════════════════════════════════════════════════════\n")
  cat(sprintf("TOPIC DISCOVERY RESULTS - %s\n", Sys.Date()))
  cat("═══════════════════════════════════════════════════════════════════\n\n")

  cat(sprintf("%-4s  %-5s  %-12s  %-12s  %s\n",
              "RANK", "SCORE", "TABLE", "SECTOR", "TITLE"))
  cat(sprintf("%-4s  %-5s  %-12s  %-12s  %s\n",
              "----", "-----", "------------", "------------",
              paste(rep("-", 40), collapse = "")))

  for (i in 1:nrow(results)) {
    row <- results[i, ]
    title <- substr(row$cubeTitleEn, 1, 45)
    cat(sprintf("%-4d  %-5d  %-12s  %-12s  %s\n",
                i, row$score, row$cansim_table_number, row$sector, title))
  }

  cat("\n")
  if (nrow(results) > 0) {
    top <- results[1, ]
    cat(sprintf("TOP RECOMMENDATION: %s (%s)\n",
                top$cansim_table_number, top$cubeTitleEn))
    cat(sprintf("  - Data through: %s\n", top$cubeEndDate))
    cat(sprintf("  - Sector: %s\n", top$sector))
    cat(sprintf("  - Score breakdown: recency=%.0f, diversity=%.0f, interest=%.0f\n",
                top$recency, top$diversity, top$interest))
  }
  cat("\n")
}

# Run if executed directly
if (!interactive()) {
  args <- commandArgs(trailingOnly = TRUE)

  # Parse existing sectors from args (e.g., "prices,labour,trade")
  existing_sectors <- c()
  if (length(args) > 0) {
    existing_sectors <- strsplit(args[1], ",")[[1]]
    cat(sprintf("Excluding recently covered sectors: %s\n",
                paste(existing_sectors, collapse = ", ")))
  }

  results <- discover_topics(existing_sectors = existing_sectors)
  print_results(results)
}
