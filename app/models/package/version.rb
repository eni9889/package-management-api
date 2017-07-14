class Package::Version < ActiveRecord::Base
  default_scope { order('package_versions.created_at DESC') }

  store_accessor :meta_data, :download_state, :error_info

  belongs_to :package, touch: true
  has_many :ratings
  has_many :download_counts, as: :target

  has_and_belongs_to_many :bundles
  has_and_belongs_to_many :executables

  scope :pending,   -> { where("package_versions.meta_data->>'download_state' = 'pending' OR (package_versions.meta_data->>'download_state') IS NULL") }
  scope :processed, -> { where("package_versions.meta_data->>'download_state' = 'processed'") }
  scope :failed,    -> { where("package_versions.meta_data->>'download_state' = 'unable to download' OR package_versions.meta_data->>'download_state' = 'wrong md5' OR package_versions.meta_data->>'download_state' = 'unable to parse' ") }

  def processed?
    self.download_state == 'processed'
  end

  def deb_url

  end

  def s3_key

  end

  def downloads=(count)
    count = count.to_i
    if count > 0 && count != self.downloads
      self[:downloads] = count
      self.download_counts.create!(count: count)
    end
  end
end
