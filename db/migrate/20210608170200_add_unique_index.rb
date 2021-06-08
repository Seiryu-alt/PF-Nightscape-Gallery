class AddUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :likes,         [:post_image_id, :user_id],   unique: true
    add_index :tag_maps,      [:post_image_id, :tag_id],    unique: true
    add_index :Relationships, [:follower_id, :followed_id], unique: true
  end
end
