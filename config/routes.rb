Rails.application.routes.draw do
  root :to => 'tasks#index'
  scope "(:locale)", locale: /en|ja/ do
  resources :tasks
  end
  get 'search' => 'tasks#search'
  # resources :searches,only:[:index]
end
