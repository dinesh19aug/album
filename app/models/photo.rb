class Photo < ActiveRecord::Base
  attr_accessible :image,:pic_name,:description,:albums_id

  belongs_to :albums
  
  mount_uploader :image,ImageUploader
end
