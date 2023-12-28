class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  broadcasts_to ->(_product) { 'products' }, inserts_by: :prepend
end
