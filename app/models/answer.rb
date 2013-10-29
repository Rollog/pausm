class Answer
	include Mongoid::Document

	field :body, type: String
	field :vote_value, type: Integer, :default => 0
	
	embedded_in :question, :inverse_of => :answers

	def method_name
		
	end

end