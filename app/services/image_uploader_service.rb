class ImageUploaderService
  BUCKET_NAME = 'cydhub-images'
  # @param [Rack::Multipart::UploadedFile] image
  # @param [String] image_key
  def initialize(image, image_key = SecureRandom.uuid)
    @image      = image
    @image_key  = image_key

    s3 = Aws::S3::Resource.new(client: Aws::S3::Client.new)

    @bucket = s3.bucket(BUCKET_NAME) || s3.create_bucket(bucket: BUCKET_NAME)
    @s3_file = save_file_to_s3(image_file)
  end

  private

  def save_file_to_s3(file, bucket = @bucket)
    bucket.put_object(key: @image_key, body: file)
  end

  def image_file
    @image.respond_to?(:[]) ? @image[:tempfile] : @image
  end
end