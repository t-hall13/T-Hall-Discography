class AdminUser < ActiveRecord::Base

	# To configure a different table name:
	# self.table_name = "admin_users"
	
	has_secure_password

	has_and_belongs_to_many :albums
	has_and_belongs_to_many :songs

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	#FORBIDDEN_USERNAMES = ['superjackass', 'johnnyfuckstik', 'whatamaroon']


	# validates_presence_of :first_name
	# validates_length_of :first_name, :maximum => 25
	# validates_presence_of :last_name
	# validates_length_of :last_name, :maximum => 50
	# validates_presence_of :username
	# validates_length_of :username, :within => 7..25
	# validates_uniqueness_of :username
	# validates_presence_of :email
	# validates_length_of :email, :maximum => 100
	# validates_format_of :email, :with => EMAIL_REGEX
	# validates_confirmation_of :email

	# sexy validations, compare to above

	validates :first_name, :presence => true,
						   :length => {:maximum => 25}
	validates :last_name, :presence => true,
						 :length => {:maximum => 25}
	validates :username, :length => {:within => 7..25},
	                      :uniqueness => true					 						

	validates :email, :presence => true, 
				:length => {:maximum => 100},
				:format => {:with => EMAIL_REGEX},
				:confirmation => true

	# validate :username_is_allowed
	# validate :no_new_users_on_wednesday, :on => :create

	scope :sorted, lambda {order("last_name ASC, first_name ASC")}

	def name
		"#{first_name} #{last_name}" 
	end
	
	
	# def username_is_allowed
	# 	if FORBIDDEN_USERNAMES.include?(username)
	# 		errors.add(:username, "has been restricted from use.")
	# 	end			
	# end
    # an example of custom validation

	# def no_new_users_on_wednesday
	# 	if Time.now.wday == 3
	# 		errors[:base] << "No new users on Wednesdays."
	# 	end
	# end
end
