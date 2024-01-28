Rails.application.routes.draw do
  devise_for :users

  delete 'logout', to: 'devise/sessions#destroy', as: 'logout'

  get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/items/new', to: 'items#new', as: 'new_item'
  # Defines the root path route ("/")
  root 'items#index'

  resources :items, only: [:new, :create, :index]

  resources :items do
    collection do
      get 'index', to: 'items#index', as: 'public_index'
    end
  end
end

