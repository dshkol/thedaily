# The D-AI-LY: Verification JSON Utility
# Standardized function for saving data provenance JSON files
#
# USAGE:
#   source("r-tools/save_verification_json.R")
#   save_verification_json(
#     series_name = "Manufacturing Sales",
#     table_number = "16-10-0047",
#     data = your_filtered_data,  # data.frame with REF_DATE and VALUE columns
#     output_dir = "output"
#   )
#
# PURPOSE:
# Every article generated must have a corresponding JSON verification file
# to enable audit trail and prevent data fabrication.

library(jsonlite)
library(dplyr)

#' Save verification JSON for article data provenance
#'
#' @param series_name Character. Name of the data series (e.g., "Manufacturing Sales")
#' @param table_number Character. CANSIM table number (e.g., "16-10-0047")
#' @param data Data frame with at minimum REF_DATE and VALUE columns
#' @param output_dir Character. Output directory path (default: "output")
#' @param unit Character. Unit of measurement (e.g., "millions", "index", "thousands")
#' @param filters List. Filters applied to get this data (for reproducibility)
#' @param article_slug Character. Optional slug of the article using this data
#'
#' @return Path to the saved JSON file
save_verification_json <- function(
  series_name,
  table_number,
  data,
  output_dir = "output",
  unit = NULL,
  filters = list(),
  article_slug = NULL
) {

  # Validate input
  if (!all(c("REF_DATE", "VALUE") %in% names(data))) {
    stop("Data must contain REF_DATE and VALUE columns")
  }

  if (nrow(data) == 0) {
    warning("No data to save - data frame is empty")
    return(NULL)
  }

  # Ensure data is sorted by date
  data <- data %>% arrange(REF_DATE)

  # Get latest values
  latest <- tail(data, 1)
  prev <- if (nrow(data) >= 2) tail(data, 2)[1, ] else NULL

  # Find year-ago value
  latest_date <- latest$REF_DATE
  year_ago_date <- paste0(
    as.numeric(substr(latest_date, 1, 4)) - 1,
    substr(latest_date, 5, nchar(latest_date))
  )
  year_ago <- data %>% filter(REF_DATE == year_ago_date)

  # Calculate percentage changes
  mom_pct <- if (!is.null(prev) && prev$VALUE != 0) {
    round((latest$VALUE - prev$VALUE) / prev$VALUE * 100, 1)
  } else {
    NA
  }

  yoy_pct <- if (nrow(year_ago) > 0 && year_ago$VALUE[1] != 0) {
    round((latest$VALUE - year_ago$VALUE[1]) / year_ago$VALUE[1] * 100, 1)
  } else {
    NA
  }

  # Build time series
  time_series <- data %>%
    mutate(
      date = REF_DATE,
      value = VALUE
    ) %>%
    select(date, value) %>%
    as.list() %>%
    {split(data.frame(date = .$date, value = .$value), seq(nrow(data)))} %>%
    lapply(function(x) list(date = x$date, value = x$value))

  # Convert to simpler format
  time_series_simple <- data %>%
    transmute(date = REF_DATE, value = VALUE) %>%
    apply(1, function(row) list(date = row["date"], value = as.numeric(row["value"])))

  # Build JSON structure
  json_output <- list(
    series = series_name,
    ref_date = latest$REF_DATE,
    value = latest$VALUE,
    mom_pct = mom_pct,
    yoy_pct = yoy_pct,
    time_series = time_series_simple,

    # Provenance metadata
    provenance = list(
      table_number = table_number,
      fetched_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"),
      statcan_url = paste0(
        "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=",
        gsub("-", "", table_number), "01"
      ),
      filters_applied = filters,
      article_slug = article_slug,
      r_version = paste(R.version$major, R.version$minor, sep = "."),
      cansim_package_version = tryCatch(
        as.character(packageVersion("cansim")),
        error = function(e) "unknown"
      )
    )
  )

  # Add unit if provided
  if (!is.null(unit)) {
    json_output$unit <- unit
  }

  # Generate filename from series name
  filename <- tolower(gsub("[^a-zA-Z0-9]+", "_", series_name))
  filename <- gsub("_+", "_", filename)
  filename <- gsub("^_|_$", "", filename)
  filepath <- file.path(output_dir, paste0(filename, ".json"))

  # Create output directory if needed
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  # Write JSON
  write_json(json_output, filepath, pretty = TRUE, auto_unbox = TRUE)

  message("Saved verification JSON: ", filepath)
  message("  Series: ", series_name)
  message("  Latest: ", latest$REF_DATE, " = ", latest$VALUE)
  message("  MoM: ", if (!is.na(mom_pct)) paste0(mom_pct, "%") else "N/A")
  message("  YoY: ", if (!is.na(yoy_pct)) paste0(yoy_pct, "%") else "N/A")

  return(filepath)
}


