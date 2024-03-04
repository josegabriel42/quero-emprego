Rails.application.routes.draw do
  get '/candidaturas', to: 'candidaturas#index'
  get '/candidaturas/:id', to: 'candidaturas#show', as: 'candidatura'
  get '/vagas', to: 'vagas#index'
  get '/vagas/:id', to: 'vagas#show', as: 'vaga'
  resources :empregadores do
    get '/candidatura/:id/', to: 'candidaturas#show', as: 'candidatura'
    get '/vagas/:vaga_id/candidaturas/', to: 'candidaturas#index', as: 'vaga_candidaturas'
    resources :vagas
  end
  resources :candidatos do
    get '/vagas', to: 'vagas#index'
    get '/vagas/:vaga_id', to: 'vagas#show', as: 'vaga'
    get '/vagas/:vaga_id/candidaturas/new', to: 'candidaturas#new', as: 'vaga_new_candidatura'
    post '/vagas/:vaga_id/candidaturas/', to: 'candidaturas#create', as: 'vaga_create_candidatura'
    
    resources :candidaturas
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "candidatos#index"
end
