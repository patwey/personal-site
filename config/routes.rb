Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/about', to: 'welcome#about'
end
