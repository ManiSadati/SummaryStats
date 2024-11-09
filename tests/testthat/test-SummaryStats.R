test_that("Test custom_summary_stats function", {
  test_df <- data.frame(group = c('C', 'C', 'D', 'D'), value = c(5, NA, 7, 8))
  result <- SummaryStats(test_df, group_vars = "group", summary_var = "value", na.rm = TRUE)
  expect_equal(nrow(result), 2)
  expect_true(all(c("Mean", "Median", "Count") %in% names(result)))
  expect_error(SummaryStats(test_df, group_vars = "invalid", summary_var = "value"))
})
