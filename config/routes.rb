Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts
  resources :comments

  resources :user do
    resources :profile
  end

end
