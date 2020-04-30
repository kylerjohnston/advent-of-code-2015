#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/flightpath'
require_relative '../lib/navigator'
require_relative '../lib/flights'

File.open('./input_day_3.1.txt', 'r') do |f|
  navigator = Navigator.new(f.read)
  santa_part_1 = FlightPath.new(navigator.directions)
  puts '+========+'
  puts '| Part 1 |'
  puts '+========+'
  puts "Santa visited #{santa_part_1.count_houses_visited} unique houses."
  # Part 1 solution: 2565
  puts ''
  puts '+========+'
  puts '| Part 2 |'
  puts '+========+'

  santa = FlightPath.new(navigator.santa_path)
  robot = FlightPath.new(navigator.robot_path)
  flights = Flights.new(santa, robot)
  puts "Santa and his robot together visited #{flights.count_houses_visited} unique houses."
  # Part 2 solution: 2639
end
