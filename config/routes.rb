Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  get 'about_us', to: 'pages#about_us', as: 'about_us'

  resources :stuffs

  resources :likes, only: [:new, :create]

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: :create
    end
  end
