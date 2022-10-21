Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "articles#home"

	# Includes all necessary routes for articles controller, can
	# exclude routes by using only: [:what_to_keep]
	resources :articles

	# Custom url for users#new action
	get "signup", to: "users#new"
	resources :users, except: [:new]

	# Routes for sessions controller for user login/authentication
	get "login", to: "sessions#new"
	post "login", to: "sessions#create"
	delete "logout", to: "sessions#destroy"
end
