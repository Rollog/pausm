class Answer
	include Mongoid::Document

	field :body, type: String
	# field :vote_value, type: Integer, :default => 0
	
	# belongs_to :user
	belongs_to :question

	# has_many :votes, as: :voteable
end