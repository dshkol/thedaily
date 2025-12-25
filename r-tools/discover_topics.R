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

# Analyze regional variance for a given table
analyze_regional_variance <- function(table_number) {
  cat(sprintf("Analyzing regional variance for %s...\n", table_number))

  tryCatch({
    df <- get_cansim(table_number)

    # Get unique geographies
    geos <- unique(df$GEO)
    provinces <- c("Ontario", "Quebec", "British Columbia", "Alberta",
                   "Manitoba", "Saskatchewan", "Nova Scotia", "New Brunswick",
                   "Newfoundland and Labrador", "Prince Edward Island",
                   "Northwest Territories", "Yukon", "Nunavut")

    has_provinces <- any(geos %in% provinces)
    has_cmas <- any(grepl("Toronto|Vancouver|Montréal|Calgary|Edmonton|Ottawa", geos))
    has_canada <- "Canada" %in% geos

    # Get latest reference date
    latest_date <- max(df$REF_DATE, na.rm = TRUE)

    # Calculate provincial variance if available
    variance_info <- NULL
    if (has_provinces && has_canada) {
      prov_data <- df %>%
        filter(REF_DATE == latest_date) %>%
        filter(GEO %in% provinces) %>%
        group_by(GEO) %>%
        summarise(value = mean(VALUE, na.rm = TRUE), .groups = "drop") %>%
        filter(!is.na(value))

      if (nrow(prov_data) >= 3) {
        canada_val <- df %>%
          filter(REF_DATE == latest_date, GEO == "Canada") %>%
          summarise(value = mean(VALUE, na.rm = TRUE)) %>%
          pull(value)

        variance_info <- list(
          range = max(prov_data$value) - min(prov_data$value),
          leader = prov_data$GEO[which.max(prov_data$value)],
          laggard = prov_data$GEO[which.min(prov_data$value)],
          leader_value = max(prov_data$value),
          laggard_value = min(prov_data$value),
          canada_value = canada_val,
          n_provinces = nrow(prov_data)
        )
      }
    }

    list(
      table = table_number,
      has_provinces = has_provinces,
      has_cmas = has_cmas,
      has_canada = has_canada,
      n_geos = length(geos),
      latest_date = latest_date,
      variance = variance_info,
      sample_geos = head(geos, 10)
    )
  }, error = function(e) {
    list(table = table_number, error = e$message)
  })
}

# Find regional stories across multiple tables
find_regional_stories <- function(table_numbers, min_variance_pct = 10) {
  results <- lapply(table_numbers, function(tbl) {
    info <- analyze_regional_variance(tbl)
    if (!is.null(info$variance)) {
      # Calculate variance as percentage of Canada value
      if (info$variance$canada_value != 0) {
        info$variance_pct <- (info$variance$range / abs(info$variance$canada_value)) * 100
      } else {
        info$variance_pct <- NA
      }
    }
    info
  })

  # Filter to tables with significant regional variance
  regional_stories <- Filter(function(x) {
    !is.null(x$variance) &&
    !is.null(x$variance_pct) &&
    !is.na(x$variance_pct) &&
    x$variance_pct >= min_variance_pct
  }, results)

  # Sort by variance
  regional_stories <- regional_stories[order(
    -sapply(regional_stories, function(x) x$variance_pct)
  )]

  regional_stories
}

# Print regional story results
print_regional_results <- function(results) {
  cat("\n")
  cat("═══════════════════════════════════════════════════════════════════\n")
  cat(sprintf("REGIONAL STORY DISCOVERY - %s\n", Sys.Date()))
  cat("═══════════════════════════════════════════════════════════════════\n\n")

  if (length(results) == 0) {
    cat("No significant regional variance found.\n")
    return()
  }

  for (i in seq_along(results)) {
    r <- results[[i]]
    cat(sprintf("\n%d. TABLE %s (Variance: %.1f%%)\n",
                i, r$table, r$variance_pct))
    cat(sprintf("   Leader: %s (%.1f)\n", r$variance$leader, r$variance$leader_value))
    cat(sprintf("   Laggard: %s (%.1f)\n", r$variance$laggard, r$variance$laggard_value))
    cat(sprintf("   Canada: %.1f\n", r$variance$canada_value))
    cat(sprintf("   Provinces covered: %d\n", r$variance$n_provinces))

    # Suggest story angle
    if (r$variance$leader_value > r$variance$canada_value * 1.1) {
      cat(sprintf("   → Story: \"%s leads with value %.0f%% above national average\"\n",
                  r$variance$leader,
                  (r$variance$leader_value / r$variance$canada_value - 1) * 100))
    }
    if (r$variance$laggard_value < r$variance$canada_value * 0.9) {
      cat(sprintf("   → Story: \"%s lags at %.0f%% below national average\"\n",
                  r$variance$laggard,
                  (1 - r$variance$laggard_value / r$variance$canada_value) * 100))
    }
  }
  cat("\n")
}

