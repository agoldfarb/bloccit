class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
    if @post.update_attributes(params.require(:question).permit(:title, :body))
       flash[:notice] = "Question was updated."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end

  end
end
