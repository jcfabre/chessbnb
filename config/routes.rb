Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update, :index]
  resources :games do
    collection do
      get "list", to: "games#list"
    end
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show, :update, :edit, :index] do
    resources :reviews
  end
end
