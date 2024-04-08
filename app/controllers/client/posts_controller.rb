# frozen_string_literal: true

class Client::PostsController < Client::BaseController
  before_action :load_post, only: [:show, :draft]

  def index
    @q = Post.ransack params[:q]
    @pagy, @posts = pagy(@q.result.where(status: :visible).order(created_at: :desc), items: Settings.per_page.client)
  end

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
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found unless @post
  end
end
