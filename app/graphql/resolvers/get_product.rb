class Resolvers::GetProduct < GraphQL::Function
  argument :title, !types.String

  type Types::ProductType

  def call(_obj, args, _ctx)
    Product.find_by!( title: args[:title] )
  rescue ActiveRecord::RecordNotFound => e
    raise GraphQL::ExecutionError.new("Invalid input: #{e}")
  end
end