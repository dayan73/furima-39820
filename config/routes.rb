Rails.application.routes.draw do
  devise_for :users
  
  delete 'logout', to: 'devise/sessions#destroy', as: 'logout'
  
  get 'items/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root to: "items#index"
end
