# Process fire perimeter data
prep_perims <- function(perim){
  perim %>%
    mutate(Year = str_sub(Ig_Date, start = 1L, end = 4L),
           State = str_sub(Event_ID, start = 1L, end = 2L)) %>%
    filter(Incid_Type %in% c("Wildfire", "Wildland Fire Use"),
           State %in% conus) %>%
    select(Event_ID, Incid_Name, Ig_Date, Year, State, Incid_Type, BurnBndAc, BurnBndLat, BurnBndLon) %>%
    st_transform(crs = crs)
}

# Convert fire perimeters to points
sf2df <- function(sf, years){
  st_centroid(sf) %>%
    st_geometry() %>%
    do.call(rbind, .) %>%
    as.data.frame() %>%
    setNames(c("lon","lat")) %>%
    bind_cols(st_set_geometry(sf, NULL))
}