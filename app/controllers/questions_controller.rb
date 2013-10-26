class QuestionsController < ApplicationController

	def index
		@questions = Question.all

		respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
	end

	def new
		@question = Question.new

		respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @question }
    end
	end

	def show
		@question = Question.find(params[:id])
	end

	def edit
    @question = question.find(params[:id])
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