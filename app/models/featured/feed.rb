class Featured::Feed < ActiveRecord::Base
  belongs_to :category
  has_many   :sections, -> { order(:position) }, class_name: 'Featured::Feed::Section'
  accepts_nested_attributes_for :sections, allow_destroy: true

  def to_s
    "Feed:#{category.name}"
  end
end
