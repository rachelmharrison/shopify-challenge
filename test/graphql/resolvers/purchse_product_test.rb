require 'test_helper'

class Resolvers::PurchaseProductTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::PurchaseProduct.new.call(nil, args, {})
  end

  setup do

  end

  test 'purchasing product with inventory' do
    product = Product.find_by(title: 'Apple')
    assert_equal 6, product.inventory_count.to_i
    perform(title: 'Apple')
    product = Product.find_by(title: 'Apple')
    assert_equal 5, product.inventory_count.to_i
  end

  test 'purchasing a product that does not exist' do
    assert_raises (GraphQL::ExecutionError) do
      perform(title: 'Nothing')
    end
  end

  test 'purchasing a product that has no inventory' do
    assert_raises (GraphQL::ExecutionError) do
      perform(title: 'Banana')
    end
  end


end