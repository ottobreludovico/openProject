Rails.application.routes.draw do 
  root 'home#index'
  #resources :joins
  #resources :messages
  #resources :user_stories
  #resources :reviews
  resources :projects
  get 'signup'  => 'users#new'
  get 'login' => 'sessions#new'
  get 'home' => 'home#index'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#delete'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