# Load configured tables from table_configs.json
load_configured_tables <- function() {
  config_paths <- c(
    "r-tools/table_configs.json",
    "table_configs.json"
  )
  for (p in config_paths) {
    if (file.exists(p)) {
      configs <- jsonlite::fromJSON(p)
      return(names(configs))
    }
  }
  return(c())
}

# Filter discovery to only configured tables
discover_configured_topics <- function(existing_sectors = c(), top_n = 10) {
  configured <- load_configured_tables()
  if (length(configured) == 0) {
    cat("Warning: No table_configs.json found. Showing all tables.\n")
    return(discover_topics(existing_sectors, top_n))
  }

  cat(sprintf("Filtering to %d configured tables...\n", length(configured)))

  # Get standard discovery results
  all_results <- discover_topics(existing_sectors, top_n = 100)

  # Filter to configured tables
  filtered <- all_results %>%
    filter(cansim_table_number %in% configured)

  cat(sprintf("Found %d configured tables with recent data\n", nrow(filtered)))

  # Return top N
  head(filtered, top_n)
}

# Save results to JSON for automation
save_discovery_json <- function(results, output_dir = "output") {
  library(jsonlite)

  dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)
  output_file <- file.path(output_dir, "discovery_results.json")

  json_results <- list(
    discovery_date = as.character(Sys.Date()),
    n_candidates = nrow(results),
    candidates = lapply(1:nrow(results), function(i) {
      row <- results[i, ]
      list(
        rank = i,
        table_number = row$cansim_table_number,
        title = row$cubeTitleEn,
        sector = row$sector,
        data_end_date = as.character(row$cubeEndDate),
        score = row$score,
        score_breakdown = list(
          recency = row$recency,
          diversity = row$diversity,
          interest = row$interest
        )
      )
    }),
    recommendation = if (nrow(results) > 0) {
      list(
        table_number = results$cansim_table_number[1],
        title = results$cubeTitleEn[1],
        sector = results$sector[1],
        score = results$score[1]
      )
    } else NULL
  )

  write_json(json_results, output_file, pretty = TRUE, auto_unbox = TRUE)
  cat(sprintf("Results saved to: %s\n", output_file))
}

# Run if executed directly
if (!interactive()) {
  args <- commandArgs(trailingOnly = TRUE)

  # Parse flags
  output_json <- "--json" %in% args
  configured_only <- "--configured" %in% args
  regional_mode <- "--regional" %in% args
  output_dir <- "output"

  # Check for output directory argument
  for (arg in args) {
    if (grepl("^--output=", arg)) {
      output_dir <- sub("^--output=", "", arg)
    }
  }

  # Filter out flags from args
  sector_args <- args[!grepl("^--", args)]

  if (regional_mode) {
    # Regional analysis mode
    table_args <- sector_args
    if (length(table_args) > 0) {
      tables <- strsplit(table_args[1], ",")[[1]]
      cat(sprintf("Analyzing regional variance for: %s\n",
                  paste(tables, collapse = ", ")))
      results <- find_regional_stories(tables, min_variance_pct = 5)
      print_regional_results(results)
    } else {
      # Default tables for regional analysis
      default_tables <- c("18-10-0205", "34-10-0158", "14-10-0287", "18-10-0004")
      cat("Analyzing regional variance for default tables...\n")
      results <- find_regional_stories(default_tables, min_variance_pct = 5)
      print_regional_results(results)
    }
  } else {
    # Standard topic discovery mode
    existing_sectors <- c()
    if (length(sector_args) > 0) {
      existing_sectors <- strsplit(sector_args[1], ",")[[1]]
      cat(sprintf("Excluding recently covered sectors: %s\n",
                  paste(existing_sectors, collapse = ", ")))
    }

    # Use configured-only discovery if flag set
    if (configured_only) {
      results <- discover_configured_topics(existing_sectors = existing_sectors)
    } else {
      results <- discover_topics(existing_sectors = existing_sectors)
    }

    print_results(results)

    # Save JSON if requested
    if (output_json) {
      save_discovery_json(results, output_dir)
    }
  }
}
