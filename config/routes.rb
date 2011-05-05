EdgeTicketee::Application.routes.draw do
  get "users/confirmation"

  get "users/index"

  devise_for :users
  
  get '/awaiting_confirmation', 
    :to => "users#confirmation", 
    :as => 'confirm_user'

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
  
  namespace :admin do
    root :to => "base#index"
    resources :users
  end
end
