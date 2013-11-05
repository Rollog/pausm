class Answer
	include Mongoid::Document

	field :body, type: String
	field :answer_count, type: Integer, :default => 0
	# field :vote_value, type: Integer, :default => 0
	
	# belongs_to :user
	belongs_to :question

	# has_many :votes, as: :voteable
end