Invite::Application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "profile" => "users#profile", :as => "profile"
  put "profile" => "users#update_profile", :as => "profile"
  delete 'session' => "sessions#destroy", :as => "log_out"
  resources :users  
  resources :sessions 
  root :to => 'home#index'
  
  namespace :admin do
     resources :users
     resources :invitations, :only => [:index, :show, :create,:new]
     root :to => "users#index"
  end
end
