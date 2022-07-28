#source("3_visualize/src/chart_animation.R")
#source("3_visualize/src/map_animation.R")
source("3_visualize/src/combined_animation.R")

# Create animations which include:
#   1. A chart that illustrates fire effects on municipal watersheds over time (years)
#   2. A map that shows fire locations over time (years)
p3_targets <- list(
  
  # Combine plots
  tar_target(combined_plots,
             combine_plots(chart_data = chart_data, col_lines = c("#0abdc6", "#ea00d9"), 
                           font_chart_titles = font_chart_titles, font_chart_axes = font_chart_axes,
                           basemap = basemap, fire_pts = map_data, col_fire = "#c94b10", font_year = font_year,
                           year = Years_0.5, col_bg = "#262626", height = 5, width = 12, 
                           font_main_title = font_main_title,
                           file_out =  sprintf("animation_test_%s.png",Years_0.5)),
             pattern = map(Years_0.5),
             format = "file")

  # Morph images into animation
  
  # Use image_append(c(map_animation_gif, chart_animation_gif)) to stitch gifs together
)