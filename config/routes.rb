Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users
  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
  end
end
