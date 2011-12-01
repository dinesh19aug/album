class Albums < ActiveRecord::Base
  has_many :photo , :dependent => :destroy
end
