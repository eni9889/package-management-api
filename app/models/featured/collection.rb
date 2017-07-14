class Featured::Collection < ActiveRecord::Base
  has_many :items, -> { order(:position) }
  accepts_nested_attributes_for :items, allow_destroy: true

  def image_url
    ImageDownloaderService.get_url("collections/#{self.image}")
  end

  def to_s
    self.name
  end
end