#' Quick verification JSON from a simple CANSIM fetch
#'
#' Convenience wrapper that fetches and saves in one step
#'
#' @param series_name Character. Name of the data series
#' @param table_number Character. CANSIM table number
#' @param ... Additional filter arguments passed to dplyr::filter
#' @param output_dir Character. Output directory path
#' @param unit Character. Unit of measurement
#' @param date_from Character. Start date for time series (default: 2 years ago)
#'
#' @return Path to the saved JSON file
fetch_and_save_verification <- function(
  series_name,
  table_number,
  ...,
  output_dir = "output",
  unit = NULL,
  date_from = format(Sys.Date() - 730, "%Y-%m")
) {
  library(cansim)

  message("Fetching ", series_name, " from table ", table_number, "...")

  # Fetch data
  raw_data <- get_cansim(table_number)


  # Apply filters
  filter_args <- rlang::enquos(...)
  filtered <- raw_data %>%
    filter(!!!filter_args) %>%
    filter(REF_DATE >= date_from) %>%
    select(REF_DATE, VALUE) %>%
    arrange(REF_DATE)

  if (nrow(filtered) == 0) {
    warning("No data after filtering. Check filter conditions.")
    return(NULL)
  }

  # Build filters list for provenance
  filters <- lapply(filter_args, rlang::as_label)

  # Save
  save_verification_json(
    series_name = series_name,
    table_number = table_number,
    data = filtered,
    output_dir = output_dir,
    unit = unit,
    filters = filters
  )
}


#' Link an article to its verification JSON
#'
#' Updates a verification JSON file to record which article uses it
#'
#' @param json_path Character. Path to existing verification JSON
#' @param article_slug Character. Slug of the article using this data
#' @param article_title Character. Title of the article
#'
#' @return Updated JSON path
link_article_to_json <- function(json_path, article_slug, article_title = NULL) {
  if (!file.exists(json_path)) {
    warning("JSON file not found: ", json_path)
    return(NULL)
  }

  json_data <- read_json(json_path)

  # Initialize linked_articles if not present
  if (is.null(json_data$linked_articles)) {
    json_data$linked_articles <- list()
  }

  # Add this article
  article_entry <- list(
    slug = article_slug,
    title = article_title,
    linked_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z")
  )

  # Avoid duplicates
  existing_slugs <- sapply(json_data$linked_articles, function(x) x$slug)
  if (!(article_slug %in% existing_slugs)) {
    json_data$linked_articles <- append(json_data$linked_articles, list(article_entry))
  }

  write_json(json_data, json_path, pretty = TRUE, auto_unbox = TRUE)
  message("Linked article '", article_slug, "' to ", json_path)

  return(json_path)
}


# Example usage (commented out):
# source("r-tools/save_verification_json.R")
#
# # Method 1: Fetch and save in one step
# fetch_and_save_verification(
#   series_name = "Manufacturing Sales",
#   table_number = "16-10-0047",
#   GEO == "Canada",
#   `Seasonal adjustment` == "Seasonally adjusted",
#   `Principal statistics` == "Sales of goods manufactured (shipments)",
#   `North American Industry Classification System (NAICS)` == "Manufacturing",
#   unit = "millions"
# )
#
# # Method 2: Manual fetch then save
# data <- get_cansim("16-10-0047") %>%
#   filter(GEO == "Canada", ...) %>%
#   select(REF_DATE, VALUE) %>%
#   arrange(REF_DATE)
#
# save_verification_json(
#   series_name = "Manufacturing Sales",
#   table_number = "16-10-0047",
#   data = data,
#   unit = "millions"
# )
