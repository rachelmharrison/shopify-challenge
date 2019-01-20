class Cart < ApplicationRecord

  has_many :products

  validates :name, presence: true
  validates :total_price

  def add_product(p)
    products.add(p)
    total_price  += p.price
  end

end
