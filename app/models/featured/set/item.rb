class Featured::Set::Item < ActiveRecord::Base
  acts_as_list scope: :set
  belongs_to :set
  belongs_to :package
end
