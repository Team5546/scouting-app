Rails.application.routes.draw do
  match 'auth/google/callback' => 'sessions#create', via: [:get, :post]
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :scouts

  root to: redirect('/scouts')
end
