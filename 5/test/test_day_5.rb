#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/santastring'

class TestSantaString < Minitest::Test
  def test_part1
    assert_equal true, 'ugknbfddgicrmopn'.nice?
    assert_equal true, 'aaa'.nice?
    assert_equal false, 'jchzalrnumimnmhp'.nice?
    assert_equal false, 'haegwjzuvuyypxyu'.nice?
    assert_equal false, 'dvszwmarrgswjxmb'.nice?
  end

  def test_part2
    assert_equal true, 'qjhvhtzxzqqjkmpb'.nicer?
    assert_equal true, 'xxyxx'.nicer?
    assert_equal false, 'uurcxstgmygtbstg'.nicer?
    assert_equal false, 'ieodomkazucvgmuy'.nicer?
  end
end
