EdgeTicketee::Application.routes.draw do
  get "users/index"

  devise_for :users

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
  
  namespace :admin do
    resources :users
  end
end
