# frozen_string_literal: true

require_relative 'product'
require 'terminal-table'

# shop
class Shop
  def initialize(*args)
    @stock = args.map { |product| [product.code.to_sym, product] }.to_h
  end

  def find(code)
    @stock[code.to_sym]
  end

  def add_product(code, name, price)
    product = Product.new(code, name, price)
    @stock[code.to_sym] = product
  end

  def list
    Terminal::Table.new(title: 'Test shop', headings: %w[Code Name Price], rows: to_a)
  end

  def products_quantity
    @stock.size
  end

  def products
    @stock.values
  end

  def valid_codes
    @stock.values.map(&:code)
  end

  private

  def to_a
    @stock.map(&:to_a)
  end
end
