Rails.application.routes.draw do

  devise_scope :member do
    get "/sign_in" => "members/sessions#new"
    get "/join" => "members/registrations#new"
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
