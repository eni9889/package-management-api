class Comment < ActiveRecord::Base
  belongs_to :rating, touch: true
end
