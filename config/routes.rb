Rails.application.routes.draw do
  get 'course/course1' => "course#course2"
  get 'course/course1' => "course#course1"
  root 'static_pages#home'
  get "/home/course" => "home#course"
  get "/home/test" => "home#test"
  get "/home/data" => "home#data"
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
#  get 'sessions/new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end
