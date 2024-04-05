# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                  :bigint           not null, primary key
#  avatar_url          :text(65535)
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  full_name           :string(255)      not null
#  remember_created_at :datetime
#  role                :string(255)      default("administrator"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#
class Admin < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  enum role: { administrator: "administrator", collaborator: "collaborator" }

  has_many :posts, dependent: :destroy
end
