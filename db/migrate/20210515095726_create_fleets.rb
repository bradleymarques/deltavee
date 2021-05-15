class CreateFleets < ActiveRecord::Migration[6.0]
  def change
    create_table :fleets do |t|
      t.string :name, null: false

      t.references :system, index: true, null: false
      t.references :owned_by, foreign_key: { to_table: :users }, index: true, null: false

      t.timestamps null: false
    end
  end
end
