#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/list_string'
require_relative '../lib/list_parser'

class TestListString < Minitest::Test
  def test_list_string
    string1 = ListString.new(['"', '"'])
    assert_equal 2, string1.size
    assert_equal 0, string1.rendered_size
    assert_equal 6, string1.encoded_size

    string2 = ListString.new(['"', 'a', 'b', 'c', '"'])
    assert_equal 5, string2.size
    assert_equal 3, string2.rendered_size
    assert_equal 9, string2.encoded_size

    string3 = ListString.new(['"', 'a', 'a', 'a', '\\', '"',
                              'a', 'a', 'a', '"'])
    assert_equal 10, string3.size
    assert_equal 7, string3.rendered_size
    assert_equal 16, string3.encoded_size

    string4 = ListString.new(['"', '\\', 'x', '2', '7', '"'])
    assert_equal 6, string4.size
    assert_equal 1, string4.rendered_size
    assert_equal 11, string4.encoded_size
  end

  def test_list_parser
    list = ListParser.new('./test_data.txt')
    assert_equal 23, list.size
    assert_equal 11, list.rendered_size
    assert_equal 12, list.size - list.rendered_size
    assert_equal 42, list.encoded_size
  end

  def test_custom
    # "\\\\z"
    string1 = ListString.new(['"', '\\', '\\', '\\', '\\', 'z', '"'])
    assert_equal 3, string1.rendered_size
    assert_equal 7, string1.size
  end
end
