# Source previous code
source(here("03_scripts/03-clean-data.R"))

# Model data

## Drivers
dim_drivers <- drivers |> 
  build_dimension("driver")

## Attributes
dim_attributes <- drivers |> 
  build_dimension("attribute") |> 
  # Add abbreviation
  mutate(
    attribute_abbr = case_when(
      attribute == "Weight" ~ "WG",
      attribute == "Acceleration" ~ "AC",
      attribute == "On-Road traction" ~ "ON",
      attribute == "Off-Road Traction" ~ "OF",
      attribute == "Mini-Turbo" ~ "MT",
      attribute == "Ground Speed" ~ "SL",
      attribute == "Water Speed" ~ "SW",
      attribute == "Anti-Gravity Speed" ~ "SA",
      attribute == "Air Speed" ~ "SG",
      attribute == "Ground Handling" ~ "TL",
      attribute == "Water Handling" ~ "TW",
      attribute == "Anti-Gravity Handling" ~ "TA",
      attribute == "Air Handling" ~ "TG",
      TRUE ~ NA_character_
    ),
    attribute_definition = case_when(
      attribute == "Weight" ~ "Affects collisions between vehicles. Heavier vehicles tend to bump lighter vehicles with greater force, but relative speed and boosts also play a role during collisions.",
      attribute == "Acceleration" ~ "Determines how fast the vehicle increases its speed over time, including how well a vehicle will recover its speed when stopped or slowed down.",
      attribute == "On-Road traction" ~ "On regular surfaces, all vehicles slip equally as the on-road slip is the same for every value of On-Road Traction. Slippery surfaces like sand, mud, snow, ice and wet asphalt make the vehicle slip more while also reducing its maximum speed. Off-Road Traction reduces the negative effects of slippery surfaces but, despite the name, it does not grant any advantage on off-road surfaces.",
      attribute == "Off-Road Traction" ~ "On regular surfaces, all vehicles slip equally as the on-road slip is the same for every value of On-Road Traction. Slippery surfaces like sand, mud, snow, ice and wet asphalt make the vehicle slip more while also reducing its maximum speed. Off-Road Traction reduces the negative effects of slippery surfaces but, despite the name, it does not grant any advantage on off-road surfaces.",
      attribute == "Mini-Turbo" ~ "Determines how long the mini-turbo boosts last, how strong they are, how quicky the vehicle can reach the maximum boost speed and, finally, how quickly all the mini-turbo levels (regular, super, ultra) can be charged. It also affects the duration, strength and acceleration of jump boosts in a similar way.",
      attribute == "Ground Speed" ~ "Determines the maximum speed of the vehicle on land. The maximum speed can be increased depending on the number of coins, which goes up to a maximum number of 10.",
      attribute == "Water Speed" ~ "Determines the maximum speed of the vehicle in water. The maximum speed can be increased depending on the number of coins, which goes up to a maximum number of 10.",
      attribute == "Anti-Gravity Speed" ~ "Determines the maximum speed of the vehicle in anti-gravity. The maximum speed can be increased depending on the number of coins, which goes up to a maximum number of 10.",
      attribute == "Air Speed" ~ "Determines the maximum speed of the vehicle in the air. Air speed is not affected by coins.",
      attribute == "Ground Handling" ~ "Determines how sharp the vehicle can steer on land and how much the drift can be extended or accentuated. It also determines how fast automatic drifts are charged.",
      attribute == "Water Handling" ~ "Determines how sharp the vehicle can steer in water and how much the drift can be extended or accentuated. It also determines how fast automatic drifts are charged.",
      attribute == "Anti-Gravity Handling" ~ "Determines how sharp the vehicle can steer in anti-gravity and how much the drift can be extended or accentuated. It also determines how fast automatic drifts are charged.",
      attribute == "Air Handling" ~ "Determines how sharp the vehicle can steer in the air and how much the drift can be extended or accentuated. It also determines how fast automatic drifts are charged.",
      TRUE ~ NA_character_
    )
  )

## Points
fct_points <- drivers |> 
  left_join(dim_drivers) |> 
  left_join(dim_attributes) |> 
  select(-c(driver, attribute))