# The D-AI-LY: Enhanced CANSIM Data Fetcher
# Fetches comprehensive data including metadata, footnotes, and sub-series breakdowns
# Uses cansim package caching for efficiency

library(cansim)
library(dplyr)
library(tidyr)
library(jsonlite)

# =============================================================================
# CACHING CONFIGURATION
# =============================================================================
# Set up persistent cache to avoid repeated downloads
# Cache persists across R sessions when install=TRUE
cache_path <- file.path(dirname(getwd()), "the-daily", "cache")
if (!dir.exists(cache_path)) {
  dir.create(cache_path, recursive = TRUE)
}

# Set cache path (only needs to be done once per machine, but safe to repeat)
tryCatch({
  set_cansim_cache_path(cache_path)
  cat("Using cache directory:", cache_path, "\n")
}, error = function(e) {
  cat("Note: Could not set cache path, using session cache\n")
})

# =============================================================================
# COMMAND LINE ARGUMENTS
# =============================================================================
args <- commandArgs(trailingOnly = TRUE)
table_number <- if (length(args) > 0) args[1] else "18-10-0004"
output_dir <- if (length(args) > 1) args[2] else "output"
# Use --refresh flag to force re-download
force_refresh <- "--refresh" %in% args

cat("Fetching CANSIM table:", table_number, "\n")
if (force_refresh) cat("Force refresh enabled\n")

# Create output directory if needed
dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

# Get table metadata (overview)
cat("Fetching metadata...\n")
table_info <- get_cansim_table_info(table_number)
cube_meta <- tryCatch(
  get_cansim_cube_metadata(table_number, type = "overview"),
  error = function(e) NULL
)

# Get footnotes/notes
cube_notes <- tryCatch(
  get_cansim_cube_metadata(table_number, type = "notes"),
  error = function(e) NULL
)

# Get dimension members
cube_members <- tryCatch(
  get_cansim_cube_metadata(table_number, type = "members"),
  error = function(e) NULL
)

cat("Table title:", table_info$`Cube Title`, "\n")

# Build StatCan URLs
naked_table <- gsub("-", "", table_number)
statcan_urls <- list(
  table_viewer = paste0("https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=", naked_table, "01"),
  csv_download = paste0("https://www150.statcan.gc.ca/n1/tbl/csv/", naked_table, "-eng.zip"),
  data_portal = paste0("https://www150.statcan.gc.ca/n1/daily-quotidien/", format(Sys.Date(), "%y%m%d"), "/dq", format(Sys.Date(), "%y%m%d"), "-eng.htm")
)

# Extract additional metadata from cube_meta
cube_metadata <- list()
if (!is.null(cube_meta) && nrow(cube_meta) > 0) {
  cube_metadata <- list(
    cansim_id = cube_meta$cansimId[1],
    product_id = cube_meta$productId[1],
    start_date = cube_meta$cubeStartDate[1],
    end_date = cube_meta$cubeEndDate[1],
    release_time = as.character(cube_meta$releaseTime[1]),
    num_series = cube_meta$nbSeriesCube[1],
    subject_code = cube_meta$subjectCode[1],
    survey_code = cube_meta$surveyCode[1],
    archive_status = cube_meta$archiveStatusEn[1]
  )
  cat("Legacy CANSIM ID:", cube_metadata$cansim_id, "\n")
  cat("Release time:", cube_metadata$release_time, "\n")
  cat("Survey code:", cube_metadata$survey_code, "\n")
}

# =============================================================================
# DATA FETCHING (with caching and auto-refresh)
# =============================================================================
# Use get_cansim_connection for large tables (parquet-based, lazy evaluation)
# Falls back to get_cansim for smaller tables or if connection fails

cat("Downloading data...\n")

# Determine refresh strategy
refresh_mode <- if (force_refresh) TRUE else "auto"

