#' Plastic waste litterboom counts
#'
#' Count of individual plastic waste items categorised by brand, corporate
#' group, plastic type, and usage application. Waste was collected on 14 days
#' in 6 locations in Durban, South Africa.
#'
#' @seealso \url{ghe.ethz.ch}
#'
#' @format A tibble with one observation for each paper, and the following columns:
#' \describe{
#'   \item{paper_id}{Unique identifier that can link to full text and citations.
#'   SHA of the paper PDF.}
#'   \item{source}{Source (e.g. pubmed, CZI...)}
#'   \item{title}{Title}
#'   \item{doi}{Digital Object Identifier}
#'   \item{pmcid}{pmcid}
#'   \item{pubmed_id}{PubMed ID}
#'   \item{license}{License}
#'   \item{abstract}{Abstract}
#'   \item{publish_time}{Publication year}
#'   \item{authors}{Authors}
#'   \item{journal}{Journal}
#'   \item{microsoft_academic_paper_id}{Microsoft Academic Paper ID}
#'   \item{who}{CovidenceWHO}
#'   \item{has_full_text}{Does it have full text}
#' }
#'
#' @examples
#'
#' library(dplyr)
#'
#' # What are the most common journals?
#' survey %>%
#'    select(1:3)
#'
"survey"
