# frozen_string_literal: true

# cart
class Cart
  attr_reader :code
  attr_accessor :price

  def initialize(code, price)
    @code = code
    @price = price
  end
end
