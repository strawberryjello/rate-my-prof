class Professor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_and_belongs_to_many :my_classes
  has_many :reviews, dependent: :destroy

  def full_name
    "#{last_name}, #{first_name}"
  end

  def average_rating_for(my_class)
    reviews.where({my_class_id: my_class.id}).average(:rating).try(:truncate, 2)
  end

  def average_rating
    reviews.average(:rating).try(:truncate, 2)
  end
end
