# description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy dataframe

# R packages --------------------------------------------------------------

library(tidyverse)
library(here)
library(readxl)
library(janitor)

# read data ---------------------------------------------------------------

litterboom <- read_excel("data-raw/Data for R_Raúl.xlsx", skip = 2)
locations <- read_csv("data-raw/litterboom-sample-locations.csv")

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
  select(date, location, pet = weight_pet, hdpe_pp = weight_hdpe_pp) |>
  distinct()

## import tidy brand names after exporting excel
## Issue 2: https://github.com/Global-Health-Engineering/durbanplasticwaste22/issues/2

litterboom_df |>
  count(brand, name = "count") |>
  mutate(new_name = NA_character_) |>
  openxlsx::write.xlsx("data-raw/tidy-brand.names.xlsx")

brand_names <- read_excel("data-raw/tidy-brand.names-rb.xlsx") |>
  select(brand, new_name) |>
  mutate(new_name = case_when(
    is.na(new_name) == TRUE ~ brand,
    TRUE ~ new_name
  ))

litterboom_counts <- litterboom_df |>
  select(-weight_pet, -weight_hdpe_pp) |>
  rename(count = amount) |>
  left_join(brand_names) |>
  relocate(new_name, .before = brand) |>
  select(-brand) |>
  relocate(location, .after = date) |>
  rename(brand = new_name) |>
  mutate(group = case_when(
    group == "OTHER GROUPS" ~ "OTHER",
    group == "The Coca-Cola Company" ~ "Coca Cola Beverages South Africa",
    group == "Coca Cola Company" ~ "Coca Cola Beverages South Africa",
    str_detect(group, "UnID") == TRUE ~ "unidentifiable",
    TRUE ~ group
  )) |>
  mutate(category = case_when(
    category == "skiin" ~ "Skin/Hair Products",
    TRUE ~ category
  ))

# write data --------------------------------------------------------------

usethis::use_data(litterboom_weights, litterboom_counts, locations, overwrite = TRUE)

write_csv(litterboom_counts, here::here("inst", "extdata", "litterboom_counts.csv"))
write_csv(litterboom_weights, here::here("inst", "extdata", "litterboom_weights.csv"))
write_csv(litterboom_weights, here::here("inst", "extdata", "locations.csv"))


