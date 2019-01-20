class Resolvers::PurchaseProduct < GraphQL::Function
  argument :title, !types.String

  type Types::ProductType

  def call(_obj, args, _ctx)
    @product = Product.find_by(title: args[:title])
    if(@product.blank?)
      raise GraphQL::ExecutionError.new('Product does not exist and was not purchased.')

    end
    if @product.inventory_count <= 0
      raise GraphQL::ExecutionError.new('Product is not in stock and was not purchased.')
    end


    @product.update_attributes!(
        inventory_count: (@product.inventory_count.to_i - 1)
    )

    @product

  rescue ActiveRecord::RecordInvalid => e
    raise GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end

end