class PicturesController < ApplicationController

# ----------------------------- PICTURES ---------------------------------

	def index
		@pictures = Picture.all		
	end

	def new     
		if session["user_id"].blank?
			redirect_to(new_user_url, notice: "Sorry, you must be signed-in to do that.")
		else
		@pictures = Picture.new
		end	
	end

	def edit
	    @pictures = Picture.find_by_id(params[:id])
	end

	def create
		p = Picture.new
		p.url = params["picture"]["url"]		
		p.save
		redirect_to "/pictures"
	end

	def update
		p = Picture.find_by_id(params[:id])
		p.url = params["picture"]["url"]
		p.save

		redirect_to "/pictures/#{p.id}"
	end	

	def destroy
		p = Picture.find_by_id(params[:id])
		p.destroy
		redirect_to "/pictures"
	end

	def show
		@vote = Vote.new
		@pic_id = Picture.find_by_id(params[:id])
		@comments = Comment.where(:picture_id => params[:id])			
	end

# ----------------------------- COMMENTS ---------------------------------

	def comment_create
		p = Picture.find_by_id(params[:id])
		c = Comment.new
		c.comment = params[:comment]
		c.picture_id = p.id
		c.save

		redirect_to "/pictures/#{p.id}"
	end

	def comment_index
		@comments = Comment.all.reverse	 
	end

	def comment_show
		@comments = Comment.where(:picture_id => params[:id])
	end

	def comment_destroy
		@c = Comment.find_by_id(params[:id])
		@c.destroy

		redirect_to "/comments"
	end

# ----------------------------- VOTES ---------------------------------

	def new_vote
		@votes = Vote.new
	end

	def vote_create
		p = Picture.find_by_id(params[:id])
		v = Vote.new
		v.vote = params["vote"]["vote"]
		v.picture_id = p.id		
		v.save
		redirect_to "/pictures/#{p.id}"
	end
	
end