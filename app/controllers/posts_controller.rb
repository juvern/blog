class PostsController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update,:new,:create,:destroy]

  def index
  	@posts = Post.paginate(page: params[:page], :per_page => 2).order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_url
  end


  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end

  	def logged_in_user
  		unless logged_in?
  			redirect_to root_url
  		end
  	end
end