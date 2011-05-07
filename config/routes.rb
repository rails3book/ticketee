EdgeTicketee::Application.routes.draw do
  devise_for :users
  
  get '/awaiting_confirmation', 
    :to => "users#confirmation", 
    :as => 'confirm_user'

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end

  resources :assets

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end
  
  put '/admin/users/:user_id/permissions', 
    :to => 'admin/permissions#update',
    :as => :update_user_permissions
end
