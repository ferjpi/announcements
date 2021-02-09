Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home'
  
  get 'announcements/index'
  get 'announcements/new', to: 'announcements#new'
  post 'announcements', to: 'announcements#create'

  resources :users
  # resource :users
end
