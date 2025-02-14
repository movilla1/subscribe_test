# frozen_string_literal: true

# This class is responsible for calculating the subtotal for each item
# It receives an item calculates the subtotal for it
# It returns a new item with completed details
class ItemSubtotalCalculator < BaseService
  def calculate(item)
    my_item = item.dup
    my_item[:subtotal] = (item[:price] + item[:sales_tax] + item[:import_fee]) * item[:quantity]
    my_item[:subtotal] = my_item[:subtotal].round(2)
    debug_output('Item w/subtotal:', my_item)
    my_item
  end
end
