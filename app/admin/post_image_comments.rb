ActiveAdmin.register PostImageComment do
  menu priority: 1
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :user
    column :post_image
    column :comment
    column :updated_at
    column :created_at
    actions
  end

  filter :user
  filter :updated_at
  filter :created_at
end
