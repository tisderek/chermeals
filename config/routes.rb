Rails.application.routes.draw do

  devise_scope :member do
    get "/sign_in" => "members/sessions#new" # custom path to login/sign_in
    get "/join" => "members/registrations#new" # custom path to sign_up/registration
  end

  devise_for :members, controllers: {
    registrations: 'members/registrations',
  }

  authenticated :member do
    root 'meals#index', as: :authenticated_root
  end

  resources :meals
  resources :groups

  post 'meals/claim/:id', to: 'meals#claim', as: :claim_meal
  root 'home#index'
end
