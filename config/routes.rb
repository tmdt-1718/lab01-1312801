Rails.application.routes.draw do
  resources :locations
  get 'blogs/index'
get '/sessions/login',to: 'sessions#new', as: :login
post '/sessions/login', to: 'sessions#create', as: nil
  get 'sessions/new'
  delete '/sessions/logout',  to: 'sessions#destroy', as: :logout

  root 'pages#home'
get '/home', to: 'pages#home'
get  '/about', to: 'pages#about'
get '/album', to: 'pages#album'
get '/blog', to: 'pages#blog'
get '/signup', to: 'users#new'
resources :blogs
resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
