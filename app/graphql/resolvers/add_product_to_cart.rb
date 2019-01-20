class Resolvers::AddProductToCart < GraphQL::Function
  argument :name, !types.String
  argument :product_title, !types.String

  type Types::CartType

  def call(_obj, args, _ctx)
    product = Product.find_by
    if(args[product].inventory_count <= 0)
      raise GraphQL::ExecutionError.new("Product cannot be added because there is no stock.")
    end
    Cart.addProduct(args[:product])
  rescue ActiveRecord::RecordInvalid => e
    raise GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end