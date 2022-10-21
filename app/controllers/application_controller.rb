class ApplicationController < ActionController::Base
	# Define current_user as available as both a controller method as well as a helper
	# method so we can use it in controllers and views
	helper_method :current_user, :logged_in?

	def current_user
		# Return current user if it exists, if not query db for user matching session id
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def require_user
		if !logged_in?
			flash[:alert] = "You must be logged in to perform that action"
			redirect_to login_path
		end
	end

end
