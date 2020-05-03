#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/santastring'

nice_count = 0
nicer_count = 0
File.open('../day_5_input.txt', 'r') do |f|
  f.each_line do |s|
    nice_count += 1 if s.nice?
    nicer_count += 1 if s.nicer?
  end
end

puts '=========='
puts '+ Part 1 +'
puts '=========='
puts "Number of nice strings: #{nice_count}" # 238
puts ''
puts '=========='
puts '+ Part 2 +'
puts '=========='
puts "Number of nicer strings: #{nicer_count}" # 69
