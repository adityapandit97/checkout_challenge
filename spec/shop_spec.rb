# frozen_string_literal: true

require_relative '../lib/shop'

RSpec.describe Shop do
  describe '#initialize' do
    it 'initializes with products' do
      voucher = Product.new('VOUCHER', 'test Voucher', 5.00)
      tshirt = Product.new('TSHIRT', 'test T-Shirt', 20.00)
      mug = Product.new('MUG', 'test Mug', 7.50)
      shop = Shop.new(voucher, tshirt, mug)

      expect(shop.products_quantity).to eq(3)
      expect(shop.valid_codes).to contain_exactly('VOUCHER', 'TSHIRT', 'MUG')
    end
  end

  describe '#add_product' do
    it 'adds a product to the shop' do
      shop = Shop.new
      shop.add_product('CODE', 'Name', 10.0)
      expect(shop.products_quantity).to eq(1)
    end
  end

  describe '#find' do
    it 'finds a product by code' do
      product = Product.new('CODE', 'Name', 10.0)
      shop = Shop.new(product)
      expect(shop.find('CODE')).to eq(product)
    end
  end
end
