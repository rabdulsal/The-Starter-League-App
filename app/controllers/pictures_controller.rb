class PicturesController < ApplicationController
	def index
		@size = params["size"]
		@color = params["color"]
	end
end