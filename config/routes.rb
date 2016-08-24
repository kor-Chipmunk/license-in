Rails.application.routes.draw do
  resources :books
  resources :communities
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  root :to => "home#index"
  match ":controller(/:action(/:id))", :via => [:post, :get]
  
  get '/license/myAim' => 'license#myAim'
  get '/license/show/:id' => 'icense#search'
end
