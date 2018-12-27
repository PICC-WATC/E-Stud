Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
#  get 'sessions/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
# course
  get '/course', to: 'course#top'
  post '/course', to: 'course#update'
  get '/result', to: 'course#last'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
