class Review < ApplicationRecord
  RATING_SCALE = 1..5

  belongs_to :professor
  belongs_to :my_class
end
