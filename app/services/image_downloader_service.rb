class ImageDownloaderService
  BUCKET_NAME = 'cydhub-images'
  # @param [Rack::Multipart::UploadedFile] image
  # @param [String] image_key
  def initialize
    s3 = Aws::S3::Resource.new(client: Aws::S3::Client.new)
    @bucket = s3.bucket(BUCKET_NAME) || s3.create_bucket(bucket: BUCKET_NAME)
  end

  def self.get_url(image_key)
    self.new.get_url(image_key)
  end

  def get_url(image_key)
    @bucket.object(image_key).presigned_url(:get, expires_in: 1.hour)
  end
end