#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'presents'

class TestPresents < Minitest::Test
  def test_one
    present = Present.new(2, 3, 4)
    assert_equal 58, present.wrapping_paper
    assert_equal 34, present.ribbon_length
  end

  def test_two
    present = Present.new(1, 1, 10)
    assert_equal 43, present.wrapping_paper
    assert_equal 14, present.ribbon_length
  end
end
