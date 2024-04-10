# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  content         :text(65535)
#  cover_image     :string(255)
#  description     :text(65535)
#  published_at    :datetime
#  readtime        :integer
#  seo_description :text(65535)
#  seo_title       :string(255)
#  slug            :string(255)
#  slug_html       :string(255)
#  status          :integer          default("hidden")
#  title           :string(255)
#  view_count      :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin_id        :integer
#  category_id     :integer
#
# Indexes
#
#  index_posts_on_slug  (slug) UNIQUE
#
class Post < ApplicationRecord
  strip_attributes

  has_many :ip_view_posts, dependent: :destroy
  belongs_to :category
  belongs_to :admin

  enum status: { hidden: 1, visible: 2 }

  validates :title, :slug, :category_id, presence: true
  validates :title, uniqueness: true

  has_one_attached :cover_image

  scope :from_current_month, lambda {
    where("created_at > ? AND created_at < ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month).size
  }

  before_save :should_generate_slug_html, :change_published_at

  class << self
    def ransackable_attributes _auth_object = nil
      %w[title description]
    end
  end

  def increment_view ip_address
    ip_check = ip_view_posts.where(ip_address:)
    return if ip_check.present?

    ip_view_posts.create(ip_address:)
    increment! :view_count
  end

  private

  def should_generate_slug_html
    self.slug_html = "#{slug}.html"
  end

  def change_published_at
    self.published_at = (updated_at || Time.zone.now) if visible? && published_at.blank?
  end
end
