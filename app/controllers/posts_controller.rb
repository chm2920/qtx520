#encoding: utf-8
class PostsController < ApplicationController
  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => 15, :order => "id desc"
    @page_title = "社区"
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
      @post.user_id = session[:user_id]
      @post.hits = 0
      @post.reply_count = 0
      @post.save
      redirect_to @post.show_url
    else
      redirect_to "/login"
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @per_page = 10
    if !params[:page].nil?
      @page = params[:page].to_i
    else
      @page = 1
    end
    @replies = Reply.paginate :page => @page, :per_page => @per_page, :conditions => "post_id = #{@post.id}", :order => "id asc"
    @page_title = @post.title
    @keywords = @post.title
    @description = @post.title
  end
  
  def reply
    
  end
  
  def reply_rst
    if request.post?
      if !session[:user_id].nil?
        begin
          @post = Post.find(params[:id])
          @reply = Reply.new(params[:reply])
          @reply.post_id = @post.id
          @reply.user_id = session[:user_id]
          @reply.save!
          @post.reply_count += 1
          @post.save!
        rescue Exception => e
          ActiveRecord::Rollback
          record_error(e)
          render :action => "show", :id => params[:id]
        else
          redirect_to @post.show_url
        end
      else
        redirect_to "/login"
      end
    else
      redirect_to "/reply"
    end
  end
  
end
