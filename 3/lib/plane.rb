# frozen_string_literal: true

class Plane
  attr_reader :point

  def initialize
    @point = [0, 0]
  end

  # @param direction [String]
  def move(direction)
    case direction
    when '^'
      @point[1] += 1
    when 'v'
      @point[1] -= 1
    when '>'
      @point[0] += 1
    when '<'
      @point[0] -= 1
    end

    point
  end
end
