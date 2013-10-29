class Vote

	# include Mongoid::Document

	# field :upvote, type: Integer, :default => 0
	# field :downvote, type: Integer, :default => 0

	# belongs_to :answer

	# def add_vote(:upvote, by = 1)
	# 	self[:upvote]
	# 	self[:upvote] += by
	#   self
	# end

	# def down_vote
	# 	self.decrement(:downvote => 1)
	# end

end