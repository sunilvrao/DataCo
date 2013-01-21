Ddk::Application.routes.draw do

  match "/users/auth/:provider/callback" => "sessions#create"
  devise_for :users

  root :to => 'home#index'

  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
