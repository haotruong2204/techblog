# frozen_string_literal: true

class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @q = Category.ransack(params[:q])
    @pagy, @categories = pagy(@q.result.order(created_at: :desc), items: Settings.per_page.default)
    @header_category = true
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = "Tạo danh mục thành công."
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update category_params
      flash[:success] = "Cập nhật danh mục thành công."
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = "Xóa danh mục thành công." if @category.destroy
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:slug])
    aws_service = AwsService.new
    aws_service.remove_image @image.key
    @image.purge_later
  end

  private

  def load_category
    @category = Category.find_by(slug: params[:slug])
  end

  def category_params
    params.require(:category).permit Category::ATTRS
  end
end
