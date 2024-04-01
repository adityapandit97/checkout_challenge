# frozen_string_literal: true

require_relative 'shop'
require_relative 'cart'
require 'byebug'

# checkout
class Checkout
  attr_reader :shop, :carts

  def initialize(pricing_rules)
    @rules = pricing_rules
    voucher = Product.new('VOUCHER', 'test Voucher', 5.00)
    tshirt = Product.new('TSHIRT', 'test T-Shirt', 20.00)
    mug = Product.new('MUG', 'test Mug', 7.50)
    @shop = Shop.new(voucher, tshirt, mug)
    @carts = []
    @valid_codes = @shop.valid_codes
  end

  def scan(code)
    if @valid_codes.include?(code)
      product = @shop.find(code)
      cart = Cart.new(product.code, product.price)
      @carts.push(cart)
      true
    else
      false
    end
  end

  def show
    carts = @carts.map(&:code).join(', ')
    puts carts.size.positive? ? "carts: #{carts}" : 'No carts to checkout'
    puts "Total: #{total}$"
  end

  def total
    @rules.each { |rule| rule.apply(@carts) }
    @carts.inject(0.0) { |total, cart| total + cart.price }
  end
end
