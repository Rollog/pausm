class AnswersController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create!(params[:answer].permit(:body))
		redirect_to @question, :notice => "Answer created!"
	end
end