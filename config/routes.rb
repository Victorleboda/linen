# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items, only: %i[index show] do
    resources :alternatives, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :selections, only: %i[new create index]
end
