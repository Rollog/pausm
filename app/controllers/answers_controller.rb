class AnswersController < ApplicationController

	def index
		@answers = Answer.all
	end

	def new
		@answer = Answer.new

	end

	def show
		@answer = Answer.find(params[:id])
	end

	def create
		@answer = Answer.create(params[:answer].permit(:body))
		redirect_to questions_url :action => "show", :id => @answer._id
		@answer.question = @question.find(params[:id])
		
		# @answer.user = current_user
	end

	def destroy
		Answer.find(params[:id]).destroy
		redirect_to questions_url
	end


end