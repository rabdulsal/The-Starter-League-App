class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json

  before_filter :get_comment, :except => [:index, :new]

  def get_comment
      @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    if session["user_id"].blank?
      redirect_to login_url, :notice => "Sorry, you must be a member to do that - Sign up now!"
    else
      @comment = Comment.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @comment }
      end
    end      
  end

  # GET /comments/1/edit
  def edit
    
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new
    @comment.picture_id = params[:comment][:picture_id]
    @comment.user_id = session["user_id"]

    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to @comment, notice: 'Your Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
