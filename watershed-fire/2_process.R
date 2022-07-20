source("2_process/src/chart_data.R")
source("2_process/src/map_data.R")

# Prepare data for map and chart animations
p2_targets <- list(
  
  # Build data for graphs
  tar_target(chart_data,
             build_chart_data(years = 1984:2020, 
                              perim = perim_prepped, 
                              huc = huc)),
  
  # Prep fire perimeter data
  tar_target(perim_prepped,
             prep_perims(perim)),
  
  # Build data for map
  tar_target(map_data,
             sf2df(sf = perim_prepped, 
                   years = 1984:2020))
)
