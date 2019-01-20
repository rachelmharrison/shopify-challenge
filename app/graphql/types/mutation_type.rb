Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createProduct, function: Resolvers::CreateProduct.new

  field :createCart, function: Resolvers::CreateCart.new

  field :addProductToCart, function: Resolvers::AddProductToCart.new
end

