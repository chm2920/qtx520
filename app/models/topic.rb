class Topic < ActiveRecord::Base
  
  has_many :topic_images, :dependent => :destroy
  belongs_to :user
  belongs_to :node
  belongs_to :category
  
  validates_presence_of :node_id, :category_id, :title, :content, :city, :validate_date, :contact, :phone

  def show_url
    "/info/#{self.created_at.strftime("%Y%m%d")}_#{self.id}.html"
  end
  
end
