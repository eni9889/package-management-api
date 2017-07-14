class Package < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  paginates_per Rails.env.production? ? 500 : 10

  has_many   :versions
  belongs_to :developer
  has_and_belongs_to_many :bundles

  scope :with_assoc,     -> { includes(:developer, :versions, :bundles) }
  scope :top_downloads,  -> { unscoped.where('downloads IS NOT NULL').order(downloads: :desc) }

  def to_s
    name
  end
end
