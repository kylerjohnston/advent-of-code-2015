#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/light_controller.rb'

controller = LightController.new
controller2 = LightController.new(grid: 'enhanced')

File.open('../day_6_input.txt', 'r') do |f|
  f.each_line do |line|
    puts line
    controller.parse(line)
    controller2.parse(line)
  end
end

puts ''
puts '=========='
puts '+ Part 1 +'
puts '=========='
puts "Lights: #{controller.count}" # 377891
puts ''
puts '=========='
puts '+ Part 2 +'
puts '=========='
puts "Brightness: #{controller2.count}" # 14110788
