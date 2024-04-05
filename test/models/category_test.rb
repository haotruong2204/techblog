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
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
