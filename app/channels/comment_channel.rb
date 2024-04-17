# frozen_string_literal: true

class CommentChannel < ApplicationCable::Channel
  def subscribed
    return unless params[:post_id]

    stream_from "comment_channel_#{params[:post_id]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
