Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

	# Includes all necessary routes for articles controller, can
	# exclude routes by using only: [:what_to_keep]
	resources :articles, only: [:show, :index, :new, :create]
end
