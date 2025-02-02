# frozen_string_literal: true

require_relative '../../services/total_calculator'
require_relative '../spec_helper'

describe TotalCalculator do
  let(:input) do
    [
      { exempt: true, quantity: 2, product: 'book', price: 12.49, imported: false, sales_tax: 0.0,
        import_fee: 0.0, subtotal: 24.98 },
      { exempt: false, quantity: 1, product: 'music CD', price: 14.99, imported: false, sales_tax: 1.5,
        import_fee: 0.0, subtotal: 16.49 },
      { exempt: true, quantity: 1, product: 'chocolate bar', price: 0.85, imported: false, sales_tax: 0.0,
        import_fee: 0.0, subtotal: 0.85 }
    ]
  end

  it 'calculates the total sales tax and total price' do
    total_calculator = TotalCalculator.new(input)
    expect(total_calculator.calculate).to eq(total_taxes: 1.5, total_price: 42.32)
  end
end
