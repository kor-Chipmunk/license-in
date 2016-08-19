Rails.application.routes.draw do
	resources :communities
	devise_for :users, controllers: { registrations: 'users/registrations' }

	root :to => "home#index"
	match ":controller(/:action(/:id))", :via => [:post, :get]

	post "/license/create/" => "license#create"

end

