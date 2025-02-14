# frozen_string_literal: true

# This script runs the project, if you want to see step by step calculation.
# to see step by step calculations, add 'debug' as second argument

if ARGV.empty?
  puts 'Please enter the input file path'
  exit
end

debug = ARGV[1] == 'debug'

folder_path = './services/'
Dir.glob(File.join(folder_path, '*.rb')).sort.each do |file|
  require_relative file
end

input_parser = InputParser.new(ARGV[0])
pp 'Input:', input_parser.parse if debug
complete_items_hash = CalculateItemRows.new(parsed_items: input_parser.parse, debug:).calculate
pp 'Complete Items:', complete_items_hash if debug
totals_hash = TotalCalculator.new(complete_items_hash).calculate
pp 'Totals:', totals_hash if debug
OutputFormatter.new(complete_items_hash, totals_hash).format
