class NewsTopicsController < ApplicationController
  
  def index
    @topics = NewsTopic.paginate :page => params[:page], :per_page => 15, :conditions => "news_category_id = 1", :order => "id desc"
  end
  
  def show
    @topic = NewsTopic.find(params[:id])
  end
  
end
