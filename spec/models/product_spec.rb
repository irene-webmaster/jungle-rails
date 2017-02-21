require 'rails_helper'
require_relative '../../app/models/product'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @category = Category.create! name: 'Furniture'
      @product = @category.products.create!(
        name: 'Table',
        description: 'A really cool shirt.',
        image: 'test.jpg',
        price: 1200,
        quantity: 2
      )
    end

    it 'has all valid fields' do
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product.name = ''
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name][0]).to eq("can't be blank")
      #byebug
    end

    it 'is not valid without a price' do
      @product.price = ''
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price][0]).to match("is not a number")
    end

    it 'is not valid without quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity][0]).to eq("can't be blank")
    end

    it 'is not valid without category' do
      expect(@product.category).to_not eq('')
    end

  end
end
