# description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy dataframe

# R packages --------------------------------------------------------------

library(tidyverse)
library(here)
library(readxl)
library(janitor)

# read data ---------------------------------------------------------------

litterboom <- read_excel("data-raw/Data for R_Raúl.xlsx", skip = 2)

# tidy data ---------------------------------------------------------------

litterboom_df <- litterboom |>
  select(-...1) |>
  clean_names() |>
  mutate(year = "2022") |>
  unite(col = "date", c("date", "year"), sep = ".") |>
  mutate(date = lubridate::dmy(date)) |>
  relocate(date) |>
  mutate(amount = case_when(
    is.na(amount) == TRUE ~ 0,
    TRUE ~ amount
  ))

## store weights data as separate table

litterboom_weights <- litterboom_df |>
  select(date, weight_pet, weight_hdpe_pp) |>
  distinct()

# Issue 1: https://github.com/Global-Health-Engineering/durbanplasticwaste22/issues/1#issuecomment-1447828447

litterboom_df |>
  filter(weight_pet == 0) |>
  filter(amount != 0) |>
  select(date, brand, plastic, amount, weight_pet) |>
  group_by(date, plastic) |>
  summarise(sum = sum(amount))
  #head(n = 10) |>
  knitr::kable()

# Issue 2: https://github.com/Global-Health-Engineering/durbanplasticwaste22/issues/2

litterboom_df |>
  count(brand, name = "count") |>
  mutate(new_name = NA_character_) |>
  openxlsx::write.xlsx("data-raw/tidy-brand.names.xlsx")


# write data --------------------------------------------------------------

litterboom_weights

litterboom_counts <- litterboom_df |>
  select(-weight_pet, -weight_hdpe_pp) |>
  rename(count = amount)


usethis::use_data(litterboom_weights, litterboom_counts, overwrite = TRUE)

# write_csv(litterboom_counts, here::here("inst", "extdata", "litterboom_counts.csv"))
# write_csv(litterboom_weights, here::here("inst", "extdata", "litterboom_weights.csv"))


