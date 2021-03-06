class AddLikesCountToPostImages < ActiveRecord::Migration[5.2]
  def self.up
    add_column :post_images, :likes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :post_images, :likes_count
  end
end
