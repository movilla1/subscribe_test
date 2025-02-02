# frozen_string_literal: true

# This class is responsible for calculating the total sales tax and total price
# It receives an array of hashes and calculates the total sales tax and total price
# It returns a hash with the total sales tax and total price
class TotalCalculator
  def initialize(sales_tax_hash)
    @sales_tax_hash = sales_tax_hash.dup
  end

  def calculate
    {
      total_taxes: round_to_nearest_5_cents(total_sales_tax),
      total_price: total_price
    }
  end

  private

  def total_sales_tax
    @sales_tax_hash.sum { |item| item[:sales_tax] + item[:import_fee] }
  end

  def total_price
    @sales_tax_hash.sum { |item| item[:subtotal] }
  end

  def round_to_nearest_5_cents(number)
    cents = (number * 100).round
    remainder = cents % 5
    rounded_cents = if remainder < 3 # Round down if remainder is less than 3
                      cents - remainder
                    else # Round up if remainder is 3 or greater
                      cents + (5 - remainder)
                    end

    rounded_cents / 100.0
  end
end
