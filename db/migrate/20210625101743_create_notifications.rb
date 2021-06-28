class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :post_image_id
      t.integer :post_image_comment_id
      t.integer :action, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
