Rails.application.routes.draw do
  devise_for :users
  resources :refill, only: [:index, :create]
  root "home#index"
end
