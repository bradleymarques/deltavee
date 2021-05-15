class CreateSpaceships < ActiveRecord::Migration[6.0]
  def change
    create_table :spaceships do |t|
      t.string :name, null: false
      t.integer :ship_class, null: false, index: true
      t.references :owned_by, foreign_key: { to_table: :users }, index: true
    end
  end
end
