class Package::DownloadCount < ActiveRecord::Base
  belongs_to :target, polymorphic: true
end