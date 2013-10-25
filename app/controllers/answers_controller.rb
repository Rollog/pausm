class AnswersController < ApplicationController
	def create
		@question = Question.create(params[:question].permit(:title, :body))
		redirect_to :action => "show", :id => @question._id
	end
end