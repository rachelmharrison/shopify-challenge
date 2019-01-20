class Product < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0}
  validates :inventory_count, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end