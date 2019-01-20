class Resolvers::GetAllProducts < GraphQL::Function
  argument :in_stock, types.Boolean, default_value: false


  type types[Types::ProductType]

  def call(_obj, args, _ctx)

    if (args[:in_stock])
      Product.where("inventory_count > 0")
    else
      Product.all
    end
  rescue ActiveRecord::RecordNotFound => e
    raise GraphQL::ExecutionError.new("Invalid input: #{e}")
  end
end