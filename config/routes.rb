Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :events
    root 'admin#index'
  end

  root 'events#index' 
  
  resources :events
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :charges
  resources :attendances


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end