# Try connection-based access first (more efficient for large tables)
data <- tryCatch({
  conn <- get_cansim_connection(table_number, refresh = refresh_mode)
  cat("Using cached parquet connection\n")
  # Collect and normalize the data
  result <- collect_and_normalize(conn)
  # Disconnect to free resources
  tryCatch(disconnect_cansim_sqlite(table_number), error = function(e) NULL)
  result
}, error = function(e) {
  cat("Connection method unavailable, using direct fetch\n")
  get_cansim(table_number)
})

cat("Rows downloaded:", nrow(data), "\n")

# Show cache status
cached_tables <- tryCatch(list_cansim_cached_tables(), error = function(e) NULL)
if (!is.null(cached_tables) && nrow(cached_tables) > 0) {
  cat("Cached tables available:", nrow(cached_tables), "\n")
}

# Get unique dimensions to understand the table structure
dimension_cols <- setdiff(
  names(data),
  c("REF_DATE", "GEO", "DGUID", "UOM", "UOM_ID", "SCALAR_FACTOR",
    "SCALAR_ID", "VECTOR", "COORDINATE", "VALUE", "STATUS",
    "SYMBOL", "TERMINATED", "DECIMALS", "val_norm", "Date")
)

cat("\nDimensions:", paste(dimension_cols, collapse = ", "), "\n")

