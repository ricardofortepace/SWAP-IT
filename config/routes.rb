Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :stuffs
  resources :likes, only: %i[ new create ]

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end
end
