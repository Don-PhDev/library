Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :books do
    member do
      put "add",    to: "books#library"
      put "remove", to: "books#library"
    end
  end
  resources :libraries, only: [:index]
  resources :pricing,   only: [:index]
  resources :subscriptions

  root to: 'books#index'
end
