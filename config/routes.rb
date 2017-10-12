Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  get 'signin' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get '/sessions/destroy' => 'sessions#destroy'
  get '/attractions' => 'attractions#index'
  get 'attractions/new' => 'attractions#new'
  get 'attractions/:id' => 'attractions#show'
  post 'rides/:id' => 'rides#take_ride'
  post 'attractions' => 'attractions#create'
  get '/attractions/:id/edit' => 'attractions#edit'
  post '/attractions/:id/edit' => 'attractions#update'

end
