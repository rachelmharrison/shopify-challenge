require 'test_helper'

class Resolvers::GetAllProductsTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::GetAllProducts.new.call(nil, args, {})
  end

  test 'getting all products without argument' do
    products = perform()
    assert_equal products.length, 2
  end


  test 'getting all products with in_stock equal to true' do
    products = perform({in_stock: true})
    assert_equal products.length, 1
  end


end