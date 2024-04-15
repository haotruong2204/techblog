# frozen_string_literal: true

class Admin::AccountsController < Admin::BaseController
  before_action :load_account, only: [:edit, :update, :destroy]

  def index
    @q = Account.ransack(params[:q])
    @pagy, @accounts = pagy(@q.result.order(created_at: :desc), items: Settings.per_page.default)
    @header_tag = true
  end

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

  private

  def load_account
    @account = Account.find(params[:id])
  end

  # def tag_params
  #   params.require(:tag).permit Tag::ATTRS
  # end
end
