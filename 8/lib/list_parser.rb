# frozen_string_literal: true

require_relative 'list_string'

class ListParser
  attr_reader :strings
  
  def initialize(file)
    @strings = []
    parse(file)
  end

  def parse(file)
    File.open(file, 'r') do |f|
      char_array = []
      f.each_char do |c|
        if c == "\n"
          strings << ListString.new(char_array)
          char_array = []
        else
          char_array << c
        end
      end
    end
  end

  def size
    reduce_by_method(:size)
  end

  def rendered_size
    reduce_by_method(:rendered_size)
  end

  def encoded_size
    reduce_by_method(:encoded_size)
  end

  private

  def reduce_by_method(method)
    strings.reduce(0) { |sum, n| sum + n.send(method) }
  end
end
