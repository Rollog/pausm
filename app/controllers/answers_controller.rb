class AnswersController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create!(params[:answer].permit(:body))
		redirect_to @question, :notice => "Answer created!"
	end

	def upvote
		@answer = Answer.find(params[:answer_id])
		@answer.vote_value += 1
	end

end