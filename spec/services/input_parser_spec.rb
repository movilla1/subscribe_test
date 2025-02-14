# frozen_string_literal: true

require_relative '../../services/base_service'
require_relative '../../services/input_parser'
require_relative '../spec_helper'

describe InputParser do # rubocop:disable Metrics/BlockLength
  it 'parses the input into a hash' do
    input_parser = InputParser.new('spec/fixtures/input1.txt')
    expect(input_parser.parse).to eq(
      [
        { quantity: 2, product: 'book', price: 12.49, imported: false, exempt: true },
        { quantity: 1, product: 'music CD', price: 14.99, imported: false, exempt: false },
        { quantity: 1, product: 'chocolate bar', price: 0.85, imported: false, exempt: true }
      ]
    )
  end

  context 'with imported products' do
    it 'parses the input into a hash' do
      input_parser = InputParser.new('spec/fixtures/input2.txt')
      expect(input_parser.parse).to eq(
        [
          { quantity: 1, product: 'imported box of chocolates', price: 10.00, imported: true, exempt: true },
          { quantity: 1, product: 'imported bottle of perfume', price: 47.50, imported: true, exempt: false }
        ]
      )
    end
  end

  context 'with multiple quantities' do
    it 'parses the input into a hash' do
      input_parser = InputParser.new('spec/fixtures/input3.txt')
      expect(input_parser.parse).to eq(
        [
          { quantity: 1, product: 'imported bottle of perfume', price: 27.99, imported: true, exempt: false },
          { quantity: 1, product: 'bottle of perfume', price: 18.99, imported: false, exempt: false },
          { quantity: 1, product: 'packet of headache pills', price: 9.75, imported: false, exempt: true },
          { quantity: 3, product: 'imported boxes of chocolates', price: 11.25, imported: true, exempt: true }
        ]
      )
    end
  end
end
