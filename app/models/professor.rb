class Professor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_and_belongs_to_many :my_classes
  has_many :reviews, dependent: :destroy

  def full_name
    "#{last_name}, #{first_name}"
  end
end
