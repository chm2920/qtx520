#encoding: utf-8
class NewsTopicsController < ApplicationController
  
  def index
    @topics = NewsTopic.paginate :page => params[:page], :per_page => 15, :conditions => "news_category_id = 1", :order => "id desc"
    @page_title = "青铜峡新闻"
  end
  
  def show
    @topic = NewsTopic.find(params[:id])
    @page_title = @topic.title
    @keywords = @topic.title
    @description = @topic.title
  end
  
end
