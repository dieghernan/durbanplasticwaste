
<!-- README.md is generated from README.Rmd. Please edit that file -->

# durbanplasticwaste

<!-- badges: start -->
<!-- badges: end -->

## Overview

This packages combines data collected as part of an MSc. Thesis Project
and an MSc. Semester Project conducted in Durban, South Africa. The
projects were supported by the Global Health Engineering group at ETH
Zurich, Switzerland.

## Installation

You can install the development version of durbanplasticwaste from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Global-Health-Engineering/durbanplasticwaste")
```

Alternatively, you can download the individual data sets as a CSV or
XLSX file from the table below.

| dataset           | CSV                                                                                                                         | XLSX                                                                                                                          |
|:------------------|:----------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------|
| litterboom_counts | [Download CSV](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/litterboom_counts.csv) | [Download XLSX](https://github.com/Global-Health-Engineering/durbanplasticwaste/raw/main/inst/extdata/litterboom_counts.xlsx) |

## Projects

### MSc. Thesis Project

Evaluating the potential of Extended Producer Responsibility returns for
a small local waste collection company through a brand audit of riverine
plastic waste in Durban, South Africa.

### Description

This Master’s Thesis Project focuses on determining the growth
opportunities for a small-sized plastic recycling enterprise in light of
the shift from a voluntary to a mandatory Extended Producer
Responsibility (EPR) policy in South Africa.

To achieve this goal in the context of a small start-up in Durban, South
Africa , a brand audit is conducted to identify the top brands that can
be targeted for financing or partnership opportunities. The company,
called [TRI ECO Tours](https://triecotours.co.za/), is a small tourism
and waste collection startup in Durban operated by Siphiwe Rakgabale.

### Research Question

What is the characterization by type, application, and brand of plastic
waste collected in the uMngeni River system in Durban, South Africa?

### Data

The data was collected throughout two months in Durban, South Africa
right before the rainy season. The collection took place in 6 different
litterboom locations throughout Durban. The data gathered was the audit
of the occurence of the brands washed into the litterbooms.

The package provides access to three data sets.

``` r
library(durbanplasticwaste)
```

The `litterboom_counts` data set has 7 variables and 2784 observations.
For an overview of the variable names, see the following table.

``` r
litterboom_counts
```

| variable_name | variable_type | description                                                                                                                    |
|:--------------|:--------------|:-------------------------------------------------------------------------------------------------------------------------------|
| date          | date          | Date of the collected litterboom sample.                                                                                       |
| location      | character     | Descriptive name of the sample location. See \[`locations`\] for longitude and latitude.                                       |
| brand         | character     | Brand name of the collected item (e.g. Coca Cola).                                                                             |
| group         | character     | Group name that owns the brand (e.g. Coca Cola Beverages South Africa).                                                        |
| plastic       | character     | Type of plastic of the item. Identified plastic types are PET, HDPE, and PP. HDPE and PP were categorised together as HDPE/PP. |
| category      | character     | Categorisation of waste into 15 product type categories (e.g. Alcohol, Milk, Tobacco, Water).                                  |
| count         | numeric       | Number of counted items.                                                                                                       |

The `litterboom_weights` data set has 4 variables and 14 observations.
For an overview of the variable names, see the following table.

| variable_name | variable_type | description                              |
|:--------------|:--------------|:-----------------------------------------|
| date          | date          | Date of the collected litterboom sample. |
| location      | character     | Descriptive name of the sample location. |
| pet           | numeric       | Weight (in kg) of PET items.             |
| hpde_pp       | numeric       | Weight (in kg) of PET items.             |

The `locations` data set has 3 variables and 6 observations. For an
overview of the variable names, see the following table.

| variable_name | variable_type                            | description |
|:--------------|:-----------------------------------------|:------------|
| location      | Descriptive name of the sample location. | NA          |
| latitude      | Latitude coordinate.                     | NA          |
| longitude     | Longitude coordinate.                    | NA          |

### MSc. Semester Project

<!--# please add semester project title -->

### Description

<!--# please add a short description of the semester -->

### Research Question

<!--# please add the research questions -->

### Data

## Examples

You can find these and more code examples for exploring
durbanplasticwaste in vignette(“examples”).

``` r
library(durbanplasticwaste)
library(dplyr)

litterboom_counts |> 
  group_by(group) |> 
  summarise(
    sum = sum(count)
  ) |> 
  arrange(desc(sum))
#> # A tibble: 40 × 2
#>    group                               sum
#>    <chr>                             <dbl>
#>  1 Coca Cola Beverages South Africa  4030 
#>  2 United National Breweries PTY LTD 2618 
#>  3 OTHER                             2464.
#>  4 unidentifiable                    1202 
#>  5 Bevco - The Beverage Company       804 
#>  6 Clover Industries LTD              737 
#>  7 Unilever                           442 
#>  8 Ekhamanzi Springs                  306 
#>  9 Amasi                              304 
#> 10 Tiger Brands                       232 
#> # … with 30 more rows
```

## License

Data are available as CC-BY.

## Citation

To cite the durbanplasticwaste package, please use:

``` r
# citation("durbanplasticwaste")
```
