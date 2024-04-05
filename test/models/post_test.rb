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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
