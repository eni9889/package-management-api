class Package::Author < ActiveRecord::Base
  default_scope { order('package_authors.created_at DESC') }

  has_many :packages

  belongs_to :identifier, class_name: 'Developer::Identifier'

  scope :with_dev_id, -> { where('dev_id IS NOT NULL') }
end
