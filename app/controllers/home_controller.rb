class HomeController < ApplicationController

  def index
    @products_most_reviews = Product.most_reviews
    @products_most_recent = Product.three_most_recent
    @products_locally_made = Product.locally_made
    render :index
  end
end
