class Featured::Collection::Item < ActiveRecord::Base
  belongs_to :collection
  belongs_to :set
  acts_as_list scope: :collection
end
