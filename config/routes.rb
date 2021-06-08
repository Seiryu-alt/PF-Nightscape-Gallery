Rails.application.routes.draw do
  devise_for :users
  namespace :public do
    get 'tags/show'
  end
  namespace :public do
    get 'likes/index'
  end
  namespace :public do
    get 'post_images/show'
    get 'post_images/edit'
    get 'post_images/new'
    get 'post_images/search'
  end
  namespace :public do
    get 'relationships/following'
    get 'relationships/follower'
  end
  namespace :public do
    get 'users/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
