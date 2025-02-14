# frozen_string_literal: true
require_relative '../../services/base_service'
require_relative '../../services/item_subtotal_calculator'
require_relative '../spec_helper'

describe ItemSubtotalCalculator do # rubocop:disable Metrics/BlockLength
  let(:input) do
    [
      { quantity: 2, product: 'book', price: 12.49, imported: false, exempt: true, sales_tax: 0.0, import_fee: 0.0 },
      { quantity: 1, product: 'music CD', price: 14.99, imported: false, exempt: false, sales_tax: 1.5,
        import_fee: 0.0 },
      { quantity: 1, product: 'chocolate bar', price: 0.85, imported: false, exempt: true, sales_tax: 0.0,
        import_fee: 0.0 },
      { quantity: 2, product: 'imported chocolate bar', price: 1.10, imported: true, exempt: true, sales_tax: 0.0,
        import_fee: 0.1 }
    ]
  end

  let(:result) do
    [
      { quantity: 2, product: 'book', price: 12.49, imported: false, exempt: true, sales_tax: 0.0, import_fee: 0.0,
        subtotal: 24.98 },
      { quantity: 1, product: 'music CD', price: 14.99, imported: false, exempt: false, sales_tax: 1.5,
        import_fee: 0.0, subtotal: 16.49 },
      { quantity: 1, product: 'chocolate bar', price: 0.85, imported: false, exempt: true, sales_tax: 0.0,
        import_fee: 0.0, subtotal: 0.85 },
      { quantity: 2, product: 'imported chocolate bar', price: 1.10, imported: true, exempt: true, sales_tax: 0.0,
        import_fee: 0.1, subtotal: 2.40 }
    ]
  end

  it 'calculates the subtotal for each item' do
    input.each_with_index do |row, index|
      item_subtotal_calculator = ItemSubtotalCalculator.new(debug: false).calculate(row)
      expect(item_subtotal_calculator).to eq(result[index])
    end
  end
end
