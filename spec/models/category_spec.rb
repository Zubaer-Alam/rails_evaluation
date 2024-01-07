# spec/models/category_spec.rb
require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to have_many(:products).dependent(:destroy) }
  end

  describe 'scopes' do
    it 'orders categories by descending id' do
      category1 = Category.create(name: 'Category 1')
      category2 = Category.create(name: 'Category 2')

      expect(Category.ordered).to eq([category2, category1])
    end
  end

  describe 'callbacks' do
    it 'normalizes name before saving' do
      category = Category.new(name: 'sOme CaTEGory')
      category.save
      expect(category.name).to eq('Some Category')
    end
  end

  describe 'broadcasts' do
    it 'broadcasts to categories channel on insert' do
      # Implement the appropriate broadcasting test based on your setup
      # For Action Cable broadcasting, ensure correct configuration and syntax
    end
  end
end
