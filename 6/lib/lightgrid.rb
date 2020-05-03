# frozen_string_literal: true

class LightGrid
  attr_reader :grid

  def initialize
    @grid = Array.new(1000).map! { |n| n = Array.new(1000, 0) }
  end

  def turn_on(x, y)
    @grid[x][y] = 1
  end

  def turn_off(x, y)
    @grid[x][y] = 0
  end

  def toggle(x, y)
    @grid[x][y] = if @grid[x][y].zero?
                    1
                  else
                    0
                  end
  end

  def count
    grid.flatten.reduce(&:+)
  end
end

class LightGridEnhanced < LightGrid
  def turn_on(x, y)
    @grid[x][y] += 1
  end

  def turn_off(x, y)
    @grid[x][y] -= 1 unless @grid[x][y].zero?
  end

  def toggle(x, y)
    @grid[x][y] += 2
  end
end
