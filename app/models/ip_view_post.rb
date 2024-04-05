# frozen_string_literal: true

# == Schema Information
#
# Table name: ip_view_posts
#
#  id         :bigint           not null, primary key
#  ip_address :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
class IpViewPost < ApplicationRecord
end
