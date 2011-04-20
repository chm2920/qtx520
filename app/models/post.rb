class Post < ActiveRecord::Base
  
  has_many :posts
  belongs_to :post
  belongs_to :user
  
  def show_url
    "/posts/#{self.id}"
  end
  
end
