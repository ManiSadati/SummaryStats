#' Summary Statistics
#'
#' Computes summary statistics (mean and median and count) for a specified numeric column
#' within a data frame, grouped by one or more categorical columns.
#'
#' @param data A data frame containing the data to be summarized.
#' @param group_vars A vector of strings specifying the grouping variables.
#' @param summary_var The name of the numeric column for which to calculate summary statistics.
#' @param na.rm A logical indicating whether NA values should be removed before computation.
#' @return A data frame with the group variables and the specified summary statistics.
#' @examples
#' df <- data.frame(group = c('A', 'B', 'A', 'B'), value = c(10, 20, 30, 40))
#' SummaryStats(df, group_vars = "group", summary_var = "value")
#' @export
SummaryStats <- function(data, group_vars, summary_var, na.rm = TRUE) {
  if (!is.data.frame(data)) {
    stop("Input 'data' must be a data frame.")
  }

  if (!all(group_vars %in% names(data))) {
    stop("Specified group variables are not all present in the data frame.")
  }

  if (!summary_var %in% names(data)) {
    stop("Specified summary variable is not present in the data frame.")
  }

  if (!is.numeric(data[[summary_var]])) {
    stop("Specified summary variable is not numeric.")
  }

  data %>%
    group_by(across(all_of(group_vars))) %>%
    summarize(
      Mean = mean(.data[[summary_var]], na.rm = na.rm),
      Median = median(.data[[summary_var]], na.rm = na.rm),
      Count = n(),
      .groups = 'drop'
    )
}
