Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts
  resources :comments

  resources :users do
    resources :profiles
  end

end
