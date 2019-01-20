require 'test_helper'

class Resolvers::CreateCartTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateCart.new.call(nil, args, {})
  end

  test 'creating a new product with valid args' do
    cart = perform(
        name: 'Test Cart'
    )

    assert cart.persisted?
    assert_equal cart.name, 'Test Cart'
  end

  test 'creating a new product with missing name' do
    assert_raises (GraphQL::ExecutionError) do
      perform
    end
  end

end