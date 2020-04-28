#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'floor_calculator'

class TestFloorDirections < Minitest::Test
  def test_position
    tests = [
      {dir: ')', pos: 1},
      {dir: '()())', pos: 5}
    ]

    tests.each do |t|
      assert_equal t[:pos], FloorDirections.new(t[:dir]).position(-1)
    end
  end
    
  def test_directions
    dirs = [
      {
        floor: 0,
        directions:  [
          '(())',
          '()()'
        ]
      },
      {
        floor: 3,
        directions: [
          '(((',
          '(()(()(',
          '))((((('
        ]
      },
      {
        floor: -1,
        directions: [
          '())',
          '))('
        ]
      },
      {
        floor: -3,
        directions: [
          ')))',
          ')())())'
        ]
      }
    ]

    dirs.each do |dir_group|
      dir_group[:directions].each do |dir|
        assert_equal dir_group[:floor], FloorDirections.new(dir).final_floor
      end
    end
  end
end
