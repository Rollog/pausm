class AnswersController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(params[:answer].permit(:body))
		redirect_to @question, notice: "Answer created!"
	end

	def add_answer_count
		@answer = Answer.find(params[:answer_id])
		@answer.answer_count += 1
		@answer.save
		redirect_to :back
	end

end