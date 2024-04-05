# frozen_string_literal: true

class Client::PostsController < Client::BaseController
  before_action :load_post, only: [:show, :draft]

  def show
    @post = Post.find_by(slug: params[:slug])
    @post.increment_view(request.remote_ip)
  end

  def draft
    @post = Post.find_by(slug: params[:slug])
  end

  private

  def load_post
    @post = Post.find_by(slug: params[:slug])
  end
end
