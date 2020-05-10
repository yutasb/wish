Rails.application.routes.draw do
  get 'users/', to:'users#index', as:'users_index'
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'pages#home'
  get 'user/:id', to: 'otherpages#show', as:'otherpage'
  # 自分でprefixをつける際には、上記のように記述する
  resources :mypages do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :wishes do
    resource :favorites, only: [:create,:destroy]
  end
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'
  delete '/quit/:id', to: 'registrations#destroy', as:'quit'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  resource :relationships, only: [:create, :destroy]

end
