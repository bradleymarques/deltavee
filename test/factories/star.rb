FactoryBot.define do
  factory(:star) do
    proper_name { Faker::Lorem.word }
    hyg_database_id { Faker::Number.between(from: 1, to: 10_000) }
    hipparcos_catalog_id { Faker::Number.between(from: 1, to: 10_000) }
    henry_draper_catalog_id { Faker::Number.between(from: 1, to: 10_000) }
    harvard_revised_catalog_id { Faker::Number.between(from: 1, to: 10_000) }
    gliese_catalog_id { Faker::Number.between(from: 1, to: 10_000) }
    bayer_flamsteed_designation { Faker::Lorem.word }
    bayer_designation { Faker::Lorem.word }
    flamsteed_designation { Faker::Lorem.word }
    right_ascension { Faker::Number.between(from: -180, to: 180) }
    declination { Faker::Number.between(from: -180, to: 180) }
    distance_from_sol { Faker::Number.between(from: 1.0, to: 200.0) }
    x { Faker::Number.between(from: 1.0, to: 200.0) }
    y { Faker::Number.between(from: 1.0, to: 200.0) }
    z { Faker::Number.between(from: 1.0, to: 200.0) }
    velocity_x { Faker::Number.between(from: 0.001, to: 0.002) }
    velocity_y { Faker::Number.between(from: 0.001, to: 0.002) }
    velocity_z { Faker::Number.between(from: 0.001, to: 0.002) }
    constellation { Faker::Lorem.word }
    visual_magnitude { Faker::Number.between(from: -20, to: 100) }
    absolute_magnitude { Faker::Number.between(from: -20, to: 100) }
    spectral_type { Faker::Lorem.word }
    color_index { Faker::Number.between(from: -3.0, to: 3.0) }
    luminosity { Faker::Number.between(from: 1, to: 100) }
    temperature { Faker::Number.between(from: 3_000, to: 20_000) }
    peak_wavelength { Faker::Number.between(from: 400, to: 800) }
    hex_color { "#ffffff" }
    red_color { Faker::Number.between(from: 0, to: 255) }
    green_color { Faker::Number.between(from: 0, to: 255) }
    blue_color { Faker::Number.between(from: 0, to: 255) }
  end
end
