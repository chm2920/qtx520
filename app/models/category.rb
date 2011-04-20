class Category < ActiveRecord::Base
  
  belongs_to :node
  has_many :topics
  
  def show_url
    "/category/#{self.id}"
  end
  
end
