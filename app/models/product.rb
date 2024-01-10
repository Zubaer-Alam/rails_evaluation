class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  scope :ordered, -> {order(id: desc)}
  broadcasts_to ->(_product) { 'products' }, inserts_by: :prepend

  before_validation :normalize_name
  
  private

  def normalize_name
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
  end
end
