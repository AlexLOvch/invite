Invite::Application.routes.draw do
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "profile" => "users#profile", :as => "profile"
  put "profile" => "users#update_profile", :as => "profile"
  delete 'session' => "sessions#destroy", :as => "log_out"
  resources :users  
  resources :sessions 
  root :to => 'home#index'
  
  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
