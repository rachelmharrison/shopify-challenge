class Resolvers::CreateProduct < GraphQL::Function
  argument :title, !types.String
  argument :price, !types.Float
  argument :inventory_count, !types.Int

  type Types::ProductType

  def call(_obj, args, _ctx)
    Product.create!(
        title: args[:title],
        price: args[:price],
        inventory_count: args[:inventory_count]
    )
  rescue ActiveRecord::RecordInvalid => e
    raise GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end