# frozen_string_literal: true

class Client::PostsController < Client::BaseController
  before_action :load_post, only: [:show]

  def index
    @q = Post.ransack params[:q]
    @pagy, @posts = pagy(@q.result.where(status: :visible).order(created_at: :desc), items: Settings.per_page.client)
  end

  def show
    @post.increment_view(request.remote_ip)
  end

  def draft
    @post = Post.where(slug: params[:slug], status: :hidden).first
  end

  private

  def load_post
    @post = Post.find_by(slug: params[:slug], status: :visible)
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found unless @post
  end
end
