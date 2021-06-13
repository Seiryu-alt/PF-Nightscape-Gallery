class AddColumnsToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :location_name, :string
    add_column :post_images, :latitude, :float
    add_column :post_images, :longitude, :float
  end
end
