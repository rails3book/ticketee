EdgeTicketee::Application.routes.draw do
  devise_for :users

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
end
