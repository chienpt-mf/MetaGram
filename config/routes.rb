Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
  end
end
