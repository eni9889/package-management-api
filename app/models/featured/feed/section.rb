class Featured::Feed::Section < ActiveRecord::Base
  acts_as_list scope: :feed
  belongs_to :feed, class_name: 'Featured::Feed'
  belongs_to :target, polymorphic: true
  has_many   :items, -> { order(:position) }
  accepts_nested_attributes_for :items, allow_destroy: true
end
