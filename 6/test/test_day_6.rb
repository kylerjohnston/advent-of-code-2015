#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/light_controller'

class TestDay6 < Minitest::Test
  def test_part1_1
    controller = LightController.new
    controller.parse('turn on 0,0 through 999,999')
    assert_equal 1_000_000, controller.count
  end

  def test_part1_2
    controller = LightController.new
    controller.parse('toggle 0,0 through 999,0')
    assert_equal 1000, controller.count

    controller.parse('toggle 0,0 through 999,0')
    assert_equal 0, controller.count
  end

  def test_part1_3
    controller = LightController.new
    controller.parse('turn on 0,0 through 999,999')
    controller.parse('turn off 499,499 through 500,500')
    assert_equal 1_000_000 - 4, controller.count
  end

  def test_part2_1
    controller = LightController.new(grid: 'enhanced')
    controller.parse('turn on 0,0 through 0,0')
    assert_equal 1, controller.count
   
    controller.parse('turn on 0,0 through 0,0')
    assert_equal 2, controller.count
  end

  def test_part2_2
    controller = LightController.new(grid: 'enhanced')
    controller.parse('toggle 0,0 through 999,999')

    assert_equal 2_000_000, controller.count

    controller.parse('toggle 0,0 through 999,999')
    assert_equal 4_000_000, controller.count
  end
end
