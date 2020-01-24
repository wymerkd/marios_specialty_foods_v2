class Product < ApplicationRecord
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(5)
    )}
  scope :locally_made, -> { where(country: "United States") }
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 40
  before_save(:titleize_product)

 private
   def titleize_product
     self.name = self.name.titleize
     self.country = self.country.titleize
   end
end
