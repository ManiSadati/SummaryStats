
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SummaryStats

<!-- badges: start -->
<!-- badges: end -->

**SummaryStats** is an R package that provides a function to calculate
summary statistics (mean, median, and count) for a specified numeric
column within a data frame, grouped by one or more categorical columns.

## Installation

To install the development version of **SummaryStats** directly from
GitHub, you’ll need the `devtools` package:

``` r
install.packages("devtools")
#> Installing package into '/tmp/RtmpLalSRN/temp_libpath112b01f860a7e'
#> (as 'lib' is unspecified)
```

Then, use the following command:

``` r
devtools::install_github("ManiSadati/SummaryStats", ref = "0.1.0")
#> Downloading GitHub repo ManiSadati/SummaryStats@0.1.0
#> Error in utils::download.file(url, path, method = method, quiet = quiet,  : 
#>   cannot open URL 'https://api.github.com/repos/ManiSadati/SummaryStats/tarball/0.1.0'
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(datateachr) # <- might contain the data you picked!
library(tidyverse)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.1
#> ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
#> ✔ purrr     1.0.2     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(testthat)
#> 
#> Attaching package: 'testthat'
#> 
#> The following object is masked from 'package:dplyr':
#> 
#>     matches
#> 
#> The following object is masked from 'package:purrr':
#> 
#>     is_null
#> 
#> The following objects are masked from 'package:readr':
#> 
#>     edition_get, local_edition
#> 
#> The following object is masked from 'package:tidyr':
#> 
#>     matches
library(SummaryStats)

# Sample data
data <- data.frame(
  category = c("A", "A", "B", "B"),
  values = c(10, 20, 30, 40)
)

# Calculate summary statistics
summary_result <- SummaryStats(data, group_vars = "category", summary_var = "values")

# View the results
summary_result
#> # A tibble: 2 × 4
#>   category  Mean Median Count
#>   <chr>    <dbl>  <dbl> <int>
#> 1 A           15     15     2
#> 2 B           35     35     2
```
