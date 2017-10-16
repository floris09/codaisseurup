Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :photos
  resources :categories
  resources :users, only: [:show]
  resources :events, except: [:destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
  get "about" => "pages#about"
  get "terms" => "pages#terms"

  namespace :api do
    resources :events
    resources :categories
  end

end
