ActiveAdmin.register Tag do
  menu priority: 2
  actions :index, :show, :edit, :update, :destroy
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :updated_at
    column :created_at
    actions
  end

  filter :name
  filter :updated_at
  filter :created_at
end
