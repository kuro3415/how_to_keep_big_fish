Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'top#index'

  resources :users, only: %i[show new create]
  resources :articles, only: %i[show index]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
