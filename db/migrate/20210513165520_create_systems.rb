class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.float :x_position, null: false
      t.float :y_position, null: false
      t.float :z_position, null: false

      t.string :proper_name, null: false

      t.timestamps null: false
    end
  end
end
