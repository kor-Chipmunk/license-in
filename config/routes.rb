Rails.application.routes.draw do
	resources :communities
	devise_for :users, controllers: { registrations: 'users/registrations' }

	get '/license/get/:majorid' => 'license#getlicenselist'
	post '/license/get/' => 'license#getlicenselist'
	
	root :to => "home#index"
	match ":controller(/:action(/:id))", :via => [:post, :get]

	post "/license/create/" => "license#create"
	post "/license/:type/:id" => "license#update"
	delete "/license/:type/:id" => "license#destroy"

	# get "/license/:id" => "license#show"
end