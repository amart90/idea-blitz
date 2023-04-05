source("3_visualize/src/combined_animation.R")

# Create animations which include:
#   1. A chart that illustrates fire effects on municipal watersheds over time
#      (years)
#   2. A map that shows fire locations over time (years)
p3_targets <- list(

  # Combine plots
  tar_target(combined_plots,
    combine_plots(
      chart_data = chart_data,
      col_lines = c("#0abdc6", "#ea00d9"),
      font_chart_titles = font_chart_titles,
      font_chart_axes = font_chart_axes,
      basemap = basemap,
      fire_pts = map_data,
      col_fire = "#c94b10",
      #font_year = font_year,
      year = Years_expanded,
      col_bg = "#262626",
      height = 2,
      width = 5.5,
      font_main_title = font_main_title,
      file_out = sprintf("animation_%.3f.png", Years_expanded)
    ),
    pattern = map(Years_expanded),
    format = "file"
  ),

  # Animate plots
  tar_target(watershed_fire_gif,
    animate_plots(
      in_frames = combined_plots,
      out_file = "3_visualize/out/watershed_fire.gif",
      labels = floor(Years_expanded),
      inter_frames = 1,
      reduce = TRUE,
      frame_delay_cs = 05,
      frame_rate = 60,
      fade_col = "#262626",
      font_year = font_year,
      year_col = "gray70"
    ),
    format = "file"
  )
)
