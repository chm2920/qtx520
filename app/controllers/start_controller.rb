class StartController < ApplicationController
  
  def index
    @flashpics = Flashpic.all
    @news_topics = NewsTopic.find(:all, :conditions => "news_category_id = 1", :order => "id desc", :limit => 12)
    @topics = Topic.find(:all, :order => "id desc", :limit => 10)
    @posts = Post.find(:all, :order => "id desc", :limit => 10)
  end
  
end
