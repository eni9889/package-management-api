class Featured::Feed::Section::Item < ActiveRecord::Base
  acts_as_list scope: :section
  belongs_to :section, class_name: 'Featured::Feed::Section'
  belongs_to :target, polymorphic: true
end
