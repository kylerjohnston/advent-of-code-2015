# frozen_string_literal: true

require_relative 'plane'
require_relative 'flighty'

class FlightPath
  include Flighty
  
  attr_reader :houses_visited, :directions, :plane

  # @param dir [String]
  def initialize(dir)
    @directions = dir
    @plane = Plane.new
    @houses_visited = []
    follow_directions
  end

  private

  def follow_directions
    visit_house([0, 0])

    directions.each do |dir|
      plane.move(dir)
      visit_house(plane.point.dup)
    end
  end

  def visit_house(point)
    @houses_visited << point
  end
end
