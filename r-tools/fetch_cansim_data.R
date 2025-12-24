# The D-AI-LY: CANSIM Data Fetcher
# Fetches data from a specified table and exports analysis-ready JSON

library(cansim)
library(dplyr)
library(tidyr)
library(jsonlite)

# Configuration
args <- commandArgs(trailingOnly = TRUE)
table_number <- if (length(args) > 0) args[1] else "18-10-0004"
output_dir <- if (length(args) > 1) args[2] else "output"

cat("Fetching CANSIM table:", table_number, "\n")

# Create output directory if needed
dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

# Get table metadata
table_info <- get_cansim_table_info(table_number)
cat("Table title:", table_info$`Cube Title`, "\n")

# Fetch the data (use connection for large tables)
cat("Downloading data...\n")
data <- get_cansim(table_number)

cat("Rows downloaded:", nrow(data), "\n")
cat("Columns:", paste(names(data), collapse = ", "), "\n\n")

# Get unique dimensions to understand the table structure
cat("Dimensions:\n")
dimension_cols <- setdiff(
  names(data),
  c("REF_DATE", "GEO", "DGUID", "UOM", "UOM_ID", "SCALAR_FACTOR",
    "SCALAR_ID", "VECTOR", "COORDINATE", "VALUE", "STATUS",
    "SYMBOL", "TERMINATED", "DECIMALS", "val_norm", "Date")
)
for (col in dimension_cols) {
  unique_vals <- unique(data[[col]])
  cat(sprintf("  %s: %d unique values\n", col, length(unique_vals)))
  if (length(unique_vals) <= 5) {
    cat("    Values:", paste(head(unique_vals, 5), collapse = ", "), "\n")
  }
}

# Filter data based on table structure
# Try to get Canada-level aggregate data

if ("Products and product groups" %in% names(data)) {
  # CPI table structure
  cat("Detected: CPI table\n")
  analysis_data <- data %>%
    filter(
      GEO == "Canada",
      `Products and product groups` == "All-items"
    )
  series_name <- "Consumer Price Index"

} else if ("North American Industry Classification System (NAICS)" %in% names(data)) {
  # Retail/industry table structure
  cat("Detected: NAICS-based table\n")

  # Check for sales/price/volume dimension
  if ("Sales, price and volume" %in% names(data)) {
    analysis_data <- data %>%
      filter(
        `North American Industry Classification System (NAICS)` == "Retail trade",
        grepl("current prices|Sales$", `Sales, price and volume`, ignore.case = TRUE)
      )
    series_name <- "Retail Sales"
  } else {
    analysis_data <- data %>%
      filter(
        grepl("Total|All|^Retail trade$", `North American Industry Classification System (NAICS)`, ignore.case = TRUE)
      )
    series_name <- "Economic Indicator"
  }

} else if ("Labour force characteristics" %in% names(data) ||
           any(grepl("Employment|Unemployment", names(data)))) {
  # Labour force table
  cat("Detected: Labour force table\n")

  # Try to find unemployment rate or employment
  char_col <- names(data)[grepl("Labour force|characteristics", names(data), ignore.case = TRUE)][1]

  if (!is.null(char_col) && !is.na(char_col)) {
    analysis_data <- data %>%
      filter(
        GEO == "Canada",
        grepl("Unemployment rate|Employment", .data[[char_col]], ignore.case = TRUE)
      ) %>%
      head(1000)  # Limit for processing
  } else {
    analysis_data <- data %>%
      filter(GEO == "Canada")
  }
  series_name <- "Labour Force"

} else {
  # Generic: take Canada-level data
  cat("Detected: Generic table\n")
  analysis_data <- data %>%
    filter(GEO == "Canada" | grepl("Canada", GEO, ignore.case = TRUE))
  series_name <- gsub(",.*", "", table_info$`Cube Title`)
}

# Final processing
analysis_data <- analysis_data %>%
  arrange(Date) %>%
  select(Date, REF_DATE, GEO, VALUE, val_norm) %>%
  filter(!is.na(VALUE)) %>%
  mutate(
    year = as.integer(format(Date, "%Y")),
    month = as.integer(format(Date, "%m"))
  )

cat("\nFiltered to", nrow(analysis_data), "observations\n")

# Calculate period-over-period and year-over-year changes
analysis_data <- analysis_data %>%
  arrange(Date) %>%
  mutate(
    prev_value = lag(VALUE, 1),
    yoy_value = lag(VALUE, 12),  # Assuming monthly data
    mom_change = VALUE - prev_value,
    mom_pct_change = round((VALUE - prev_value) / prev_value * 100, 2),
    yoy_change = VALUE - yoy_value,
    yoy_pct_change = round((VALUE - yoy_value) / yoy_value * 100, 2)
  )

# Get the latest data point
latest <- analysis_data %>%
  filter(!is.na(VALUE)) %>%
  tail(1)

# Get comparison data
previous_month <- analysis_data %>%
  filter(!is.na(VALUE)) %>%
  tail(2) %>%
  head(1)

same_month_last_year <- analysis_data %>%
  filter(
    year == latest$year - 1,
    month == latest$month
  )

# Build output structure
output <- list(
  metadata = list(
    table_number = table_number,
    table_title = table_info$`Cube Title`,
    series_name = series_name,
    frequency = table_info$Frequency,
    fetched_at = Sys.time(),
    reference_period = latest$REF_DATE
  ),

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

  # Time series for charting (last 24 months)
  time_series = analysis_data %>%
    tail(24) %>%
    select(date = Date, ref_date = REF_DATE, value = VALUE,
           mom_pct_change, yoy_pct_change) %>%
    mutate(date = as.character(date))
)

# Write output
output_file <- file.path(output_dir, paste0("data_", gsub("-", "_", table_number), ".json"))
write_json(output, output_file, pretty = TRUE, auto_unbox = TRUE)

cat("\nOutput written to:", output_file, "\n")

# Print summary
cat("\n=== Data Summary ===\n")
cat(sprintf("Latest period: %s\n", latest$REF_DATE))
cat(sprintf("Latest value: %.1f\n", latest$VALUE))
cat(sprintf("Month-over-month change: %.2f (%.2f%%)\n",
            latest$mom_change, latest$mom_pct_change))
if (!is.na(latest$yoy_pct_change)) {
  cat(sprintf("Year-over-year change: %.2f (%.2f%%)\n",
              latest$yoy_change, latest$yoy_pct_change))
}
