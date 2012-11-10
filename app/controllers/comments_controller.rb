class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def index
		@comments = Comment.all
	end

	def create
		#p = Picture.find_by_id(params[:id])
		c = Comment.new
		c.comment = params[:comment]
		#c.picture_id = p.id
		c.save

		#p = Picture.find_by_id(params[:picture_id])

		redirect_to "/comments"
	end

	def show
		@comments = Comment.find_by_picture_id(params[:id])
	end
end