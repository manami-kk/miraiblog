class PostsController < ApplicationController
  
  before_action :user_authentication, except: :index

  def index
    @posts = Post.order('future_date DESC')
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(text: post_params[:text], image: post_params[:image], title: post_params[:title], future_date: post_params[:future_date], user_id: current_user.id)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:text, :image, :title, :future_date)
  end

  def user_authentication
    authenticate_user!
    flash[:notice] = "Please log in to read more!"
  end
end
