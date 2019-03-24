Rails.application.routes.draw do
  root  to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
#  get 'sessions/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
# info
  get '/info', to: 'static_pages#info'
  get '/info/modify', to: 'static_pages#modify'
  post '/info/modify', to: 'static_pages#modify'
  post '/info/update', to: 'static_pages#update'
  post '/info/create_form', to: 'static_pages#create_form'
  get '/info/create_form', to: 'static_pages#create_form'
  post '/info/info_create', to: 'static_pages#info_create'
  post '/info/update_form', to: 'static_pages#update_form'
  get '/info/update_form', to: 'static_pages#update_form'
  post '/info/info_update', to: 'static_pages#info_update'
  delete '/info/destroy', to: 'static_pages#info_destroy'
# course
  get '/course', to: 'course#top'
  post '/course', to: 'course#update'
  get '/result', to: 'course#last'
  post '/show', to: 'course#show'
# choose course
  get '/choose_course', to: 'choose_course#index'
  get '/choose_course/get_num', to: 'choose_course#get_num'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
