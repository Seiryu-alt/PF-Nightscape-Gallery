class DeleteColumnsFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :iso
    remove_column :post_images, :aperture
    remove_column :post_images, :shutter_speed
  end
end
