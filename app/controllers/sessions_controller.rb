class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session["user_id"] = user.id
			
			redirect_to "/pictures"
			flash[:notice] = "Welcome back, #{user.name}."
		else
			flash[:notice] = "Sorry, please try again."
			render 'new'
		end

	end

	def destroy
		session["user_id"] = nil
		redirect_to "/pictures", notice: "Goodbye!"
	end

end