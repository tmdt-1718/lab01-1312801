Rails.application.routes.draw do
  get 'paintings/index'
  resources :blogs do
    resources :comments
  end
  resources :users
  resources :galleries do
    resources :paintings
  end
  get 'comments/index'

  get 'blogs/index'
get '/login',to: 'sessions#new', as: :login
post '/login', to: 'sessions#create', as: nil
  get 'sessions/new'
  delete '/logout',  to: 'sessions#destroy', as: :logout

  root 'pages#home'
  get '/home', to: 'pages#home'
get  '/about', to: 'pages#about'
get '/album', to: 'pages#album'
get 'blogs', to: 'blogs#index'
get '/signup', to: 'users#new'
get 'blog', to: 'blogs#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
