Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "articles#home"

	# Includes all necessary routes for articles controller, can
	# exclude routes by using only: [:what_to_keep]
	resources :articles

	get "signup", to: "users#new"
	resources :users, except: [:new]
end
