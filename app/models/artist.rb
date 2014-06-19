class Artist < ActiveRecord::Base
	has_many :albums


validates :name, :presence => true, 
	          :length => {:maximum => 255}

	          
	scope :sorted, lambda {order("artists.id DESC")}
end
