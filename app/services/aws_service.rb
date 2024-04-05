# frozen_string_literal: true

require "aws-sdk-s3"

class AwsService
  def remove_image image_key
    s3 = Aws::S3::Client.new
    bucket_name = ENV.fetch("AWS_S3_BUCKET", nil)
    # image_key = "#{ENV.fetch('S3_URL_PREFIX', nil)}#{image_key}"
    s3.delete_object(bucket: bucket_name, key: image_key)
  end
end
