# frozen_string_literal: true

# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :bigint           not null, primary key
#  data_content_type :string(255)
#  data_file_name    :string(255)      not null
#  data_file_size    :integer
#  data_fingerprint  :string(255)
#  type              :string(30)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_ckeditor_assets_on_type  (type)
#
class Ckeditor::Picture < Ckeditor::Asset
  # for validation, see https://github.com/igorkasyanchuk/active_storage_validations

  def url_content
    "#{ENV['S3_URL_PREFIX']}#{storage_data.key}"
  end

  def url_thumb
    rails_representation_url(storage_data.variant(resize_to_fill: [118, 100]).processed, only_path: true)
  end
end
