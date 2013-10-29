class Profile
	include Mongoid::Document

	field :real_name, type String
	field :location, type String
	field :specialties, type String

	# belongs_to :user

end