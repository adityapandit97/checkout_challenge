# frozen_string_literal: true

require 'byebug'

# bye_one_get_one
class BuyOneGetOne
  def initialize(code)
    @code = code
  end

  def apply(carts)
    selected_carts = carts.select { |i| i.code == @code }
    return unless selected_carts.size >= 2

    selected_carts.each_slice(2) do |_item, item_free|
      item_free.price = 0 unless item_free.nil?
    end
  end
end
