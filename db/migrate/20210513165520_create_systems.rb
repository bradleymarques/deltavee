class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.bigint :hyg_id, null: true
      t.bigint :hipparcos_id, null: true
      t.bigint :henry_draper_id, null: true
      t.bigint :harvard_revised_id, null: true
      t.bigint :gliese_id, null: true

      t.sting :bayer_flamsteed_designation, null: true
      t.string :proper_name, null: true

      t.

      t.float :x_position, null: false
      t.float :y_position, null: false
      t.float :z_position, null: false


      t.timestamps null: false
    end
  end
end
