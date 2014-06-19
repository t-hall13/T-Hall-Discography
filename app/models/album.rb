class Album < ActiveRecord::Base

	has_many :songs#, lambda {order("position ASC")}
	has_attached_file  :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "assets/images/:style/avatar_file_name.jpg"
	belongs_to :admin_user
	belongs_to :artist
	acts_as_list
	# Don't need to validate (in most cases):
	# ids, foreign keys, timestamps, booleans, counters
	# validates_presence_of :name
	# validates_length_of :name, :maximum => 255

	validates :name, :presence => true, 
	          :length => {:maximum => 255}
	validates_attachment_content_type :avatar, :content_type => /\Aimage/
	validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]


	# validates_presence_of vs validates_length_of :minimum => 1
	# different error messages: "can't be blank" or "is too short"
	# validates_length_of allows strings with only spaces!

	scope :sorted, lambda {order("albums.position ASC")}
	scope :newest_first, lambda {order("albums.year DESC")}
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
