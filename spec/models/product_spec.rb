require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(40) }
  it("titleizes the name of a product and country") do
    product = Product.create({name: "mario's better batter", cost: 2.99, country: "mexico"})
    expect(product.name()).to(eq("Mario's Better Batter"))
    expect(product.country()).to(eq("Mexico"))
  end
end
