Rails.application.routes.draw do
  root :to => 'tasks#index'
  scope "(:locale)", locale: /en|ja/ do
  resources :tasks
  end
end
