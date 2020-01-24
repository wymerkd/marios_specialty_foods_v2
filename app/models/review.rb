class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 5,  only_integer: true }
  validates_length_of :author, maximum: 40
  validates_length_of :content, minimum: 50
  validates_length_of :content, maximum: 250
end
