class Answer
	include Mongoid::Document

	field :body, type: String
	
	embedded_in :question, :inverse_of => :answers

	
end