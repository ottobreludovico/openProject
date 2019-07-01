Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  namespace :user do
    root "home#index"
  end

  get 'projects/:id/chat' => 'chats#index'

  get 'projects/:id/user_stories' => 'projects#us'

  post 'projects/:id/chat' => 'chats#newMessage'

  post 'projects/:id/editrequest' => 'projects#editRequest'

  post 'projects/:id/sendrequest' => 'projects#sendRequest'

  post 'projects/:id/removemember' => 'projects#removeMember'


  resources :projects

  get 'projects/new', to: redirect('/login')
  get 'projects', to: redirect('/login')

  root 'home#index'

  get 'home' => 'home#index'

  resources :users
  resources :lists
  resources :user_stories

  get 'user_stories/:id/destroy' => 'user_stories#destroy'
  post 'user_stories/:id/edit' => 'user_stories#update'
  put 'user_stories/:id' => 'user_stories#update'
  

  get 'lists' => 'lists#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
