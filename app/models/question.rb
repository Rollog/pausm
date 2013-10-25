class Question
	include Mongoid::Document
	
	field :title, type: String
	field :body, type: String

	embeds_many :answers
	
end