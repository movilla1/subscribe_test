# frozen_string_literal: true

# This class is responsible for calculating the subtotal for each item
# It receives an array of hashes and calculates the subtotal for each item
# It returns an array of hashes with the subtotal for each item
class ItemSubtotalCalculator
  def initialize(input_hash)
    @input_hash = input_hash.dup
  end

  def calculate
    @input_hash.each do |item|
      item[:subtotal] = (item[:price] + item[:sales_tax] + item[:import_fee]) * item[:quantity]
      item[:subtotal] = item[:subtotal].round(2)
    end
  end
end
