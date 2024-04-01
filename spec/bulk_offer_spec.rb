# frozen_string_literal: true

require_relative '../lib/bulk_offer'
require 'byebug'

RSpec.describe BulkOffer do
  describe '#apply' do
    it 'applies bulk offer discount to the cart' do
      bulk_offer = BulkOffer.new('TSHIRT', 3, 1)
      carts = Array.new(4) { Cart.new('TSHIRT', 20.0) }
      bulk_offer.apply(carts)

      expect(carts[0].price).to eq(19.0)
      expect(carts[1].price).to eq(19.0)
      expect(carts[2].price).to eq(19.0)
    end
  end
end
