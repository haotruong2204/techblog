# frozen_string_literal: true

class Client::CommentsController < Client::BaseController
  before_action :load_comment, only: [:destroy]

  def create
    @comment = current_account.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    return unless @comment.save

    ActionCable.server.broadcast("comment_channel_#{params[:post_id]}",
      {
        comment_id: @comment.id,
        post_id: @comment.post_id,
        html: render_to_string(partial: "client/comments/comment", locals: { comment: @comment })
      })
  end

  def destroy
    return unless @comment.destroy

    ActionCable.server.broadcast("comment_channel_#{params[:post_id]}",
      {
        is_delete: true,
        comment_id: @comment.id,
        post_id: @comment.post_id
      })
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def load_comment
    @comment = Comment.find(params[:id])
  end
end
