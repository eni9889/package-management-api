class Developer::Identifier < ActiveRecord::Base
  belongs_to :developer
  has_many :package_authors, class_name: 'Package::Author'
  has_many :packages, through: :package_authors

  validates_uniqueness_of :identifier, scope: [:identifier_type]

  scope :by_dev,   -> { where(identifier_type: 'dev_id')}
  scope :by_email, -> { where(identifier_type: 'email')}
  scope :by_name,  -> { where(identifier_type: 'name')}
end
