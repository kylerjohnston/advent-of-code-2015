# frozen_string_literal: true

require_relative 'flighty'

class Flights
  include Flighty

  attr_reader :flightpaths

  def initialize(*flightpaths)
    @flightpaths = flightpaths
  end

  def houses_visited
    flightpaths.map(&:houses_visited).reduce { |sum, n| sum + n }
  end
end
