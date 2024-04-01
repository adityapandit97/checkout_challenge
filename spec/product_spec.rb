# frozen_string_literal: true

require_relative '../lib/product'

RSpec.describe Product do
  describe '#initialize' do
    it 'initializes with correct attributes' do
      product = Product.new('CODE', 'Name', 10.0)
      expect(product.code).to eq('CODE')
      expect(product.name).to eq('Name')
      expect(product.price).to eq(10.0)
    end
  end
end
