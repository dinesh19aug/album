class Photo < ActiveRecord::Base

#Attributes or fileds
  attr_accessible :image,:pic_name,:description,:albums_id

#associations
  belongs_to :albums
  
#carrier wave  
  mount_uploader :image,ImageUploader

#Validations
validates :description,:pic_name,:albums_id, :presence=>true

end
