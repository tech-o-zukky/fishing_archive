class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, recored_id: params[:record_id])
  end
end
