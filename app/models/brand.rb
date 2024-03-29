class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false },length:{maximum: 25}
  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(_brand) { 'brands' }, inserts_by: :prepend

  before_validation :normalize_name

  private

  def normalize_name
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
  end
end
