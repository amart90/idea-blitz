# Build static map for given year
build_graph <- function(chart_data, col_lines, col_bg, file_out, year){
  
  # Build output file path
  out_path <- sprintf("3_visualize/out/chart_frames/%s", file_out)
  
  # Filter fire points to given year
  chart_data_line <- chart_data 
  
  chart_data_point <- chart_data %>%
    filter(Year == year)
  
  # Build charts
  ggplot() +
    # Plot line graph
    geom_glowline(data = chart_data, aes(x = Year, y = y, color = name)) +
    # Plot points with alternated Year column (so entire lines are static and only point moves)
    geom_glowpoint(data = chart_data_point, 
                   aes(x = Year, y = y, color = name), size = 2) +
    
    # Styling
    facet_wrap(~ name_f, ncol = 1, scales = "free_y") +
    scale_color_manual(values = col_lines) +
    ylab(NULL) +
    theme(plot.background = element_rect(fill = "#262626", color = NA),
          panel.background = element_rect(fill = "#262626", color = NA),
          strip.background = element_blank(),
          strip.text = element_text(color = "gray70", size = 10, face = "bold"),
          strip.placement = "outside",
          panel.spacing = unit(1/8, "in", data = NULL),
          legend.position = "none",
          axis.title.x = element_text(color = "gray70", size = 10),
          panel.grid = element_line(color = "gray40"),
          axis.text = element_text(color = "gray40"))
  
  # Export data
  ggsave(filename = out_path,
         bg = col_bg, height = 4, width = 6, units = "in", dpi = 300)
  
  return(out_path)
  
}