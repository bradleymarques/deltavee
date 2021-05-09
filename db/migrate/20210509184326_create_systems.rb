class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.string :name, null: false
      t.decimal :x
      t.decimal :y
      t.decimal :z

      t.timestamps null: false
    end
  end
end
