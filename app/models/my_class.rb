class MyClass < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