# Determine table type and extract appropriate series
if ("Products and product groups" %in% names(data)) {
  # CPI table structure
  cat("Detected: CPI table\n")
  series_name <- "Consumer Price Index"

  # Main series: All-items, Canada
  main_series <- data %>%
    filter(
      GEO == "Canada",
      `Products and product groups` == "All-items"
    ) %>%
    arrange(Date)

  # Sub-series: Major CPI components
  major_components <- c(
    "Food",
    "Shelter",
    "Household operations, furnishings and equipment",
    "Clothing and footwear",
    "Transportation",
    "Health and personal care",
    "Recreation, education and reading",
    "Alcoholic beverages, tobacco products and recreational cannabis"
  )

  sub_series <- data %>%
    filter(
      GEO == "Canada",
      `Products and product groups` %in% major_components
    ) %>%
    arrange(`Products and product groups`, Date)

  # Provincial breakdown
  provinces <- c("Ontario", "Quebec", "British Columbia", "Alberta",
                 "Manitoba", "Saskatchewan", "Nova Scotia",
                 "New Brunswick", "Newfoundland and Labrador",
                 "Prince Edward Island")

  provincial_series <- data %>%
    filter(
      GEO %in% provinces,
      `Products and product groups` == "All-items"
    ) %>%
    arrange(GEO, Date)

  breakdown_dimension <- "Products and product groups"

} else if ("North American Industry Classification System (NAICS)" %in% names(data)) {
  # Retail/industry table structure
  cat("Detected: NAICS-based table\n")

  if ("Sales, price and volume" %in% names(data)) {
    series_name <- "Retail Sales"

    # Main series: Total retail trade
    main_series <- data %>%
      filter(
        `North American Industry Classification System (NAICS)` == "Retail trade",
        grepl("current prices|Sales$", `Sales, price and volume`, ignore.case = TRUE)
      ) %>%
      arrange(Date)

    # Sub-series: Retail subsectors
    retail_subsectors <- data %>%
      filter(
        !grepl("^Retail trade$", `North American Industry Classification System (NAICS)`),
        grepl("current prices|Sales$", `Sales, price and volume`, ignore.case = TRUE)
      ) %>%
      group_by(`North American Industry Classification System (NAICS)`) %>%
      filter(n() > 12) %>%  # Only include series with enough history
      ungroup() %>%
      arrange(`North American Industry Classification System (NAICS)`, Date)

    sub_series <- retail_subsectors
    breakdown_dimension <- "North American Industry Classification System (NAICS)"
    provincial_series <- NULL  # Could add if GEO varies

  } else {
    series_name <- "Economic Indicator"
    main_series <- data %>%
      filter(grepl("Total|All|^Retail trade$", `North American Industry Classification System (NAICS)`, ignore.case = TRUE))
    sub_series <- NULL
    provincial_series <- NULL
    breakdown_dimension <- NULL
  }

} else if ("Labour force characteristics" %in% names(data) ||
           any(grepl("Employment|Unemployment", names(data)))) {
  # Labour force table
  cat("Detected: Labour force table\n")
  series_name <- "Labour Force"

  char_col <- names(data)[grepl("Labour force|characteristics", names(data), ignore.case = TRUE)][1]

  if (!is.null(char_col) && !is.na(char_col)) {
    main_series <- data %>%
      filter(
        GEO == "Canada",
        grepl("Unemployment rate", .data[[char_col]], ignore.case = TRUE)
      ) %>%
      arrange(Date)

    # Sub-series: Other labour force characteristics
    sub_series <- data %>%
      filter(
        GEO == "Canada",
        grepl("Employment|Participation rate|Employment rate", .data[[char_col]], ignore.case = TRUE)
      ) %>%
      arrange(.data[[char_col]], Date)

    breakdown_dimension <- char_col
  } else {
    main_series <- data %>% filter(GEO == "Canada")
    sub_series <- NULL
    breakdown_dimension <- NULL
  }

  provincial_series <- NULL

} else if ("Principal statistics" %in% names(data) ||
           grepl("Manufacturers|Manufacturing", table_info$`Cube Title`, ignore.case = TRUE)) {
  # Manufacturing table structure (e.g., 16-10-0047)
  cat("Detected: Manufacturing table\n")
  series_name <- "Manufacturing Sales"

  naics_col <- names(data)[grepl("NAICS|Industry", names(data), ignore.case = TRUE)][1]
  stats_col <- names(data)[grepl("Principal statistics|Operating|Statistic", names(data), ignore.case = TRUE)][1]

  if (!is.null(naics_col) && !is.na(naics_col)) {
    # Main series: Total manufacturing, Sales of goods manufactured
    main_series <- data %>%
      filter(
        grepl("Manufacturing$|^Total, all|All industries", .data[[naics_col]], ignore.case = TRUE),
        grepl("Sales of goods|Total sales|Sales$", .data[[stats_col]], ignore.case = TRUE)
      ) %>%
      arrange(Date)

    # If no match, try broader filter
    if (nrow(main_series) == 0) {
      main_series <- data %>%
        filter(grepl("Manufacturing|Total", .data[[naics_col]], ignore.case = TRUE)) %>%
        slice(1:1000) %>%  # Limit to avoid memory issues
        arrange(Date)
    }

    # Sub-series: Major manufacturing subsectors
    sub_series <- data %>%
      filter(
        !grepl("Manufacturing$|^Total|All industries", .data[[naics_col]], ignore.case = TRUE),
        grepl("Sales of goods|Total sales|Sales$", .data[[stats_col]], ignore.case = TRUE)
      ) %>%
      group_by(.data[[naics_col]]) %>%
      filter(n() > 12) %>%
      ungroup() %>%
      arrange(.data[[naics_col]], Date)

    breakdown_dimension <- naics_col
  } else {
    main_series <- data %>%
      filter(GEO == "Canada" | is.na(GEO))
    sub_series <- NULL
    breakdown_dimension <- NULL
  }

  provincial_series <- NULL

} else {
  # Generic: take Canada-level data
  cat("Detected: Generic table\n")
  main_series <- data %>%
    filter(GEO == "Canada" | grepl("Canada", GEO, ignore.case = TRUE))
  series_name <- gsub(",.*", "", table_info$`Cube Title`)
  sub_series <- NULL
  provincial_series <- NULL
  breakdown_dimension <- NULL
}

