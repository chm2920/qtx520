class Post < ActiveRecord::Base
  
  has_many :replies
  belongs_to :user
  
  def show_url
    "/posts/#{self.id}"
  end
  
end
