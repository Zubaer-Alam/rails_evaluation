class Brand < ApplicationRecord
  before_validation :normalize_name, on: :create

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :ordered, -> { order(id: :desc) }

  private
  def normalize_name
    self.name = name.downcase.capitalize
  end
end
