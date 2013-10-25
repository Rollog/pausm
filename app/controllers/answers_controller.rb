class AnswersController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@answer = @question.answers.new
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def create
		@answer = Answer.create(params[:answer].permit(:body))
		redirect_to :action => "show", :id => @answer._id
	end

	def destroy
		Answer.find(params[:id]).destroy
		redirect_to questions_url
	end


end