# frozen_string_literal: true

require_relative '../lib/checkout'
require 'simplecov'

RSpec.describe Checkout do
  describe '#scan' do
    it 'adds a product to the cart' do
      rule_one = instance_double('BulkOffer')
      rule_two = instance_double('BuyOneGetOne')
      checkout = Checkout.new([rule_one, rule_two])
      Array.new(4) { Product.new('TSHIRT', 'tshirt', 20.0) }

      checkout.scan('TSHIRT')
      expect(checkout.carts).not_to be_empty
    end
  end

  describe '#show' do
    it 'displays cart contents and total' do
      rule_one = instance_double('BulkOffer')
      rule_two = instance_double('BuyOneGetOne')
      checkout = Checkout.new([rule_one, rule_two])
      allow(checkout).to receive(:total).and_return(10.0)

      expect { checkout.show }.to output(/No carts to checkout/).to_stdout
    end
  end
end
