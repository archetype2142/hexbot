Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/random', to: 'api#index'
  get '/calculate/:id', to: 'api#show'

  resources :home
end
