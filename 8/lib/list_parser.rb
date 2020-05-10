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
    strings.reduce(0) { |sum, n| sum + n.size }
  end

  def rendered_size
    strings.reduce(0) { |sum, n| sum + n.rendered_size }
  end
end
