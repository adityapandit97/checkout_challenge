# frozen_string_literal: true

# bulk_offer
class BulkOffer
  attr_accessor :discount_per_item

  def initialize(code, quantity, discount_per_item)
    @code = code
    @quantity = quantity
    @discount_per_item = discount_per_item
  end

  def apply(carts)
    selected_carts = carts.select { |i| i.code == @code }
    selected_carts.each { |item| item.price -= @discount_per_item } if selected_carts.size >= @quantity
  end
end
