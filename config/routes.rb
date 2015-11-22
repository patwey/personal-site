Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/about', to: 'welcome#about'

  resources :projects, only: [:index]
  resources :posts, only: [:index]
end
