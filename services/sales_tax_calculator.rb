# frozen_string_literal: true

# Calculates the sales tax and import fee for each item in the input
# input: Array of Hashes containing the item details
# output: Array of Hashes containing the item details with sales tax and import fee
class SalesTaxCalculator
  def initialize(input)
    @input = input.dup
  end

  def calculate
    @input.map do |item|
      item[:sales_tax] = calculate_sales_tax(item)
      item[:import_fee] = calculate_import_fee(item)
      item
    end
  end

  private

  def calculate_sales_tax(item)
    return 0 if item[:exempt]

    subtotal_price = item[:price]
    (subtotal_price * 0.1).round(4)
  end

  def calculate_import_fee(item)
    return 0 unless item[:imported]

    (item[:price] * 0.05).round(4)
  end
end
