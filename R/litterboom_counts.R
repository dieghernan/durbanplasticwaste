#' Plastic waste litterboom counts
#'
#' Count of individual plastic waste items categorised by brand, corporate
#' group, plastic type, and usage application. Waste was collected on 14 days
#' in 6 locations in Durban, South Africa.
#'
#' @format A tibble with 2784 rows and 7 variables:
#' \describe{
#'   \item{date}{Date of the collected litterboom sample.}
#'   \item{location}{Descriptive name of the sample location. See [`locations`]
#'   for longitude and latitude .}
#'   \item{brand}{Brand name of the collected item (e.g. Coca Cola).}
#'   \item{group}{Group name that owns the brand (e.g. Coca Cola Beverages
#'   South Africa).}
#'   \item{plastic}{Type of plastic of the item. Identified plastic types are
#'   PET, HDPE, and PP. HDPE and PP were categorised together as HDPE/PP.}
#'   \item{category}{Categorisation of waste into 15 product type categories
#'   (e.g. Alcohol, Milk, Tobacco, Water).}
#'   \item{count}{Number of counted items.}
#' }
#'
"litterboom_counts"
