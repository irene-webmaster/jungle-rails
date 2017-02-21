require 'rails_helper'
require_relative '../../app/models/product'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'has all valid fields' do
      @category = Category.create(:name => 'Furniture')
      @product = @category.products.create(:name => 'Pants', :price => 1200, :quantity => 2)
      expect(@product).to be_valid

    end

    it 'is not valid without a name' do
      @category = Category.create(:name => 'Furniture')
      @product = @category.products.create(:name => '', :price => 1200, :quantity => 2)
      expect(@product).to_not be_valid
      #byebug
      expect(@product.errors.messages[:name][0]).to eq("can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.create(:name => 'Furniture')
      @product = @category.products.create(:name => 'Pants', :price => nil, :quantity => 2)
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price][0]).to eq("is not a number")
      expect(@product.errors.messages[:price][1]).to eq("can't be blank")
    end

    it 'is not valid without quantity' do
      @category = Category.create(:name => 'Furniture')
      @product = @category.products.create(:name => 'Pants', :price => 1200, :quantity => nil)
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity][0]).to eq("can't be blank")
    end

    it 'is not valid without category' do
      @category = Category.create(:name => 'Furniture')
      @product = @category.products.create(:name => 'Pants', :price => 1200, :quantity => nil)
      expect(@product.category).to_not eq('')
    end

  end
end
