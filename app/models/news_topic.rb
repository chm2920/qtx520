class NewsTopic < ActiveRecord::Base
  
  belongs_to :news_category
  
  def show_url
    "/news/#{self.created_at.strftime("%Y%m%d")}_#{self.id}.html"
  end
  
end
