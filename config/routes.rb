Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end


  resources :projects
  
  get 'projects/new', to: redirect('/login')
  get 'projects' => 'projects#index'
  
  root 'home#index'
  
  get 'home' => 'home#index'

  resources :users




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
