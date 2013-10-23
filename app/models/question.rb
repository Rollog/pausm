class Question
	include Mongoid::Document

	field :subject, type: String
	field :description, type: String

	embeds_many :answers
	
end