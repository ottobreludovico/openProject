Rails.application.routes.draw do
  resources :messages
  resources :user_stories
  resources :reviews
  resources :projects
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
