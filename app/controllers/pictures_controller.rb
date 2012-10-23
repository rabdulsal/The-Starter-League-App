class PicturesController < ApplicationController
	
	def home

		#params = {"id" => "1"}

		@pic_array = [
		"http://upload.wikimedia.org/wikipedia/commons/f/f1/Ruby_logo.png",
 	   "http://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png",
 	   "http://www.w3.org/html/logo/downloads/HTML5_Logo_512.png",
 	   "http://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png",
 	   "http://upload.wikimedia.org/wikipedia/en/9/9e/JQuery_logo.svg",
 	   "http://upload.wikimedia.org/wikipedia/en/1/1c/CoffeeScript-logo.png",
 	   "http://upload.wikimedia.org/wikipedia/commons/3/3b/Haml_1-5_logo.png"
    ]
		
		@pic = (params["image"].to_i) - 1
		@width = params["width"]
		@height = params["height"]

	end

	def show
		@gif_array = ["http://s3.newathens.org/files/ibvBaT090XHXu1.gif", "http://s3.newathens.org/files/TtYVO.gif", "http://i.imgur.com/E6bS1.gif"]
		@gif = params[:id].to_i
	end

	def index

	#	@pic_array = [
	#	"http://upload.wikimedia.org/wikipedia/commons/f/f1/Ruby_logo.png",
 	#   "http://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png",
 	#   "http://www.w3.org/html/logo/downloads/HTML5_Logo_512.png",
 	#   "http://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png",
 	#   "http://upload.wikimedia.org/wikipedia/en/9/9e/JQuery_logo.svg",
 	#   "http://upload.wikimedia.org/wikipedia/en/1/1c/CoffeeScript-logo.png",
 	#   "http://upload.wikimedia.org/wikipedia/commons/3/3b/Haml_1-5_logo.png"
    #]    
	    if params["url"]
	    	p = Picture.new
	    	p.url = params["url"]
	    	p.save
	    end
	    @pictures = Picture.all

	end

	def brady

    @photo_urls = [
    	"http://static.nfl.com/static/content/public/photo/2012/10/16/0ap1000000081197.jpg", 
    	"http://static.nfl.com/static/content/public/photo/2012/10/14/0ap1000000080282.jpg", 
    	"http://www.trbimg.com/img-507d9f92/turbine/chi-transcript-nhls-bettman-on-latest-proposal-20121016/187/16x9",
    	"http://s3.newathens.org/files/ibvBaT090XHXu1.gif", 
    	"http://s3.newathens.org/files/TtYVO.gif", 
    	"http://i.imgur.com/E6bS1.gif"
    ]

    @word = params[:word]
    @number = params[:number].to_i

    #params = {"id" => "1"}

   @pic = params[:id].to_i

	end
end