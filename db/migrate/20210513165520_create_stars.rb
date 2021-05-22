class CreateStars < ActiveRecord::Migration[6.0]
  def change
    create_table :stars do |t|
      # Most common proper name, if present
      t.string :proper_name, null: true

      # Identifiers in known star catalogues:
      t.integer :hyg_database_id, null: true
      t.integer :hipparcos_catalog_id, null: true
      t.integer :henry_draper_catalog_id, null: true
      t.integer :harvard_revised_catalog_id, null: true
      t.integer :gliese_catalog_id, null: true
      t.string :bayer_flamsteed_designation, null: true
      t.string :bayer_designation, null: true
      t.string :flamsteed_designation, null: true

      # Position and movement in space
      t.float :right_ascension, null: false # degrees
      t.float :declination, null: false # degrees
      t.float :distance_from_sol, null: false # parsecs
      t.float :x, null: false # parsecs
      t.float :y, null: false # parsecs
      t.float :z, null: false # parsecs
      t.float :velocity_x, null: false
      t.float :velocity_y, null: false
      t.float :velocity_z, null: false
      t.string :constellation, null: true

      # Size
      t.float :visual_magnitude, null: false
      t.float :absolute_magnitude, null: false

      # Color
      t.string :spectral_type, null: true
      t.float :color_index, null: true
      t.float :luminosity, null: true
      t.integer :temperature, null: true # Kelvin
      t.integer :peak_wavelength, null: true # Nanometers
      t.string :hex_color, null: false
      t.integer :red_color, null: false
      t.integer :green_color, null: false
      t.integer :blue_color, null: false

      t.timestamps null: false
    end
  end
end
