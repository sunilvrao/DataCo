Ddk::Application.routes.draw do


  resources :contents

  resources :subscriptions, :only => [:new, :create]

  match "/users/auth/:provider/callback" => "sessions#create"
  devise_for :users

  root :to => 'home#index'
  get ':page_name' => 'contents#show' # all requests matching content/cms_page will go ContentController, show method
  #match ':page_name' => 'contents#show'  
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
