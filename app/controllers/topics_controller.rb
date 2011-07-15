class TopicsController < ApplicationController
  
  def node
    @node = Node.find(params[:id])
    @categories = @node.categories
    @topics = Topic.paginate :page => params[:page], :per_page => 20, :conditions => "node_id = #{@node.id}", :order => "created_at desc"
  end
  
  def category
    @category = Category.find(params[:id])
    @node = @category.node
    @topics = Topic.paginate :page => params[:page], :per_page => 20, :conditions => "category_id = #{@category.id}", :order => "created_at desc"
  end
  
  def show
    @topic = Topic.find(params[:id])
    @category = @topic.category
    @node = @category.node
  end
  
  def new
    @nodes = Node.all
    @topic = Topic.new
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    end
  end
  
  def create
    if request.post?
      @topic = Topic.new(params[:topic])
      if !session[:user_id].nil?
        @topic.user_id = session[:user_id]
      end
      ActiveRecord::Base.transaction do
        begin
          @category = Category.find(params[:topic][:category_id])
          @node = @category.node
          @topic.node_id = @node.id
          @topic.status = 0
          @topic.save!
          if !params[:topic_image].nil?
            0.upto params[:topic_image].length-1 do |i|
              @topic_image = TopicImage.new()
              @topic_image.image = params[:topic_image][i.to_s][:image]
              @topic_image.topic_id = @topic.id
              @topic_image.save!
            end 
          end
        rescue Exception => e
          ActiveRecord::Rollback
          record_error(e)
          @nodes = Node.all
          render :action => "new"
        else
          render :action => "create"
        end
      end
    else
      redirect_to "new"
    end
  end
  
end
