class TopicImage < ActiveRecord::Base
  
  belongs_to :topic
  
  has_attached_file :image,
#    :styles => {  
#      :original => {  
#        :geometry => '440x280#'
#      }
#    },
    :url => "/uploads/:class/:attachment/:id_:style.jpg",
    :path => ":rails_root/public/uploads/:class/:attachment/:id_:style.jpg"
  
  validates_attachment_presence :image  
  validates_attachment_size :image, :less_than => 1.megabyte, :if => Proc.new { |imports| !imports.image.blank? }, :message => I18n.t("too_big_file_error")
  validates_attachment_content_type :image, :content_type=>['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("image_file_only")
end
