class PostsController < ApplicationController
  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 15, :order => "id desc"
  end
  
  def new
    if !session[:user_id].nil?
      @post = Post.new
    else
      redirect_to "/login"
    end
  end
  
  def create
    if !session[:user_id].nil?
      @post = Post.new(params[:post])
      @post.save
      redirect_to @post.show_url
    else
      redirect_to "/login"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
end
