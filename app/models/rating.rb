class Rating < ActiveRecord::Base
  has_one :comment
  belongs_to :version, touch: true
  belongs_to :user, touch: true
end
