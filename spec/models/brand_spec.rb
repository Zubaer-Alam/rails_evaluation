require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'validates that :name is case-insensitively unique' do
      FactoryBot.create(:brand, name: 'Some Brand')

      should validate_uniqueness_of(:name).case_insensitive
    end

    it 'validates the length of name' do
      is_expected.to validate_length_of(:name).is_at_most(25)
    end

    it 'normalizes name before saving' do
      brand = Brand.new(name: 'sOme BrANd')
      brand.save
      expect(brand.name).to eq('Some Brand')
    end
    
  end

  describe 'associations' do
    it { is_expected.to have_many(:products).dependent(:destroy) }
  end

  describe 'scopes' do
    # Add your scope tests here if applicable
  end

  describe 'callbacks' do
    it 'normalizes name before saving' do
      brand = Brand.new(name: 'sOme BrANd')
      brand.save
      expect(brand.name).to eq('Some Brand')
    end

    it 'does not change the name if already in correct format' do
      brand = Brand.new(name: 'Some Brand')
      brand.save
      expect(brand.name).to eq('Some Brand')
    end
  end
end
