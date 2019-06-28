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


  resources :projects

  get 'projects/new', to: redirect('/login')
  get 'projects', to: redirect('/login')

  root 'home#index'

  get 'home' => 'home#index'

  resources :users
  resources :lists
  resources :user_stories

  get 'lists' => 'lists#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
