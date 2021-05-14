# Process Raw Data
# Obtain the raw data set here: https://github.com/bradleymarques/hyg-v3

require(dplyr)

NUMBER_STARS_TO_CHOOSE <- 10000 # Max = 119614

raw_data <-
  read.csv2(
    file = "~/deltavee/data/hygdata_v3.csv",
    header = TRUE,
    sep = ",",
    na.strings = c("")
  )

stars <- raw_data %>%
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