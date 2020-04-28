# frozen_string_literal: true

class FloorDirections
  # @return [String]
  attr_reader :directions

  # @param directions [String]
  def initialize(directions)
    @directions = directions
  end

  # @return [Integer] the last floor Santa ends on
  def final_floor
    up = directions.count('(')
    down = directions.count(')')
    up - down
  end

  # @return [Integer] the position in the instructions in which santa first enters
  #   floor `floor`
  # @param floor [Integer] the floor you want to find the position of
  def position(floor)
    # Start at floor 0
    pos = 0
    directions.split('').each.with_index do |dir, i|
      case dir
      when '('
        pos += 1
      when ')'
        pos -= 1
      end

      return i + 1 if pos == floor
    end
  end
end
