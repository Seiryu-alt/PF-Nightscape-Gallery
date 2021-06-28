ActiveAdmin.register User do
  menu priority: 3
  actions :index, :show, :destroy

  index do
    selectable_column
    id_column
    column :name
    column :introduction
    column :email
    column :profile_image do |user|
      attachment_image_tag user, :profile_image, :fill, 100, 100
    end
    column :updated_at
    column :created_at
    actions
  end

  filter :following_users
  filter :follower_users
  filter :updated_at
  filter :created_at

  show do
    attributes_table do
      row :profile_image do |user|
        attachment_image_tag user, :profile_image
      end
      row :name
      row :introduction
      row :email
      row :updated_at
      row :created_at
    end
  end
end
