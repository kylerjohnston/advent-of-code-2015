#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/flightpath'
require_relative '../lib/navigator'
require_relative '../lib/flights'

class TestDay3 < Minitest::Test
  def test_1
    fp = FlightPath.new('>'.split(''))
    assert_equal 2, fp.count_houses_visited
  end

  def test_2
    fp = FlightPath.new('^>v<'.split(''))
    assert_equal 4, fp.count_houses_visited
  end

  def test_3
    fp = FlightPath.new('^v^v^v^v^v'.split(''))
    assert_equal 2, fp.count_houses_visited
  end

  def test_4
    navigator = Navigator.new('^v')
    santa = FlightPath.new(navigator.santa_path)
    robot = FlightPath.new(navigator.robot_path)
    flights = Flights.new(santa, robot)
    assert_equal 3, flights.count_houses_visited 
  end

  def test_5
    navigator = Navigator.new('^>v<')
    santa = FlightPath.new(navigator.santa_path)
    robot = FlightPath.new(navigator.robot_path)
    flights = Flights.new(santa, robot)
    assert_equal 3, flights.count_houses_visited
  end

  def test_6
    navigator = Navigator.new('^v^v^v^v^v')
    santa = FlightPath.new(navigator.santa_path)
    robot = FlightPath.new(navigator.robot_path)
    flights = Flights.new(santa, robot)
    assert_equal 11, flights.count_houses_visited
  end
end
