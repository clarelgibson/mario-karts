# Source previous code
source(here("03_scripts/02-read-data.R"))

# Clean data
drivers <- drivers_raw |> 
  rename(driver = Driver) |> 
  pivot_longer(-driver, names_to = "attribute", values_to = "points")