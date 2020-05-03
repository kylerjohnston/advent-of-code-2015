# frozen_string_literal: true

require_relative 'lightgrid'

class LightController
  attr_reader :grid
  
  def initialize(grid: 'standard')
    case grid
    when 'standard'
      @grid = LightGrid.new
    when 'enhanced'
      @grid = LightGridEnhanced.new
    end
  end

  # @param parse [String] a raw string instruction from AoC
  def parse(instruction)
    pattern = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/
    match = pattern.match(instruction)
    action = match[1].gsub(' ', '_')
    start = [match[2].to_i, match[3].to_i]
    finish = [match[4].to_i, match[5].to_i]
    update_grid(action, start, finish)
  end

  def count
    grid.count
  end

  private

  def update_grid(action, start, finish)
    (start[0]..finish[0]).each do |i|
      (start[1]..finish[1]).each do |j|
        grid.send(action.to_s, i, j)
      end
    end
  end
end
