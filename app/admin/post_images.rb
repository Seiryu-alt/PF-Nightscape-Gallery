ActiveAdmin.register PostImage do
  menu priority: 0
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :image do |post_image|
      attachment_image_tag post_image, :image, :fill, 150, 100
    end
    column :user
    column :description
    column :location_name
    column :updated_at
    column :created_at
    actions
  end

  filter :user
  filter :tags
  filter :updated_at
  filter :created_at

  show do
    attributes_table do
      row :image do |post_image|
        attachment_image_tag post_image, :image, :limit, 1000, 1000
      end
      row :user
      row :description
      row :location_name
      row :longitude
      row :latitude
      row :updated_at
      row :created_at
    end
  end
end
