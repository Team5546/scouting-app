Rails.application.routes.draw do
  match 'auth/google/callback' => 'sessions#create_from_oauth', via: [:get, :post]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  
  get 'modes' => 'mode#index'
  get 'data' => 'data#index'
  get 'rawdata' => 'data#rawdata'
  get 'rankeddata' => 'data#rankeddata'
  get 'sorteddata' => 'data#sorteddata'
  get 'rankmultiplier' => 'data#rankmultiplier'
  get 'teamranklist' => 'data#teamranklist'
  get 'averagedata' => 'data#averagedata'

  resources :scouts
  resources :teams
  resources :matches do
    resources :reports
  end
  resources :alliances
  
  resources :reports, only: [:index]

  root to: redirect('/modes')
end
