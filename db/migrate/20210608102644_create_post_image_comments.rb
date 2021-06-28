class CreatePostImageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_image_comments do |t|
      t.integer :user_id, null: false
      t.string :post_image_id, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
