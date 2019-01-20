require 'test_helper'

class Resolvers::CreateProductTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateProduct.new.call(nil, args, {})
  end

  test 'creating a new product with valid args' do
    product = perform(
        title: 'Test Product',
        price: 1.23,
        inventory_count: 5
        )

    assert product.persisted?
    assert_equal product.title, 'Test Product'
    assert_equal product.price, 1.23
    assert_equal product.inventory_count, 5
  end

  test 'creating a new product with missing title' do
    assert_raises (GraphQL::ExecutionError) do
      perform(
          title: "",
          price: 1.23,
          inventory_count: 5
      )
    end
  end

  test 'creating a new product with missing price' do
    assert_raises (GraphQL::ExecutionError) do
      perform(
          title: "Test Product",
          price: '',
          inventory_count: 5
      )
    end
  end

  test 'creating a new product with missing inventory count' do
    assert_raises (GraphQL::ExecutionError) do
      perform(
          title: "Test Product",
          price: 1.23,
          inventory_count: ""
      )
    end
  end

  test 'creating a new product with invalid price' do
    assert_raises (GraphQL::ExecutionError) do
      perform(
          title: "Test Product",
          price: -1,
          inventory_count: 5
      )
    end
  end

  test 'creating a new product with invalid inventory count' do
    assert_raises (GraphQL::ExecutionError) do
      perform(
          title: "Test Product",
          price: 1.23,
          inventory_count: 5.2
      )
    end
  end

end