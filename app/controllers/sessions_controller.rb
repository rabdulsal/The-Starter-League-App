class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session["user_id"] = user.id
			
			redirect_to root_url
			flash[:notice] = "Welcome back, #{user.name}."
		else
			flash[:notice] = "Sorry, please try again."
			render 'new'
		end

	end

	def destroy
		session["user_id"] = nil
		redirect_to root_url, notice: "Goodbye!"
	end

end