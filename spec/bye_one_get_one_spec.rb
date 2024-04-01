# frozen_string_literal: true

require_relative '../lib/buy_one_get_one'
require 'byebug'

RSpec.describe BuyOneGetOne do
  describe '#apply' do
    it 'applies "buy one, get one free" offer to the cart' do
      buy_one_get_one = BuyOneGetOne.new('VOUCHER')
      carts = Array.new(4) { Cart.new('VOUCHER', 5.0) }
      buy_one_get_one.apply(carts)

      expect(carts[0].price).to eq(5.0)
      expect(carts[1].price).to eq(0.0)
      expect(carts[2].price).to eq(5.0)
      expect(carts[3].price).to eq(0.0)
    end
  end
end
