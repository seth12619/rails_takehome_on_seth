Rails.application.routes.draw do
  resources :activities
  resources :activity_names
  resources :activity_addresses
  resources :activity_dates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
