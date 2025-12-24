#!/usr/bin/env Rscript
# Context Fetcher for The D-AI-LY
# Searches for news context on major price movers to support hedged causation

library(httr2)
library(jsonlite)

# Threshold for "major mover" - components with changes above this get context search
MAJOR_MOVER_THRESHOLD <- 10  # percent

# Search for news context on a topic
search_context <- function(query, num_results = 3) {
  # Use DuckDuckGo instant answer API (no key required)
  # For production, could use Google News API or similar

  cat(sprintf("Searching context for: %s\n", query))

  # Construct search query with Canada focus and recent timeframe
  search_query <- paste(query, "Canada 2025 prices")

  tryCatch({
    # Using DuckDuckGo HTML search (simple approach)
    resp <- request("https://html.duckduckgo.com/html/") |>
      req_url_query(q = search_query) |>
      req_perform()

    # For now, return the query - in production would parse results
    list(
      query = query,
      search_performed = TRUE,
      suggested_context = NULL  # Would be populated from search results
    )
  }, error = function(e) {
    list(query = query, search_performed = FALSE, error = e$message)
  })
}

# Generate hedged causation phrase
generate_hedged_phrase <- function(component, change, context = NULL) {
  direction <- if (change > 0) "rose" else "fell"
  change_str <- sprintf("%+.1f%%", change)

  if (is.null(context)) {
    # No context available - just report the change with trend language
    phrases <- c(
      sprintf("%s prices %s %s", component, direction, change_str),
      sprintf("%s (%s) continued its recent trend", component, change_str),
      sprintf("Prices for %s were %s %s year over year", component, direction, change_str)
    )
    return(sample(phrases, 1))
  }

  # Context available - use hedged language
  hedged_connectors <- c(
    "amid",
    "coinciding with",
    "following",
    "in the context of",
    "as markets responded to"
  )

  connector <- sample(hedged_connectors, 1)
  sprintf("%s prices %s %s %s %s", component, direction, change_str, connector, context)
}

# Known context patterns for common commodities
# These are well-established relationships that don't require speculation
KNOWN_PATTERNS <- list(
  gasoline = list(
    up = "global oil price movements",
    down = "easing crude oil prices"
  ),
  beef = list(
    up = "supply constraints in North American cattle markets",
    down = "increased livestock supply"
  ),
  coffee = list(
    up = "supply disruptions in major producing regions",
    down = "improved harvest conditions"
  ),
  wheat = list(
    up = "global grain market pressures",
    down = "favorable harvest conditions"
  ),
  natural_gas = list(
    up = "seasonal heating demand",
    down = "mild weather conditions"
  ),
  lumber = list(
    up = "supply chain constraints",
    down = "softening construction demand"
  ),
  airfare = list(
    up = "increased travel demand",
    down = "seasonal travel patterns"
  ),
  rent = list(
    up = "tight rental market conditions",
    down = "increased housing supply"
  ),
  mortgage_interest = list(
    up = "Bank of Canada rate decisions",
    down = "monetary policy easing"
  )
)

# Get context for a component - first checks known patterns, then searches
get_component_context <- function(component, change) {
  component_lower <- tolower(component)
  direction <- if (change > 0) "up" else "down"

  # Check known patterns first
  for (pattern_name in names(KNOWN_PATTERNS)) {
    if (grepl(pattern_name, component_lower)) {
      context <- KNOWN_PATTERNS[[pattern_name]][[direction]]
      if (!is.null(context)) {
        return(list(
          component = component,
          change = change,
          context = context,
          source = "known_pattern",
          confidence = "high"
        ))
      }
    }
  }

  # No known pattern - would search for context
  # For now, return NULL to indicate no context available
  list(
    component = component,
    change = change,
    context = NULL,
    source = "none",
    confidence = "low"
  )
}

# Process a data frame of components and identify context opportunities
process_components <- function(df, value_col = "change", name_col = "component") {
  results <- list()

  for (i in 1:nrow(df)) {
    component <- df[[name_col]][i]
    change <- df[[value_col]][i]

    # Only fetch context for major movers
    if (abs(change) >= MAJOR_MOVER_THRESHOLD) {
      context_info <- get_component_context(component, change)
      context_info$is_major_mover <- TRUE
      results[[length(results) + 1]] <- context_info
    }
  }

  results
}

# Format results as suggested text
format_context_suggestions <- function(results) {
  suggestions <- character()

  for (r in results) {
    if (!is.null(r$context)) {
      phrase <- generate_hedged_phrase(r$component, r$change, r$context)
      suggestions <- c(suggestions, sprintf("- %s [confidence: %s]", phrase, r$confidence))
    } else {
      phrase <- generate_hedged_phrase(r$component, r$change, NULL)
      suggestions <- c(suggestions, sprintf("- %s [no context available]", phrase))
    }
  }

  paste(suggestions, collapse = "\n")
}

# Main function for CLI usage
main <- function() {
  args <- commandArgs(trailingOnly = TRUE)

  if (length(args) == 0) {
    # Demo mode with sample data
    cat("CONTEXT FETCHER - Demo Mode\n")
    cat("============================\n\n")

    sample_data <- data.frame(
      component = c("Fresh or frozen beef", "Coffee", "Gasoline", "Rent", "Clothing"),
      change = c(17.7, 27.8, -5.2, 8.1, 0.8)
    )

    cat("Sample components:\n")
    print(sample_data)
    cat("\n")

    results <- process_components(sample_data)

    cat("Context suggestions for major movers (>10% change):\n\n")
    cat(format_context_suggestions(results))
    cat("\n")
  } else {
    # Would process actual data file
    cat("Usage: Rscript fetch_context.R [data.json]\n")
  }
}

if (!interactive()) {
  main()
}
