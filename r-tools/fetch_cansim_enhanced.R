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
  definitions = definitions
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
