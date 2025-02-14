# frozen_string_literal: true

# This class will parse txt input files into a hash
# The hash will contain the quantity, product name, price, and whether the product is imported or exempt from sales tax
# The parse method will return an array of hashes
class InputParser < BaseService
  attr_reader :file_path

  EXEMPT_PRODUCTS = %w[book books chocolate chocolates pill pills].freeze

  def initialize(file_path)
    @file_path = file_path
    super(debug: false) # edit if needed.
  end

  def parse
    File.open(file_path).map do |line|
      quantity, *product, price = line.split
      {
        quantity: quantity.to_i,
        product: product.join(' ').sub(' at', ' ').strip,
        price: price.to_f,
        imported: product.include?('imported'),
        exempt: EXEMPT_PRODUCTS.any? { |word| product.include?(word) }
      }
    end
  end
end
