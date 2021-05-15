# Process Raw Data
# Obtain the raw data set here: https://github.com/bradleymarques/hyg-v3

require(dplyr)
require(plotly)

NUMBER_STARS_TO_CHOOSE <- 4000 # Max = 119614

raw_data <-
  read.csv2(
    file = "~/deltavee/data/hygdata_v3.csv",
    header = TRUE,
    sep = ",",
    na.strings = c("")
  ) %>%
  mutate(dist = as.numeric(dist))

stars <- raw_data %>%
  filter(dist < 99999) %>%
  arrange(dist) %>%
  head(NUMBER_STARS_TO_CHOOSE) %>%
  dplyr::select(
    giliese_catalogue_name = gl,
    bayer_flamsteed_designation = bf,
    proper_name = proper,
    absolute_magnitude = absmag,
    spectral_type = spect,
    colour_index = ci,
    x_parsecs = x,
    y_parsecs = y,
    z_parsecs = z,
    constellation = con,
    luminosity = lum
  )

write.csv2(stars, file = "~/deltavee/data/stars.csv", row.names = FALSE, na = "")

# 3D Scatter plot
fig <- plot_ly(stars, x = ~x_parsecs, y = ~y_parsecs, z = ~z_parsecs)
fig <- fig %>% add_markers()
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Weight'),
                                   yaxis = list(title = 'Gross horsepower'),
                                   zaxis = list(title = '1/4 mile time')))
fig
