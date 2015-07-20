class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id 
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def new
    authorize @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
