Rails.application.routes.draw do

  devise_for :users
  root to: 'games#index'
  resources :games do
    resources :bookings, only: [:new,:create]
  end
  resources :bookings, only: [:destroy, :show, :update, :edit, :index]

end
