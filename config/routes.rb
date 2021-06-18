Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations], controllers: {
    :sessions => 'public/users/sessions',
    :registrations => 'public/users/registrations'
  }

  scope module: 'public' do
    root :to    => 'homes#top'
    get 'about' => 'homes#about'
    get 'mypage' => 'users#mypage'
    get 'search' => 'homes#search'

    resources :users, only: [:show] do
      resource :relationship, only: [:create, :destroy] do
        get 'following'
        get 'follower'
      end
      resources :likes, only: [:index]
    end

    resources :post_images, only: [:show, :edit, :update, :destroy, :new, :create] do
      collection do
        get 'maps'
      end
      resources :post_image_comments, only: [:create, :destroy]
      resource :like, only: [:create, :destroy]
    end
    
    resources :tags, only: [:show]
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
