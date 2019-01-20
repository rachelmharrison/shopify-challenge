Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allProducts, function: Resolvers::GetAllProducts.new

  field :oneProduct, function: Resolvers::GetProduct.new
end
