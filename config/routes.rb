Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :users
  end

  # Defines the root path route ("/")
  root to: "users#home"
end
