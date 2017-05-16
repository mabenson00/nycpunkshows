Rails.application.routes.draw do
  resources :lineups
  resources :venues
  resources :bands
  resources :concerts
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
