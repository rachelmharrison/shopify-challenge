class Resolvers::CreateCart < GraphQL::Function
  argument :name, !types.String

  type Types::CartType

  def call(_obj, args, _ctx)
    Cart.create!(
        name: args[:name],
        total_price: 0
    )
  rescue ActiveRecord::RecordInvalid => e
    raise GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end