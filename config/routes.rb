Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  root to: 'homes#top'
  get 'home/about',to:'homes#index'
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]
end
