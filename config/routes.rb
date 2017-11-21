Rails.application.routes.draw do
  devise_for :users #, controllers: { registrations: "users/registrations"}
  resources :meals

  post 'meals/claim/:id', to: 'meals#claim', as: :claim_meal

  root 'home#index'

end
