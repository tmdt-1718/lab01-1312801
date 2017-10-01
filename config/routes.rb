Rails.application.routes.draw do
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
get '/blog', to: 'blogs#index'
get '/signup', to: 'users#new'
get '/blogshow/:id',to:'blogs#show'
resources :blogs
resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
