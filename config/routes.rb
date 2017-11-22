Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/join" => "users/registrations#new" # custom path to sign_up/registration
  end

  devise_for :users, controllers: { registrations: "users/registrations"}

  resources :meals

  post 'meals/claim/:id', to: 'meals#claim', as: :claim_meal

  root 'home#index'

end
