class AddPostImageCommentsCountToPostImages < ActiveRecord::Migration[5.2]
  def self.up
    add_column :post_images, :post_image_comments_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :post_images, :post_image_comments_count
  end
end
