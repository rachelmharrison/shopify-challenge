require 'test_helper'

class Resolvers::GetProductTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::GetProduct.new.call(nil, args, {})
  end

  setup do

  end

  test 'getting one product from name' do
    product = perform(title: 'Apple')
    assert_equal 'Apple', product.title
  end

  test 'getting a product that does not exist' do
    assert_raises (GraphQL::ExecutionError) do
      perform(title: 'Nothing')
    end
  end


end