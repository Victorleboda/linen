Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items, only: [ :index, :show ] do
    resources :alternatives, only: [ :index ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :selections, only: [:new, :create, :index]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: [ :show, :create ]
      resources :alternatives, only: [ :index ]
    end
  end
end
