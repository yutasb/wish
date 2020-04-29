Rails.application.routes.draw do
  resources :wishes
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'
  root to: 'pages#home'
end
