class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.text :description
      t.integer :iso
      t.string :aperture
      t.string :shutter_speed

      t.timestamps
    end
  end
end
