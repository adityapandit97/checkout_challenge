# frozen_string_literal: true

require_relative 'lib/checkout'
require_relative 'lib/bulk_offer'
require_relative 'lib/buy_one_get_one'

def indicator
  print '--> '
end

def next_line
  puts "\n"
end

@rule_one = BuyOneGetOne.new('VOUCHER')
@rule_two = BulkOffer.new('TSHIRT', 3, 1.0)
@checkout = Checkout.new([@rule_one, @rule_two])
@shop = @checkout.shop

option = 0
while option != 6
  puts '
    Welcome to Shop

    1. Shop
    2. Find Product
    3. Create Product
    4. Select Product
    5. Total
    6. Exit
  '
  indicator

  option = gets.chomp.to_i
  next_line

  case option
  when 1
    puts @shop.list

  when 2
    puts 'Enter Product code'
    indicator
    code = gets.chomp

    product = @shop.find(code)
    next_line
    puts product.nil? ? 'Sorry, Product does not exist' : product.to_s
  when 3
    puts 'Please enter Code:'
    indicator
    code = gets.chomp
    indicator
    puts 'Please enter Name:'
    indicator
    name = gets.chomp
    puts 'Please enter Price:'
    indicator
    price = gets.chomp.to_f

    @shop.add_product(code, name, price)
    product = @shop.find(code)
    next_line
    puts 'Product was created successfully'
    puts product
  when 4
    puts 'Please enter code:'
    indicator
    code = gets.chomp

    next_line
    puts @checkout.scan(code) ? 'The product was added' : 'Product does not exist'
  when 5
    @checkout.show
  when 6
    puts 'Good Bye! Visit Again'
  else
    puts 'Select a correct option'
  end
end
