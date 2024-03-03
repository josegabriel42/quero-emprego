Rails.application.routes.draw do
  resources :empregadores
  resources :candidatos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "candidatos#index"
end
