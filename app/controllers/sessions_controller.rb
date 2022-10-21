class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id

			flash[:notice] = "You have logged in successfully"
			redirect_to articles_path
		else
			# Flash.now used for notices where you don't redirect to another page 
			flash.now[:alert] = "Your email or password are incorrect"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out"
		redirect_to root_path
	end

end