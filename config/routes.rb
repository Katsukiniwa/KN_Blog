Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about"

  resources :users do
      get "search", on: :collection
    end
  get "users" => "top#users"
  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]

  resources :articles
  namespace :admin do
    root "top#index"
  end
end
