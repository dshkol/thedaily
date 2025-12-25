#!/usr/bin/env Rscript
# Config-driven CANSIM data fetcher

library(cansim)
library(dplyr)
library(jsonlite)

args <- commandArgs(trailingOnly = TRUE)
table_number <- if (length(args) > 0) args[1] else stop("Usage: Rscript fetch_table.R <table-number> [output_dir]")
output_dir <- if (length(args) > 1) args[2] else "output"

# Load config - try multiple paths
config_paths <- c(
  "r-tools/table_configs.json",
  "table_configs.json",
  file.path(dirname(normalizePath(commandArgs(FALSE)[grep("--file=", commandArgs(FALSE))])), "table_configs.json")
)
config_file <- NULL
for (p in config_paths) {
  if (file.exists(p)) {
    config_file <- p
    break
  }
}
if (is.null(config_file)) stop("Cannot find table_configs.json")

configs <- fromJSON(config_file)

if (!table_number %in% names(configs)) {
  cat("Table", table_number, "not in config. Available:\n")
  for (t in names(configs)) cat(" -", t, ":", configs[[t]]$name, "\n")
  stop("Add table config first")
}

config <- configs[[table_number]]
cat("Fetching:", config$name, "\n")

# Fetch data
data <- get_cansim(table_number)
cat("Downloaded", nrow(data), "rows\n")

# Apply filters
filtered <- data
for (col in names(config$filters)) {
  if (col %in% names(filtered)) {
    val <- config$filters[[col]]
    filtered <- filtered %>% filter(grepl(val, .data[[col]], fixed = TRUE))
    cat("Filtered", col, "->", nrow(filtered), "rows\n")
  }
}

filtered <- filtered %>% arrange(Date)

# Get time series
scale <- if (!is.null(config$scale)) config$scale else 1
ts <- filtered %>%
  tail(13) %>%
  select(date = REF_DATE, value = VALUE) %>%
  mutate(value = value / scale)

latest <- tail(ts, 1)
prev <- head(tail(ts, 2), 1)
yoy <- head(ts, 1)

mom_pct <- round((latest$value - prev$value) / prev$value * 100, 2)
yoy_pct <- round((latest$value - yoy$value) / yoy$value * 100, 2)

scale_label <- if (!is.null(config$scale_label)) config$scale_label else ""
cat("\nLatest:", latest$date, "-", round(latest$value, 1), scale_label, "\n")
cat("MoM:", mom_pct, "%\n")
cat("YoY:", yoy_pct, "%\n")

# Output
output <- list(
  metadata = list(
    table_number = table_number,
    name = config$name,
    headline = config$headline,
    unit = config$unit,
    scale_label = scale_label
  ),
  latest = list(
    ref_date = latest$date,
    value = round(latest$value, 2),
    mom_pct_change = mom_pct,
    yoy_pct_change = yoy_pct
  ),
  time_series = ts %>% mutate(value = round(value, 2))
)

dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)
output_file <- file.path(output_dir, paste0("data_", gsub("-", "_", table_number), ".json"))
write_json(output, output_file, pretty = TRUE, auto_unbox = TRUE)
cat("Written to:", output_file, "\n")
