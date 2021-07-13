Rails.application.routes.draw do
  get 'sessions/new'
  root :to => 'tasks#index'
  scope "(:locale)", locale: /en|ja/ do
  resources :tasks
  end
  get 'search' => 'tasks#search'
  # resources :searches,only:[:index]
  resources :users
    namespace :admin do
      resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      end
    end
  resources :sessions, only: [:new, :create, :destroy]
end
