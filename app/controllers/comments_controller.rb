class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id 
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
