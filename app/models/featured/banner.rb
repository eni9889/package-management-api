class Featured::Banner < ActiveRecord::Base
  belongs_to :target, polymorphic: true

  def image_url
    ImageDownloaderService.get_url("banners/#{self.image}")
  end

  def name
    "Banner:#{target || 'target n/a'}"
  end
end