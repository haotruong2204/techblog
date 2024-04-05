# frozen_string_literal: true

class Admin::TagsController < Admin::BaseController
  # before_action :load_tag, only: [:edit, :update, :destroy]

  # def index
  #   @q = Tag.ransack(params[:q])
  #   @tags = @q.result.order(created_at: :desc).page(params[:page]).per Settings.pagination.default
  #   @header_tag = true
  # end

  # def new
  #   @tag = Tag.new
  # end

  # def create
  #   @tag = Tag.new tag_params

  #   if @tag.save
  #     flash[:success] = "The save was successful."
  #     redirect_to admin_tags_path
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @tag.update tag_params
  #     flash[:success] = "The save was successful."
  #     redirect_to admin_tags_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   flash[:success] = "The delete was successful." if @tag.destroy
  # end

  # private

  # def load_tag
  #   @tag = Tag.find(params[:id])
  # end

  # def tag_params
  #   params.require(:tag).permit Tag::ATTRS
  # end
end
