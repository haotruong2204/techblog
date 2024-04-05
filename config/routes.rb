Rails.application.routes.draw do
  require "sidekiq/web"
  require "sidekiq-status/web"

  mount Ckeditor::Engine => "/ckeditor"
  mount Sidekiq::Web => "/sidekiq"

  root "client/dashboard#index"
  scope module: "client", path: "", as: "" do
    devise_for :accounts, path: "", path_names: { sign_in: "login", sign_out: "logout" }

    resources :posts, param: :slug, only: [:show, :index] do
      get :draft, on: :member
    end

    resources :comments, only: [:create, :destroy, :edit] do
      collection do
        get :show_subcomment
        post :create_subcomment
      end
    end
  end

  namespace :admin do
    root "dashboard#index"
    devise_for :admins, path: "", path_names: { sign_in: "login", sign_out: "logout" }
    resources :posts, param: :slug do
      delete :delete_image_attachment, on: :member
    end

    resources :categories, param: :slug do
      delete :delete_image_attachment, on: :member
    end
  end
end
