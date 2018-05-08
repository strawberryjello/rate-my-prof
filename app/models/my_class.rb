class MyClass < ApplicationRecord
  validates :name, uniqueness: true
end
