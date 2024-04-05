# frozen_string_literal: true

class Client::DashboardController < Client::BaseController
  def index
    @q = Post.ransack params[:q]
    @pagy, @posts = pagy(@q.result.order(created_at: :desc), items: Settings.per_page.client)
  end
end
