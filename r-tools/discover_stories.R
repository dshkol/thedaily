# The D-AI-LY: Story Discovery Tool
# Find newsworthy data releases and patterns

library(cansim)
library(dplyr)
library(jsonlite)

args <- commandArgs(trailingOnly = TRUE)
mode <- if (length(args) > 0) args[1] else "schedule"
output_dir <- if (length(args) > 1) args[2] else "output"

dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

# =============================================================================
# MODE 1: Release Schedule - What's coming up?
# =============================================================================

get_upcoming_releases <- function(days_ahead = 14) {
  cat("Fetching release schedule...\n")
  schedule <- get_cansim_key_release_schedule()

  upcoming <- schedule %>%
    filter(date >= Sys.Date(), date <= Sys.Date() + days_ahead) %>%
    arrange(date)

  cat("Found", nrow(upcoming), "releases in next", days_ahead, "days\n\n")

  # Map titles to table numbers (approximate mapping)
  table_map <- list(
    "Consumer Price Index" = "18-10-0004",
    "Labour Force Survey" = "14-10-0287",
    "Retail trade" = "20-10-0008",
    "Gross domestic product by industry" = "36-10-0434",
    "Canadian international merchandise trade" = "12-10-0011",
    "Building permits" = "34-10-0066",
    "Monthly Survey of Manufacturing" = "16-10-0048",
    "Wholesale trade" = "20-10-0074",
    "Investment in building construction" = "34-10-0175",
    "Housing starts" = "34-10-0143",
    "Employment Insurance" = "14-10-0005",
    "Job vacancies" = "14-10-0325"
  )

  upcoming <- upcoming %>%
    mutate(
      table_number = sapply(title, function(t) {
        match <- table_map[[t]]
        if (!is.null(match)) match else NA_character_
      })
    )

  return(upcoming)
}

# =============================================================================
# MODE 2: Changed Tables - What just got updated?
# =============================================================================

get_recent_releases <- function(days_back = 1) {
  cat("Fetching recently changed tables...\n")
  changed <- get_cansim_changed_tables(start_date = Sys.Date() - days_back)

  # Convert productId to table number format
  changed <- changed %>%
    mutate(
      table_number = paste0(
        substr(as.character(productId), 1, 2), "-",
        substr(as.character(productId), 3, 4), "-",
        substr(as.character(productId), 5, 8)
      )
    )

  cat("Found", nrow(changed), "tables updated in last", days_back, "day(s)\n\n")
  return(changed)
}

# =============================================================================
# MODE 3: Story Finder - What's interesting in the data?
# =============================================================================

find_data_stories <- function(table_number) {
  cat("Analyzing", table_number, "for story angles...\n")

  # Fetch data
  data <- get_cansim(table_number)
  data <- normalize_cansim_values(data)

  stories <- list()

  # Filter to Canada-level, latest period
  if ("GEO" %in% names(data)) {
    canada_data <- data %>% filter(grepl("Canada", GEO))
  } else {
    canada_data <- data
  }

  # Get the latest date
  latest_date <- max(canada_data$Date, na.rm = TRUE)
  latest_data <- canada_data %>% filter(Date == latest_date)

  # Calculate year-over-year changes
  year_ago_date <- latest_date - 365
  year_ago_data <- canada_data %>%
    filter(Date >= year_ago_date - 30, Date <= year_ago_date + 30)

  # Find extreme values (highest/lowest changes)
  if (nrow(latest_data) > 1) {
    # Group by dimension columns to find outliers
    dim_cols <- setdiff(names(latest_data),
      c("REF_DATE", "GEO", "DGUID", "UOM", "UOM_ID", "SCALAR_FACTOR",
        "SCALAR_ID", "VECTOR", "COORDINATE", "VALUE", "STATUS",
        "SYMBOL", "TERMINATED", "DECIMALS", "val_norm", "Date"))

    if (length(dim_cols) > 0) {
      # Find the dimension with the most variation
      for (dim in dim_cols[1]) {
        by_dim <- latest_data %>%
          group_by(!!sym(dim)) %>%
          summarize(value = mean(VALUE, na.rm = TRUE), .groups = "drop") %>%
          arrange(desc(value))

        if (nrow(by_dim) > 2) {
          stories$top_category <- list(
            dimension = dim,
            category = by_dim[[dim]][1],
            value = by_dim$value[1]
          )
          stories$bottom_category <- list(
            dimension = dim,
            category = by_dim[[dim]][nrow(by_dim)],
            value = by_dim$value[nrow(by_dim)]
          )
        }
      }
    }
  }

  # Check for record values (if we have enough history)
  if (nrow(canada_data) > 24) {
    overall_max <- max(canada_data$VALUE, na.rm = TRUE)
    overall_min <- min(canada_data$VALUE, na.rm = TRUE)
    latest_value <- latest_data$VALUE[1]

    if (!is.na(latest_value)) {
      if (latest_value >= overall_max * 0.98) {
        stories$near_record_high <- TRUE
      }
      if (latest_value <= overall_min * 1.02) {
        stories$near_record_low <- TRUE
      }
    }
  }

  return(stories)
}

# =============================================================================
# MODE 4: Multi-indicator comparisons
# =============================================================================

compare_indicators <- function() {
  cat("Comparing key economic indicators...\n")

  # Key indicators to compare
  indicators <- list(
    cpi = list(table = "18-10-0004", name = "CPI Inflation"),
    unemployment = list(table = "14-10-0287", name = "Unemployment Rate"),
    wages = list(table = "14-10-0206", name = "Average Hourly Wages")
  )

  comparisons <- list()

  for (ind_name in names(indicators)) {
    ind <- indicators[[ind_name]]
    tryCatch({
      info <- get_cansim_table_info(ind$table)
      comparisons[[ind_name]] <- list(
        name = ind$name,
        table = ind$table,
        latest_period = info$`Coverage End Date`
      )
    }, error = function(e) {
      cat("  Could not fetch", ind$name, "\n")
    })
  }

  return(comparisons)
}

# =============================================================================
# Main execution
# =============================================================================

if (mode == "schedule") {
  cat("=== Upcoming Releases ===\n\n")
  releases <- get_upcoming_releases(14)
  print(releases %>% select(date, title, table_number))

  # Save to JSON
  output <- list(
    generated_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
    mode = "schedule",
    releases = releases %>%
      select(date, title, type, table_number) %>%
      mutate(date = as.character(date))
  )

} else if (mode == "changed") {
  cat("=== Recently Updated Tables ===\n\n")
  changed <- get_recent_releases(1)
  print(changed)

  output <- list(
    generated_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
    mode = "changed",
    tables = changed %>% mutate(releaseTime = as.character(releaseTime))
  )

} else if (mode == "compare") {
  cat("=== Indicator Comparison ===\n\n")
  comparison <- compare_indicators()
  print(comparison)

  output <- list(
    generated_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
    mode = "compare",
    indicators = comparison
  )

} else {
  cat("Usage: Rscript discover_stories.R [mode] [output_dir]\n")
  cat("Modes: schedule, changed, compare\n")
  quit(status = 1)
}

output_file <- file.path(output_dir, paste0("discovery_", mode, ".json"))
write_json(output, output_file, pretty = TRUE, auto_unbox = TRUE)
cat("\nOutput written to:", output_file, "\n")
