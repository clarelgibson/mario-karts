# Source previous code
source(here("03_scripts/01-utils.R"))

# Read data
drivers_path <- here("02_data/raw/drivers.csv")
drivers_raw <- read_delim(drivers_path, delim = ";")