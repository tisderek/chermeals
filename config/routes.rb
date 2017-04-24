Rails.application.routes.draw do
  devise_for :users
  resources :meals

  root 'meals#index'

end
