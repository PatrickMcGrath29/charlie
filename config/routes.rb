Rails.application.routes.draw do
  devise_for :users
  resources :refills

  root "home#index"
end
