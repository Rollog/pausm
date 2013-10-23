class Answer
	include Mongoid::Document

	field :subject, type: String
	field :description, type: String
	
	embedded_in :question
end