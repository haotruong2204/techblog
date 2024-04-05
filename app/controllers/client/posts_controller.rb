# frozen_string_literal: true

class Client::PostsController < Client::BaseController
  def show
    @post = Post.find_by(slug: params[:slug])
    @post.increment_view(request.remote_ip)
  end
end
