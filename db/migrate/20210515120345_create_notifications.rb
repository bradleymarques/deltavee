class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :sender, foreign_key: { to_table: :users }, index: true, null: false
      t.references :recipient, foreign_key: { to_table: :users }, index: true, null: false

      t.string :subject, null: false

      t.timestamps null: false
    end
  end
end
