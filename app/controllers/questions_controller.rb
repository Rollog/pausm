class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(params[:question].permit(:title, :body, :tag_list))
		redirect_to :action => "show", :id => @question._id

		@question.vote_count = 0

	end

	def show
		@question = Question.find(params[:id])
	end

	def edit
    @question = Question.find(params[:id])
  end

  def update
  	@question = Question.find(params[:id])

  	if @question.update_attributes(params[:question].permit(:title, :body, :tag_list))
    redirect_to @question
	  else
	  	render 'edit'
	  end
  end

  def upvote
  	@question = Question.find(params[:id])  	
		@question.vote_count += 1

  	@question.save

  	redirect_to :back
  end

  def downvote
  	@question = Question.find(params[:id])
  	@question.vote_count -= 1

  	@question.save
  	redirect_to :back
  end

  # def add_tags
		# @question = Question.find(params[:id])
		# @tag = @question.tags.create!(params[:tag].permit(:tag_name))
		# redirect_to @question, notice: "Answer created!"
  # end

	def destroy
		Question.find(params[:id]).destroy
		redirect_to questions_url
	end

end