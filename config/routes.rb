Rails.application.routes.draw do
  resources :lineups
  resources :venues
  resources :bands
  resources :concerts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
