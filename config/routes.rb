Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'reviews#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :reviews, except: [:show]
  resources :comments, only: [:create] do
    member do
      post 'update_rating'
    end
  end

end
