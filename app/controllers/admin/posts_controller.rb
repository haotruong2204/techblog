# frozen_string_literal: true

class Admin::PostsController < Admin::BaseController
  before_action :load_post, only: [:edit, :update, :destroy]

  def index
    @q = Post.ransack params[:q]
    @pagy, @posts = pagy(@q.result.order(created_at: :desc))
    @header_post = true
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      flash[:success] = "Tạo bài viết thành công."
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:success] = "Sửa bài viết thành công."
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = "Xóa bài viết thành công." if @post.destroy
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:slug])
    aws_service = AwsService.new
    aws_service.remove_image @image.key
    @image.purge_later
  end

  private

  def load_post
    @post = Post.find_by(slug: params[:slug])
  end

  def post_params
    pr = params.require(:post).permit(:title, :description, :content, :cover_image, :seo_title,
      :seo_description, :slug, :readtime, :category_id, :view_count, tags: [])
    pr[:status] = params[:post][:status].to_i
    pr[:admin_id] = current_admin_admin.id
    pr
  end
end
