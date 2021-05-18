class CreateSpaceships < ActiveRecord::Migration[6.0]
  def change
    create_table :spaceships do |t|
      t.string :name, null: false

      t.references :fleet, index: true, null: false
      t.references :owned_by, foreign_key: { to_table: :users }, index: true, null: false

      t.timestamps null: false
    end
  end
end
