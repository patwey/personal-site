Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/about', to: 'welcome#about'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :projects, only: [:index]
  resources :posts, only: [:index]

  namespace :admin do
    get '/dashboard', to: 'users#dashboard'
  end
end
