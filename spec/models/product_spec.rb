require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new(name: "test_category_name")

    @product = Product.new(name: "test_name", 
                            price_cents: 99, 
                            quantity: 20,  
                            category: @category)

  end

  it "product is valid" do 
    expect(@product).to be_valid
  end

  it "should check if product has a invalid name" do
    @product.name = nil 
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it "should check if product has a valid price" do
    @product.price_cents = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Price cents is not a number")
  end

  it "should check if product has a valid quantity" do
    @product.quantity = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end

  it "should check if product has a valid category" do
    @product.category = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Category must exist")
  end
 
end