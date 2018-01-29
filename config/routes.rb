# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :items, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :selections, only: [:create, :index, :destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [ :show, :create ]
    end
  end
end