# Process main series
process_series <- function(df) {
  df %>%
    arrange(Date) %>%
    select(Date, REF_DATE, GEO, VALUE, val_norm) %>%
    filter(!is.na(VALUE)) %>%
    mutate(
      year = as.integer(format(Date, "%Y")),
      month = as.integer(format(Date, "%m")),
      prev_value = lag(VALUE, 1),
      yoy_value = lag(VALUE, 12),
      mom_change = VALUE - prev_value,
      mom_pct_change = round((VALUE - prev_value) / prev_value * 100, 2),
      yoy_change = VALUE - yoy_value,
      yoy_pct_change = round((VALUE - yoy_value) / yoy_value * 100, 2)
    )
}

main_processed <- process_series(main_series)

cat("\nMain series observations:", nrow(main_processed), "\n")

# Get the latest data point
latest <- main_processed %>%
  filter(!is.na(VALUE)) %>%
  tail(1)

# Get comparison data
previous_month <- main_processed %>%
  filter(!is.na(VALUE)) %>%
  tail(2) %>%
  head(1)

same_month_last_year <- main_processed %>%
  filter(
    year == latest$year - 1,
    month == latest$month
  )

# Process sub-series for table data
process_subseries_table <- function(df, dim_col, latest_date) {
  if (is.null(df) || nrow(df) == 0) return(NULL)

  # Get latest values for each category
  df %>%
    filter(Date == latest_date) %>%
    group_by(!!sym(dim_col)) %>%
    slice(1) %>%
    ungroup() %>%
    mutate(
      category = !!sym(dim_col)
    ) %>%
    select(category, value = VALUE)
}

# Process sub-series with changes
process_subseries_changes <- function(df, dim_col, latest_date) {
  if (is.null(df) || nrow(df) == 0) return(NULL)

  df %>%
    group_by(!!sym(dim_col)) %>%
    arrange(Date) %>%
    mutate(
      yoy_value = lag(VALUE, 12),
      mom_value = lag(VALUE, 1),
      yoy_pct_change = round((VALUE - yoy_value) / yoy_value * 100, 2),
      mom_pct_change = round((VALUE - mom_value) / mom_value * 100, 2)
    ) %>%
    filter(Date == latest_date) %>%
    ungroup() %>%
    select(
      category = !!sym(dim_col),
      value = VALUE,
      mom_pct_change,
      yoy_pct_change
    ) %>%
    arrange(desc(abs(yoy_pct_change)))
}

# Build sub-series data
subseries_data <- NULL
if (!is.null(sub_series) && !is.null(breakdown_dimension) && nrow(sub_series) > 0) {
  subseries_data <- process_subseries_changes(sub_series, breakdown_dimension, latest$Date)
  cat("Sub-series categories:", nrow(subseries_data), "\n")
}

# Build provincial data
provincial_data <- NULL
if (!is.null(provincial_series) && nrow(provincial_series) > 0) {
  provincial_data <- process_subseries_changes(provincial_series, "GEO", latest$Date)
  cat("Provincial series:", nrow(provincial_data), "\n")
}

# Extract definitions from footnotes
definitions <- NULL
footnotes_list <- NULL
if (!is.null(cube_notes) && nrow(cube_notes) > 0) {
  # Find the footnote text column (could be 'footnote', 'footnotesEn', 'footnotesFr')
  footnote_col <- intersect(names(cube_notes), c("footnote", "footnotesEn", "footnotesFr"))[1]
  if (!is.na(footnote_col)) {
    # Table-level notes (dimensionPositionId == 0, memberId == 0)
    table_notes <- cube_notes %>%
      filter(dimensionPositionId == "0", memberId == "0") %>%
      select(id = footnoteId, text = all_of(footnote_col)) %>%
      distinct()

    if (nrow(table_notes) > 0) {
      footnotes_list <- as.list(table_notes$text)
      cat("Table-level footnotes found:", length(footnotes_list), "\n")
    }

    # All unique definitions
    definitions <- cube_notes %>%
      select(all_of(footnote_col)) %>%
      distinct() %>%
      pull(!!sym(footnote_col))
    cat("Total definitions/notes found:", length(definitions), "\n")
  }
}

