require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

    it 'validates the length of name' do
      is_expected.to validate_length_of(:name).is_at_most(25)
    end

    it 'normalizes name before saving' do
      category = Category.new(name: 'sOme CaTEGory')
      category.save
      expect(category.name).to eq('Some Category')
    end
    
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

    it 'does not include categories with blank names in ordered scope' do
      category1 = Category.create(name: 'Category 1')
      category2 = Category.create(name: '')

      expect(Category.ordered).not_to include(category2)
    end
  end

  describe 'callbacks' do
    it 'normalizes name before saving' do
      category = Category.new(name: 'sOme CaTEGory')
      category.save
      expect(category.name).to eq('Some Category')
    end

    it 'does not change the name if already in correct format' do
      category = Category.new(name: 'Some Category')
      category.save
      expect(category.name).to eq('Some Category')
    end
  end
end
