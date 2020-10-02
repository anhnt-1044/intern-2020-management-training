class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.boolean :viewed

      t.timestamps
    end
  end
end
