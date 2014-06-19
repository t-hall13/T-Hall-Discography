
class Song < ActiveRecord::Base

	belongs_to :album
	#has_and_belongs_to_many :writers
	#belongs_to :admin_user
    acts_as_list :scope => :album
	# validates_presence_of :name
	# validates_length_of :name, :maximum => 255
	#  :permalink
	# validates_length_of :permalink, :within => 3..255
	before_validation :add_default_permalink
	after_save :touch_album

	validates :name, :presence => :true,
					 :length => {:maximum => 255}
	validates :permalink, :presence => :true,
						  :length => {:within => 3..255},
						  :uniqueness => {:scope => :album_id}




	# use presence_of with length_of to disallow spaces
	#validates_uniqueness_of :permalink, :scope => :album_id
	# for unique values by album use ":scope => :album_id"

	scope :sorted, lambda {order("songs.position ASC")}
	#scope :search_writers, lambda {|query| where(["writer LIKE ?", "%#{query}%"])}

	private

	def add_default_permalink
		if permalink.blank?
			self.permalink = "#{id}-#{name.parameterize}"
		end
	end	

	def touch_album
		#touch is similar to:
		#album.update_attribute(:updated_at, Time.now)
		album.touch
	end


end
