# Source previous code
source(here("03_scripts/04-model-data.R"))

# Export data
write_xlsx(
  list(
    dim_drivers = dim_drivers,
    dim_attributes = dim_attributes,
    fct_points = fct_points
  ),
  path = here("02_data/cleaned/karts-model.xlsx")
)