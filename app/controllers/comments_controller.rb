class CommentsController < ApplicationController

  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.build(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: @comment.user, date: l(@comment.created_at, format: :long)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text, :record_id, :user_id).merge(user_id: current_user.id)
  end
end
