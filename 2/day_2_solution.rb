#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'presents'

total_wrapping_paper = 0
total_ribbon = 0
File.open('./day_2.1.input.txt', 'r') do |f|
  f.each_line do |line|
    present = Present.new(*line.split('x').map(&:to_i))
    total_wrapping_paper += present.wrapping_paper
    total_ribbon += present.ribbon_length
  end
end

puts '=========='
puts '+ Part 1 +'
puts '=========='
puts "Total wrapping paper: #{total_wrapping_paper}"
# Solution: 1606483
puts ''
puts '=========='
puts '+ Part 2 +'
puts '=========='
puts "Total ribbon: #{total_ribbon}"
# Solution: 3842356
