Types::ProductType = GraphQL::ObjectType.define do
  name 'Product'

  # it has the following fields
  field :id, !types.ID
  field :title, !types.String
  field :price, !types.Number
  field :inventory_count, !types.Number
end