# =============================================================================
# DATA VALIDATION
# =============================================================================
cat("\n=== Running Data Validation ===\n")

validation_results <- list(
  passed = TRUE,
  warnings = list(),
  errors = list()
)

# 1. Data freshness check
# Most monthly tables should have data within 2-3 months of current date
validate_freshness <- function(latest_date, max_lag_months = 3) {
  if (is.null(latest_date) || is.na(latest_date)) {
    return(list(passed = FALSE, message = "No valid latest date found"))
  }

  today <- Sys.Date()
  latest <- as.Date(latest_date)
  lag_months <- as.numeric(difftime(today, latest, units = "days")) / 30

  if (lag_months > max_lag_months) {
    return(list(
      passed = FALSE,
      message = sprintf("Data is %.1f months old (max allowed: %d)", lag_months, max_lag_months),
      lag_months = round(lag_months, 1)
    ))
  }

  return(list(passed = TRUE, message = "Data freshness OK", lag_months = round(lag_months, 1)))
}

freshness_check <- validate_freshness(latest$Date)
if (!freshness_check$passed) {
  validation_results$warnings <- c(validation_results$warnings, list(freshness = freshness_check$message))
  cat("WARNING:", freshness_check$message, "\n")
} else {
  cat("Freshness check:", freshness_check$message, "(lag:", freshness_check$lag_months, "months)\n")
}

# 2. Time series continuity check (detect gaps)
validate_continuity <- function(df, expected_freq = "monthly") {
  if (is.null(df) || nrow(df) < 2) {
    return(list(passed = TRUE, message = "Not enough data to check continuity", gaps = list()))
  }

  dates <- sort(unique(df$Date))
  gaps <- list()

  for (i in 2:length(dates)) {
    diff_days <- as.numeric(difftime(dates[i], dates[i-1], units = "days"))

    # For monthly data, expect ~28-31 days between observations
    if (expected_freq == "monthly" && diff_days > 45) {
      gaps <- c(gaps, list(list(
        from = as.character(dates[i-1]),
        to = as.character(dates[i]),
        days = diff_days
      )))
    }
  }

  if (length(gaps) > 0) {
    return(list(
      passed = FALSE,
      message = sprintf("Found %d gap(s) in time series", length(gaps)),
      gaps = gaps
    ))
  }

  return(list(passed = TRUE, message = "No gaps detected", gaps = list()))
}

continuity_check <- validate_continuity(main_processed)
if (!continuity_check$passed) {
  validation_results$warnings <- c(validation_results$warnings, list(continuity = continuity_check$message))
  cat("WARNING:", continuity_check$message, "\n")
} else {
  cat("Continuity check:", continuity_check$message, "\n")
}

# 3. Outlier detection (using 3 standard deviations)
validate_outliers <- function(df, value_col = "VALUE", threshold = 3) {
  if (is.null(df) || nrow(df) < 10) {
    return(list(passed = TRUE, message = "Not enough data for outlier detection", outliers = list()))
  }

  values <- df[[value_col]]
  values <- values[!is.na(values)]

  if (length(values) < 10) {
    return(list(passed = TRUE, message = "Not enough valid values", outliers = list()))
  }

  mean_val <- mean(values)
  sd_val <- sd(values)

  # For percentage changes, check those too
  if ("mom_pct_change" %in% names(df)) {
    pct_changes <- df$mom_pct_change[!is.na(df$mom_pct_change)]
    mean_pct <- mean(pct_changes)
    sd_pct <- sd(pct_changes)

    outlier_pct <- df %>%
      filter(!is.na(mom_pct_change)) %>%
      filter(abs(mom_pct_change - mean_pct) > threshold * sd_pct)

    if (nrow(outlier_pct) > 0) {
      return(list(
        passed = FALSE,
        message = sprintf("Found %d unusual month-over-month changes", nrow(outlier_pct)),
        outliers = outlier_pct %>%
          select(Date, REF_DATE, VALUE, mom_pct_change) %>%
          mutate(Date = as.character(Date)) %>%
          as.list()
      ))
    }
  }

  return(list(passed = TRUE, message = "No outliers detected", outliers = list()))
}

