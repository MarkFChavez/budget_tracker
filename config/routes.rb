Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :notebooks, only: [:new, :create]
end
