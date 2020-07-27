require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'should be saved to the database if the 4 fields are provided' do
      @category = Category.create(name:"test category")
      @product = Product.create(name:"Test", price: 1000, quantity: 3, category_id: @category.id)
     
      expect(@category.products).to include(@product)
      
    end
    it 'should not be saved to the database if the name field is blank' do
      @category = Category.create(name:"test category")
      @product = Product.create(name:"", price: 1000, quantity: 3, category_id: @category.id)
     
      expect(@category.products).not_to include(@product)
      
    end
    it 'should not be saved to the database if the price field is blank' do
      @category = Category.create(name:"test category")
      @product = Product.create(name:"test", quantity: 3, category_id: @category.id)
      
      expect(@category.products).not_to include(@product)
      
    end
    it 'should not be saved to the database if the quantity field is blank' do
      @category = Category.create(name:"test category")
      @product = Product.create(name:"test", price: 1000, category_id: @category.id)
     
      expect(@category.products).not_to include(@product)
      
    end
    it 'should not be saved to the database if the category_id field is blank' do
      @category = Category.create(name:"test category")
      @product = Product.create(name:"test", price: 1000, quantity: 3, price: 1000)
      
      expect(@category.products).not_to include(@product)
      
    end
   
  end
end
