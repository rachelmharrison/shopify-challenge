Types::CartType = GraphQL::ObjectType.define do
  name 'Cart'

  field :id, !types.ID
  field :name, !types.String
end