outlier_check <- validate_outliers(main_processed)
if (!outlier_check$passed) {
  validation_results$warnings <- c(validation_results$warnings, list(outliers = outlier_check$message))
  cat("WARNING:", outlier_check$message, "\n")
} else {
  cat("Outlier check:", outlier_check$message, "\n")
}

# 4. Required fields validation
validate_required_fields <- function(latest_row) {
  missing_fields <- c()

  if (is.null(latest_row$VALUE) || is.na(latest_row$VALUE)) {
    missing_fields <- c(missing_fields, "VALUE")
  }
  if (is.null(latest_row$REF_DATE) || is.na(latest_row$REF_DATE)) {
    missing_fields <- c(missing_fields, "REF_DATE")
  }
  if (is.null(latest_row$mom_pct_change) || is.na(latest_row$mom_pct_change)) {
    missing_fields <- c(missing_fields, "mom_pct_change")
  }

  if (length(missing_fields) > 0) {
    return(list(
      passed = FALSE,
      message = paste("Missing required fields:", paste(missing_fields, collapse = ", ")),
      missing = missing_fields
    ))
  }

  return(list(passed = TRUE, message = "All required fields present", missing = list()))
}

required_check <- validate_required_fields(latest)
if (!required_check$passed) {
  validation_results$errors <- c(validation_results$errors, list(required = required_check$message))
  validation_results$passed <- FALSE
  cat("ERROR:", required_check$message, "\n")
} else {
  cat("Required fields check:", required_check$message, "\n")
}

# 5. Value range validation (sanity checks)
validate_value_ranges <- function(latest_row, series_type) {
  issues <- c()

  # For CPI, values should be roughly 100-200 (2002=100 base)
  if (series_type == "Consumer Price Index") {
    if (!is.na(latest_row$VALUE) && (latest_row$VALUE < 50 || latest_row$VALUE > 300)) {
      issues <- c(issues, sprintf("CPI value %.1f outside expected range (50-300)", latest_row$VALUE))
    }
  }

  # MoM changes typically shouldn't exceed ±10% for most economic indicators
  if (!is.na(latest_row$mom_pct_change) && abs(latest_row$mom_pct_change) > 10) {
    issues <- c(issues, sprintf("MoM change %.2f%% seems unusually large", latest_row$mom_pct_change))
  }

  # YoY changes typically shouldn't exceed ±50%
  if (!is.na(latest_row$yoy_pct_change) && abs(latest_row$yoy_pct_change) > 50) {
    issues <- c(issues, sprintf("YoY change %.2f%% seems unusually large", latest_row$yoy_pct_change))
  }

  if (length(issues) > 0) {
    return(list(passed = FALSE, message = paste(issues, collapse = "; "), issues = issues))
  }

  return(list(passed = TRUE, message = "Value ranges OK", issues = list()))
}

range_check <- validate_value_ranges(latest, series_name)
if (!range_check$passed) {
  validation_results$warnings <- c(validation_results$warnings, list(ranges = range_check$message))
  cat("WARNING:", range_check$message, "\n")
} else {
  cat("Value ranges check:", range_check$message, "\n")
}

# Update overall validation status
if (length(validation_results$errors) > 0) {
  validation_results$passed <- FALSE
}

cat("\nValidation result:", if (validation_results$passed) "PASSED" else "FAILED/WARNINGS", "\n")
if (length(validation_results$warnings) > 0) {
  cat("Warnings:", length(validation_results$warnings), "\n")
}
if (length(validation_results$errors) > 0) {
  cat("Errors:", length(validation_results$errors), "\n")
}

