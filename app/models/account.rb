# == Schema Information
#
# Table name: accounts
#
#  id                  :bigint           not null, primary key
#  avatar              :text(65535)
#  current_sign_in_at  :datetime
#  current_sign_in_ip  :string(255)
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  expires_at          :datetime
#  failed_attempts     :integer          default(0), not null
#  full_name           :string(255)      not null
#  last_sign_in_at     :datetime
#  last_sign_in_ip     :string(255)
#  locked_at           :datetime
#  provider            :string(255)
#  refresh_token       :string(255)
#  remember_created_at :datetime
#  role                :string(255)      default("normal"), not null
#  sign_in_count       :integer          default(0), not null
#  token               :string(255)
#  uid                 :string(255)
#  unlock_token        :string(255)
#  user_name           :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_accounts_on_email         (email) UNIQUE
#  index_accounts_on_unlock_token  (unlock_token) UNIQUE
#  index_accounts_on_user_name     (user_name) UNIQUE
#
class Account < ApplicationRecord
  devise :database_authenticatable, :async, :rememberable, :trackable, :lockable,
    :omniauthable, :validatable, omniauth_providers: [:google_oauth2]

  has_many :comments, dependent: :destroy

  ATTRS = [:role].freeze

  enum role: { normal: "normal", admin: "admin" }

  before_save :set_user_name

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar = auth.info.image
      user.role = "normal"
    end
  end

  private

  def set_user_name
    self.user_name = email.split("@").first
  end
end
