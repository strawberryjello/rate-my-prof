class Review < ApplicationRecord
  belongs_to :professor
  belongs_to :my_class
end
