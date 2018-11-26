Rails.application.routes.draw do
  get 'bookings/udpate'
  get 'bookings/new'
  get 'bookings/edit'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/destroy'
  get 'bookings/create'
  get 'games/show'
  get 'games/edit'
  get 'games/new'
  get 'games/destroy'
  get 'games/index'
  get 'games/update'
  devise_for :users
  get 'pages/home'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
