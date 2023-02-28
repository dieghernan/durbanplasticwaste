#' Metadata for dats set Responses to ... survey
#'
#' type, site and place in the x-survey dataset. this comes from the CSV file
#' the unprocessed dataset as exported from Kobo Toolbox
#'
#' raw: Mzedi_survey_-_all_versions_-_False_-_2022-11-28-08-50-18.csv
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
