# frozen_string_literal: true

# This class is responsible for formatting the output
# It receives an array of hashes and prints the formatted output
# It also calculates the total sales tax and total price
class OutputFormatter
  def initialize(input_hash, totals_hash)
    @input_hash = input_hash
    @totals_hash = totals_hash
  end

  def format
    @input_hash.each do |item|
      subtotal = sprintf('%.2f', item[:subtotal].round(2))
      puts "#{item[:quantity]} #{item[:product]}: #{subtotal}"
    end
    sales_tax = sprintf('%.2f', @totals_hash[:total_taxes].round(2))
    puts "Sales Taxes: #{sales_tax}"
    total = sprintf('%.2f', @totals_hash[:total_price].round(2))
    puts "Total: #{total}"
  end
end
