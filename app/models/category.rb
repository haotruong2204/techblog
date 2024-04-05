# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id              :bigint           not null, primary key
#  content         :text(65535)
#  image_url       :text(65535)
#  seo_description :text(65535)
#  seo_title       :string(255)
#  slug            :string(255)
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
  strip_attributes

  ATTRS = [:title, :image_url, :content, :slug, :seo_title, :seo_description].freeze

  has_many :posts, dependent: :destroy
  has_one_attached :image_url

  validates :title, :slug, presence: true
  validates :title, uniqueness: true

  class << self
    def ransackable_attributes _auth_object = nil
      ["title"]
    end
  end
end
