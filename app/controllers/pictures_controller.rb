class PicturesController < ApplicationController
	
	def index
		@pictures = Picture.all
	end

	def new     

	end

	def edit

	#	@pic_array = [
	#	"http://upload.wikimedia.org/wikipedia/commons/f/f1/Ruby_logo.png",
 	#   "http://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png",
 	#   "http://www.w3.org/html/logo/downloads/HTML5_Logo_512.png",
 	#   "http://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png",
 	#   "http://upload.wikimedia.org/wikipedia/en/9/9e/JQuery_logo.svg",
 	#   "http://upload.wikimedia.org/wikipedia/en/1/1c/CoffeeScript-logo.png",
 	#   "http://upload.wikimedia.org/wikipedia/commons/3/3b/Haml_1-5_logo.png"
    #]    
	    @pictures = Picture.find_by_id(params[:id])
	end

	def create
		p = Picture.new
		p.url = params[:url]
		#p.note = params[:url]
		p.save
		redirect_to "/pictures"
	end

	def update
		p = Picture.find_by_id(params[:id])
		p.url = params[:url]
		p.save

		redirect_to "/pictures/#{p.id}"
	end	

	def destroy
		p = Picture.find_by_id(params[:id])
		p.destroy
		redirect_to "/pictures"
	end

	def show
		@pic_id = Picture.find_by_id(params[:id])		
	end
	
end