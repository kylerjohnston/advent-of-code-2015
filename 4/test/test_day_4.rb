#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/md5problem'

class TestDay4 < Minitest::Test
  def test_one
    hasher = MD5Hasher.new('abcdef')
    assert_equal 609043, hasher.find_lowest_int
  end

  def test_two
    hasher = MD5Hasher.new('pqrstuv')
    assert_equal 1048970, hasher.find_lowest_int
  end
end
