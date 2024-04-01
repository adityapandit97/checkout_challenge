# frozen_string_literal: true

require_relative '../lib/cart'

RSpec.describe Cart do
  describe '#initialize' do
    it 'initializes with correct attributes' do
      cart = Cart.new('CODE', 10.0)
      expect(cart.code).to eq('CODE')
      expect(cart.price).to eq(10.0)
    end
  end
end
