# Packages
library(here)
library(tidyverse)
library(writexl)

# Function to build a dimension from a single column
build_dimension <- function(data, col) {
  dim <- data |> 
    select(all_of(col)) |> 
    distinct() |> 
    arrange(col) |> 
    rowid_to_column(var = paste0(col, "_key"))
}