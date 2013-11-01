class TagsController < ApplicationController

	def create
		@tag = @question.tags.create(params[:tag].permit(:tag_name))
		redirect_to :action => "show", :id => @tag._id
	end

end