class Category < ActiveRecord::Base
  has_one :featured_feed, class_name: 'Featured::Feed'
end