# Build comprehensive output structure
output <- list(
  metadata = list(
    table_number = table_number,
    table_title = table_info$`Cube Title`,
    series_name = series_name,
    frequency = table_info$Frequency,
    fetched_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
    reference_period = latest$REF_DATE,
    start_period = main_processed$REF_DATE[1],
    end_period = latest$REF_DATE,
    dimensions = dimension_cols,
    breakdown_dimension = breakdown_dimension,
    # Additional metadata
    cansim_id = cube_metadata$cansim_id,
    release_time = cube_metadata$release_time,
    subject_code = cube_metadata$subject_code,
    survey_code = cube_metadata$survey_code,
    num_series = cube_metadata$num_series,
    data_start_date = cube_metadata$start_date,
    data_end_date = cube_metadata$end_date
  ),

  # StatCan URLs for linking
  urls = statcan_urls,

  latest = list(
    date = as.character(latest$Date),
    ref_date = latest$REF_DATE,
    value = latest$VALUE,
    mom_change = latest$mom_change,
    mom_pct_change = latest$mom_pct_change,
    yoy_change = latest$yoy_change,
    yoy_pct_change = latest$yoy_pct_change
  ),

  comparison = list(
    previous_period = list(
      date = as.character(previous_month$Date),
      ref_date = previous_month$REF_DATE,
      value = previous_month$VALUE
    ),
    year_ago = if (nrow(same_month_last_year) > 0) {
      list(
        date = as.character(same_month_last_year$Date[1]),
        ref_date = same_month_last_year$REF_DATE[1],
        value = same_month_last_year$VALUE[1]
      )
    } else NULL
  ),

  # Time series for main chart (last 24 months)
  time_series = main_processed %>%
    tail(24) %>%
    select(date = Date, ref_date = REF_DATE, value = VALUE,
           mom_pct_change, yoy_pct_change) %>%
    mutate(date = as.character(date)),

  # Sub-series breakdown (components/categories)
  subseries = if (!is.null(subseries_data) && nrow(subseries_data) > 0) {
    subseries_data %>%
      head(10) %>%  # Top 10 categories
      as.list()
  } else NULL,

  # Provincial/geographic breakdown
  provincial = if (!is.null(provincial_data) && nrow(provincial_data) > 0) {
    provincial_data %>%
      as.list()
  } else NULL,

  # Definitions and notes
  definitions = definitions,

  # Validation results
  validation = list(
    passed = validation_results$passed,
    warnings = validation_results$warnings,
    errors = validation_results$errors,
    checks = list(
      freshness = freshness_check,
      continuity = continuity_check,
      outliers = outlier_check,
      required_fields = required_check,
      value_ranges = range_check
    )
  )
)

# Write output
output_file <- file.path(output_dir, paste0("data_", gsub("-", "_", table_number), "_enhanced.json"))
write_json(output, output_file, pretty = TRUE, auto_unbox = TRUE)

cat("\nOutput written to:", output_file, "\n")

# Print summary
cat("\n=== Data Summary ===\n")
cat(sprintf("Series: %s\n", series_name))
cat(sprintf("Latest period: %s\n", latest$REF_DATE))
cat(sprintf("Latest value: %.1f\n", latest$VALUE))
cat(sprintf("Month-over-month change: %.2f%%\n", latest$mom_pct_change))
if (!is.na(latest$yoy_pct_change)) {
  cat(sprintf("Year-over-year change: %.2f%%\n", latest$yoy_pct_change))
}
if (!is.null(subseries_data) && nrow(subseries_data) > 0) {
  cat(sprintf("\nSub-series breakdown: %d categories\n", nrow(subseries_data)))
}
if (!is.null(provincial_data) && nrow(provincial_data) > 0) {
  cat(sprintf("Provincial breakdown: %d provinces\n", nrow(provincial_data)))
}
