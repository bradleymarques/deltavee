class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.string :name, null: false
      t.float :x_parsecs, null: false
      t.float :y_parsecs, null: false
      t.float :z_parsecs, null: false

      t.string :giliese_catalogue_name, null: true
      t.string :bayer_flamsteed_designation, null: true
      t.string :proper_name, null: true
      t.float :absolute_magnitude, null: true
      t.string :spectral_type, null: true
      t.float :colour_index, null: true
      t.string :constellation, null: true
      t.float :luminosity, null: true

      t.timestamps null: false
    end
  end
end
