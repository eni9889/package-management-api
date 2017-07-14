class Bundle < ActiveRecord::Base
  has_and_belongs_to_many :packages, touch: true
  has_and_belongs_to_many :package_versions, touch: true
end
