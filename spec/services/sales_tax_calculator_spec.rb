# frozen_string_literal: true

require_relative '../../services/base_service'
require_relative '../../services/sales_tax_calculator'
require_relative '../spec_helper'

describe SalesTaxCalculator do # rubocop:disable Metrics/BlockLength
  let(:result) do
    [
      { exempt: true, quantity: 2, product: 'book', price: 12.49, imported: false, sales_tax: 0, import_fee: 0 },
      { exempt: false, quantity: 1, product: 'music CD', price: 14.99, imported: false, sales_tax: 1.499,
        import_fee: 0 },
      { exempt: true, quantity: 1, product: 'chocolate bar', price: 0.85, imported: false, sales_tax: 0,
        import_fee: 0 },
      { exempt: true, quantity: 1, product: 'imported box of chocolates', price: 10.00, imported: true,
        sales_tax: 0.0, import_fee: 0.5 },
      { exempt: false, quantity: 1, product: 'imported bottle of perfume', price: 47.50, imported: true,
        sales_tax: 4.75, import_fee: 2.375 }
    ]
  end
  let(:input) do
    [
      { quantity: 2, product: 'book', price: 12.49, imported: false, exempt: true },
      { quantity: 1, product: 'music CD', price: 14.99, imported: false, exempt: false },
      { quantity: 1, product: 'chocolate bar', price: 0.85, imported: false, exempt: true },
      { quantity: 1, product: 'imported box of chocolates', price: 10.00, imported: true, exempt: true },
      { quantity: 1, product: 'imported bottle of perfume', price: 47.50, imported: true, exempt: false }
    ]
  end

  it 'calculates the sales tax' do
    sales_tax_calculator = SalesTaxCalculator.new(debug: false)
    input.each_with_index do |item, index|
      expect(sales_tax_calculator.calculate(item)).to eq(result[index])
    end
  end
end
