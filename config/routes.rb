Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures
end
