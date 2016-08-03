Rails.application.routes.draw do
<<<<<<< HEAD
  root 'home#index'
  
  get '/' => 'home#index'
  get '/application' => 'home#application'
  get '/main' => 'home#main'
  get '/calendar' => 'home#calendar'
  get '/community' => 'home#community'
  get '/book' => 'home#book'
  get '/search' => 'home#search'
=======
<<<<<<< HEAD
  root "home#index"
  get 'home/index'

=======
  devise_for :users
>>>>>>> refs/remotes/origin/master
>>>>>>> origin/noodi
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
 
end
