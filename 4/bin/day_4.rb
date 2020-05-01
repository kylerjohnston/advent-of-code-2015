#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/md5problem.rb'

# Day 4 Part 1
hasher = MD5Hasher.new('ckczppom')
solution = hasher.find_lowest_int
puts "Lowest integer for part 1: #{solution}"

# Day 4 Part 2
solution2 = hasher.find_lowest_int(zeroes: 6)
puts "Lowest integer for part 2 (six zeroes): #{solution2}"
