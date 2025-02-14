# frozen_string_literal: true

# This class calculates the item rows, adding tax and subtotal.
class CalculateItemRows < BaseService
  attr_reader :parsed_items, :debug

  def initialize(parsed_items:, debug: false, sales_tax_calculator: SalesTaxCalculator,
                 subtotal_calculator: ItemSubtotalCalculator)
    @parsed_items = parsed_items
    @debug = debug
    @sales_tax_calculator = sales_tax_calculator.new(debug: @debug)
    @subtotal_calculator = subtotal_calculator.new(debug: @debug)
    super()
  end

  def calculate
    debug_output('processing items:', @parsed_items.count)
    @parsed_items.map do |item|
      item.merge!(@sales_tax_calculator.calculate(item))
      item.merge!(@subtotal_calculator.calculate(item))
      item
    end
    @parsed_items
  end
end
