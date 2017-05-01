Rails.application.routes.draw do
  devise_for :users
  resources :meals
  post 'meals/claim/:id', to: 'meals#claim', as: :claim_meal
  root 'meals#index'

end
