class Brand < ApplicationRecord
  before_validation :normalize_name, on: :create
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(_brand) { 'brands' }, inserts_by: :prepend

  private

  def normalize_name
    self.name = name.downcase.capitalize
  end
end
