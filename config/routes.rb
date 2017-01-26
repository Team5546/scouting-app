Rails.application.routes.draw do
  match 'auth/google/callback' => 'sessions#create', via: [:get, :post]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'modes' => 'mode#index'

  resources :scouts
  resources :teams

  root to: redirect('/modes')
end
