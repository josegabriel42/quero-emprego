Rails.application.routes.draw do
  get '/vagas', to: 'vagas#index'
  get '/vagas/:id', to: 'vagas#show', as: 'vaga'
  resources :empregadores do
    resources :vagas
  end
  resources :candidatos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "candidatos#index"
end
