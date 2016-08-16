Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  
  root to: 'index#index'
=======
  root :to => "home#index"
  match ":controller(/:action(/:id))", :via => [:post, :get]
 
>>>>>>> yeseul
end
