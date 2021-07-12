Rails.application.routes.draw do
  get 'sessions/new'
  root :to => 'tasks#index'
  scope "(:locale)", locale: /en|ja/ do
  resources :tasks
  end
  get 'search' => 'tasks#search'
  # resources :searches,only:[:index]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
