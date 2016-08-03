Rails.application.routes.draw do
  root 'home#index'
  
  get '/' => 'home#index'
  get '/application' => 'home#application'
  get '/main' => 'home#main'
  get '/calendar' => 'home#calendar'
  get '/community' => 'home#community'
  get '/book' => 'home#book'
  get '/search' => 'home#search'

  devise_for :users
 
end
