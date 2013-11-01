class Question
	include Mongoid::Document

	field :title, type: String
	field :body, type: String
	field :vote_count, type: Integer, :default => 0
	field :tag_list, type: String

	has_many :answers
	has_and_belongs_to_many :tags

	# belongs_to :user

	def self.tagged_with(name)
	  Tag.find_by_name!(name).questions
	end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:tags).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:tag_name).join(", ")
	end

	def tag_list=(names)
  self.tags = names.split(",").map do |n|
    Tag.where(tag_name: n.strip).first_or_create!
	  end
	end

end