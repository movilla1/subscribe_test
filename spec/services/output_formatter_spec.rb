# frozen_string_literal: true

require_relative '../../services/output_formatter'
require_relative '../spec_helper'

describe OutputFormatter do # rubocop:disable Metrics/BlockLength
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
  let(:totals_hash) { { total_taxes: 1.50, total_price: 42.32 } }
  it 'formats the output' do
    output_formatter = OutputFormatter.new(input, totals_hash)
    expect { output_formatter.format }.to output(
      "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n"
    ).to_stdout
  end

  context 'with imported products' do
    let(:input) do
      [
        { exempt: true, quantity: 1, product: 'imported box of chocolates', price: 10.00, imported: true, sales_tax: 0,
          import_fee: 0.5, subtotal: 10.50 },
        { exempt: false, quantity: 1, product: 'imported bottle of perfume', price: 47.50, imported: true,
          sales_tax: 4.99, import_fee: 2.38, subtotal: 50.87 }
      ]
    end
    let(:totals_hash) { { total_taxes: 5.49, total_price: 61.37 } }
    it 'formats the output for imported products' do
      output_formatter = OutputFormatter.new(input, totals_hash)
      expect { output_formatter.format }.to output(
        "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 50.87\nSales Taxes: 5.49\nTotal: 61.37\n"
      ).to_stdout
    end
  end
end
