#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/circuit'
# To wire.rb, add attributes for parents and children,
# and an attribute for "function" and `run` method;
#
# Or maybe on the `signal` method on circuit, it should go up the chain
# of parents to find the top parent, and then cascade down that list of parents
# running `run`. Then we only run the functions we need to.

circuit = Circuit.new(debug: true)

File.open('../day_7_input.txt', 'r') do |f|
  f.each_line do |line|
    puts line
    circuit.parse(line)
  end
end

# Part 1
solution1 = circuit.signal('a')

# Part 2
puts '========================='
puts '+ PART TWO CALCULATIONS +'
puts '========================='
circuit.wire('b').function = -> { solution1 }
circuit.reset
solution2 = circuit.signal('a')

puts '=========='
puts '+ Part 1 +'
puts '=========='
puts "Signal on wire a: #{solution1}" # 46065

puts '=========='
puts '+ Part 2 +'
puts '=========='
puts "Signal on wire a: #{solution2}" # 14134
