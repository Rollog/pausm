class VotesController < ApplicationController

	def new
		@vote = Vote.new
	end

	def create
		@vote = Vote.new

		@question = Question.find(params[:id])
		v = @question.votes.create!(params[:vote].permit(:value))

		@question.vote_count += v.value.to_i
		@question.save
		redirect_to question_path(@question)
		
	end
	
end