# Process Raw Data
# Obtain the raw data set here: https://github.com/bradleymarques/hyg-v3

require(dplyr)

clean <- function(vect) {
  gsub(pattern = "\\s+", " ", trimws(vect))
}

systems <-
  read.csv2(
    file = "~/deltavee/data/hygdata_v3.csv",
    header = TRUE,
    sep = ",",
    na.strings = c("")
  ) %>%
  mutate(
    gl = clean(gl),
    bf = clean(bf),
    proper = clean(proper),
    spect = clean(spect),
    ci = clean(ci),
    dist = as.numeric(dist),
    x = as.numeric(x),
    y = as.numeric(y),
    z = as.numeric(z),
    absmag = as.numeric(absmag),
    ci = as.numeric(ci)
  ) %>%
  arrange(dist) %>%
  filter(dist <= 25000) %>%
  dplyr::select(
    giliese_catalogue_name = gl,
    bayer_flamsteed_designation = bf,
    proper_name = proper,
    absolute_magnitude = absmag,
    spectral_type = spect,
    colour_index = ci,
    x = x,
    y = y,
    z = z,
    constellation = con,
    luminosity = lum,
    dist = dist
  )

write.table(systems,
           sep = ";",
           file = "~/deltavee/data/systems.csv",
           row.names = FALSE,
           na = "",
           dec = ".")

# (Optional) Visualize a sample of the data
require(plotly)
fig <- plot_ly(sample_n(systems, 10000),
               x = ~ x,
               y = ~ y,
               z = ~ z,
               size = ~ absolute_magnitude**2,
               color = ~ colour_index)
fig <- fig %>% add_markers()
fig <- fig %>% layout(scene = list(
  xaxis = list(title = 'x'),
  yaxis = list(title = 'y'),
  zaxis = list(title = 'z')
))

fig
