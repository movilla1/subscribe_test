# frozen_string_literal: true

# Calculates the sales tax and import fee for each item in the input
# input: Array of Hashes containing the item details
# output: Array of Hashes containing the item details with sales tax and import fee
class SalesTaxCalculator < BaseService
  def calculate(item)
    my_item = item.dup
    my_item[:sales_tax] = calculate_sales_tax(my_item)
    my_item[:import_fee] = calculate_import_fee(my_item)
    debug_output('Sales tax for item:', my_item)
    my_item
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
