class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
	end

	def edit
    @question = Question.find(params[:id])
  end

	def create
		@question = Question.create(params[:question].permit(:title, :body))
		redirect_to :action => "show", :id => @question._id
	end

	def destroy
		Question.find(params[:id]).destroy
		redirect_to questions_url
	end

end