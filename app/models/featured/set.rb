class Featured::Set < ActiveRecord::Base
  has_many :items, -> { order(:position) }
  has_many :feed_sections, class_name: 'Featured::Feed::Section', as: :target
  accepts_nested_attributes_for :items, allow_destroy: true
end
