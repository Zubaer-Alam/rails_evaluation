class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(_category) { 'categories' }, inserts_by: :prepend

  before_validation :normalize_name

  private

  def normalize_name
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
  end
end
