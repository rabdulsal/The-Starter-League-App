class PicturesController < ApplicationController

# ----------------------------- PICTURES ---------------------------------

	def index
		@pictures = Picture.all				
	end

	def new     
		if session["user_id"].blank?
			redirect_to(login_url, notice: "Sorry, you must be signed-in to do that.")
		else
		@pictures = Picture.new
		end			
	end

	def edit
	    @pictures = Picture.find_by_id(params[:id])
	end

	def create
		@p = Picture.new(params[:picture])
		
		respond_to do |format|
			if @p.save
				format.js { render 'create' }
				format.html { redirect_to root_url, notice: 'Your Picture was successfully uploaded.' }
	        	format.json { render json: @p, status: :created, location: @p }
	        else
	        	format.html { render action 'new' }
	        	format.json { render json: @p, status: :created, location: @p }
	        end
		end
	end

	def update
		p = Picture.find_by_id(params[:id])
		p.url = params["picture"]["url"]
		p.save

		redirect_to "/pictures/#{p.id}"
	end	

	def destroy
		@p = Picture.find_by_id(params[:id])
		@p.destroy
		
		respond_to do |format|
			format.js { render 'destroy' }
			format.html { redirect_to root_url }
			format.json { head :no_content }
		end
	end

	def show
		@vote = Vote.new
		@pic_id = Picture.find_by_id(params[:id])
		@comments = Comment.where(:picture_id => params[:id])			
	end

# ----------------------------- COMMENTS ---------------------------------

	def comment_create
		@p = Picture.find_by_id(params[:id])
		@c = Comment.new
		@c.comment = params[:comment]
		@c.picture_id = @p.id
		
		respond_to do |format|
			if @c.save
				format.js { render 'create_comment' }
				format.html { redirect_to root_url, notice: 'Your Comment was created.' }
	        	format.json { render json: @p, status: :created, location: @p }
	        else
	        	format.html { render action 'new' }
	        	format.json { render json: @p, status: :created, location: @p }
	        end
		end
	end

	def comment_edit
	    @pictures = Picture.find_by_id(params[:id])
	end

	def comment_update
		p = Picture.find_by_id(params[:id])
		p.url = params["picture"]["url"]
		p.save

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

		respond_to do |format|
			format.js { render 'destroy_comment' }
			format.html { redirect_to root_url }
		end
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