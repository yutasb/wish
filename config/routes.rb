Rails.application.routes.draw do
  root to: 'pages#home'
  get 'user/:id', to: 'otherpages#show', as:'otherpage'
  # 自分でprefixをつける際には、上記のように記述する
  resources :mypages
  resources :wishes
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'
  delete '/quit/:id', to: 'registrations#destroy', as:'quit'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  resources :relationships, only: [:create, :destroy]

end
