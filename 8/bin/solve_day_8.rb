#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/list_parser'

parser = ListParser.new('../input_day_8.txt')

puts '=========='
puts '+ Part 1 +'
puts '=========='
puts "Part 1 difference: #{parser.size - parser.rendered_size}"

puts '=========='
puts '+ Part 2 +'
puts '=========='
puts "Part 2 difference: #{parser.encoded_size - parser.size}"
